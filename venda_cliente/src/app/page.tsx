"use client";
import { InputPesquisa } from "@/components/InputPesquisa";
import { ItemProdutos } from "@/components/ItemProdutos";
import { ProdutoI } from "@/utils/types/produtos";
import { useEffect, useState } from "react";

export default function Home() {
  const [produtos, setProdutos] = useState<ProdutoI[]>([]);

  useEffect(() => {
    async function getDados() {
      const response = await fetch(`${process.env.NEXT_PUBLIC_URL_API}/produtos`);
      const dados = await response.json();
      setProdutos(dados);
    }
    getDados();
  }, []);

  const listaProdutos = produtos.map((produto) => (
    <ItemProdutos data={produto} key={produto.id} />
  ));

  return (
    <>
    <InputPesquisa setProdutos={setProdutos} />
    <div className="mx-auto max-w-screen-xl ">
    <h1 className=" p-5 mb-4 text-3xl font-extrabold text-gray-900 dark:text-white md:text-5xl lg:text-6xl"><span className="text-transparent bg-clip-text bg-gradient-to-r to-slate-600 from-yellow-400">Promoções</span></h1>
      <section className=" mb-10 grid place-items-center grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-3">
        {listaProdutos}
      </section>
    </div>
    </>
  );
}
