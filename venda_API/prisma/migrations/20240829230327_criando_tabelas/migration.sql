-- CreateTable
CREATE TABLE `marcas` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(30) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `produtos` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `modelo` VARCHAR(60) NOT NULL,
    `preco` DECIMAL(10, 2) NOT NULL,
    `foto` VARCHAR(191) NOT NULL,
    `configuracao` VARCHAR(191) NOT NULL,
    `tipo` ENUM('MONITOR', 'TECLADO', 'MOUSE', 'HEADSET', 'CADEIRA', 'MESA', 'GABINETE', 'PLACA_DE_VIDEO', 'PLACA_MAE', 'PROCESSADOR', 'MEMORIA_RAM', 'HD', 'SSD', 'FONTE', 'COOLER', 'WEBCAM', 'MICROFONE', 'CAIXA_DE_SOM', 'OUTRO') NOT NULL,
    `cor` VARCHAR(191) NULL,
    `adicional` VARCHAR(191) NULL,
    `destacado` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `marcaId` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `produtos` ADD CONSTRAINT `produtos_marcaId_fkey` FOREIGN KEY (`marcaId`) REFERENCES `marcas`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
