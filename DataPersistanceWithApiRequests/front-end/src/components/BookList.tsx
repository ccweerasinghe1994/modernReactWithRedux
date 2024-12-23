import BookShow from "./BookShow.tsx";
import { BookT } from "./BookShow.tsx";

type Props = {
  books: BookT[];
  onDelete: (id: number) => void;
  onEdit: (id: number, newTitle: string) => void;
};

function BookList({ books, onDelete, onEdit }: Props) {
  const renderedBooks = books.map((book) => {
    return (
      <BookShow onEdit={onEdit} onDelete={onDelete} key={book.id} book={book} />
    );
  });

  return <div className="book-list">{renderedBooks}</div>;
}

export default BookList;
