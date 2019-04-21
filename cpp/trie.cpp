#include <iostream>
#include <stdio.h>
#include <string.h>
#include <algorithm>
#include <set>
#include <queue>

using namespace std;

const int MAX_CHAR = 26;

// words consist only of alphabetic lower chars.
class Trie {
  Trie* children[MAX_CHAR];
  bool is_word;

public:
  Trie() {
    memset(children, 0, sizeof children);
    is_word = false;
  }

  void insert(char *str) {
    if(!(*str)) is_word = true;
    else {
      int idx = *str - 'a';
      if(!children[idx]) {
        children[idx] = new Trie();
      }
      children[idx]->insert(str + 1);
    }
  }

  bool word_exists(char *str) {
    if(!(*str)) return is_word;

    return !children[*str - 'a'] ? false : children[*str - 'a']->word_exists(str + 1);
  }

  bool prefix_exist(char *str) {
    if(!(*str)) return true;

    return !children[*str - 'a'] ? false : children[*str - 'a']->prefix_exist(str + 1);
  }
};


int main() {
  Trie root;

  root.insert("abcd");
  root.insert("xyz");
  root.insert("abf");
  root.insert("xn");
  root.insert("ab");
  root.insert("bcd");

  cout << root.word_exists("xyz")  << "\n";
  cout << root.word_exists("xy")   << "\n";
  cout << root.prefix_exist("xyz") << "\n";
  cout << root.prefix_exist("bcc") << "\n";
}
