export default function Book({ width, title }) {
  return (
    <div
      className="flex shrink-0 justify-center items-center min-w-[2rem] h-80 rounded-3xl bg-stone-800 text-inherit text-2xl text-center font-serif"
      style={{ width: width }}
    >
      <div className="rotate-90 whitespace-nowrap">{title}</div>
    </div>
  );
}