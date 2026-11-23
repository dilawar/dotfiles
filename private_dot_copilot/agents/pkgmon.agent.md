---
name: pkgmon
---

# Pkgmon agent

- When writing diagnostics etc, avoid filler content. Show an example with concrete 
  data and its transformation by code (data-flow) when something is not working correctly. 
- All tests must start with prefix test_
- run pre-commit-hooks frequently, suggest pre-commit hooks that could
  have helped making the codebase better.
- Use simplified technical English STE100 whenever possible
- Keep your output less verbose and to the point.
- Write code for maintainability and readability, don't write long functions.
  A function should do one and only one thing. Extract functions often.
- Maintain good test coverage and try to lock behaviour using unit tests. When
  we need a contract to be enforced before we can use an API, write a unit test to
  enforce it.
- Reduce coupling, enhance cohesion
- Do not make changes to ./docs/NOTES.md lightly. Ask me if you have suggestions
  to make to this file.
- Make frequent atomic commits during a session when on auto-pilot mode but 
  never when in interactive mode.
  Each commit should contain tightly couple changes so that reverting a commit
  only remove related stuff. Do not push though. Rebase history often
  to make history more readable and maintainable.
- In interactive mode, suggest a commit title and description but never make a commit.
  User should be able to see the diff in editor and pass review comments before
  we make any commit.

## Code comments

- Add a comment only when the code is not obvious by itself, e.g. a locking
  rule, an ordering requirement or a non-trivial reason for a workaround.
- Keep it as short and simple as possible, but do not cut the reasoning a
  reader needs, e.g. for locking rules or races.
- Do not restate what the code does. Do not narrate the change, and do not
  add comments like "fix for ..." or "new helper to ...".
- Remove any comment that does not carry information, but only in the lines
  being added or touched. Do not drop unrelated existing comments.
- Add kernel-doc only for complex functions. Do not bother for simple helpers
  whose function and parameter names are self-explaining.

## Commit messages

Human readability comes first. A reviewer should be able to understand the
problem and the fix from the message.

- Use short and simple sentences. One idea per sentence.
- Skip filler and long background.
- Prefer a small chart or call trace over a long paragraph, see "Visual aids" below.
- Drop any sentence the reviewer does not need to understand the change.
- Do not use the [BUG], [CAUSE] and [FIX] section tags for simple bugs. Write
  plain paragraphs instead. Keep the tags only for complex bugs, where the
  symptom, the cause and the fix each need several paragraphs.

## Visual aids

Prefer anything that makes the message easier for a human to read. An ASCII
chart is a good choice when it explains the problem faster than prose, e.g.:

- A race. Show the race window, do not describe it in prose only.
- An error handling bug in a function, seen from several call sites.
- A call chain across layers, where the bug only shows on a certain path.
- The order of steps in a transaction commit or a log replay.

Chart rules:

- Function names only, no file paths or line numbers.
- Show only the functions that matter.
- Describe a state or outcome with plain text under the function name.
- For a race, use one column per racing context (CPU, task, endio), side by side.
