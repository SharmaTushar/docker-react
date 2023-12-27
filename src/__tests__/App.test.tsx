import { expect, describe, it } from "vitest";
import { render, screen } from "@testing-library/react";
import { userEvent } from "@testing-library/user-event";
import App from "../App";

describe("Counter", () => {
  it("increases count on button click", async () => {
    render(<App />);
    const button = screen.getByRole("button");
    expect(button.textContent).toBe("count is 0");
    await userEvent.click(button);
    expect(button.textContent).toBe("count is 1");
  });
});
