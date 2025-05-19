;=== qwerty配列と大西配列を共存させるためのscript
;=== 起動時qwerty配列モードになる
;=== CapsLockの状態のトグルはできない
;=== CapsLock + Enter で配列モードをトグルする
;=== CapsLockをpressした時CapsLockが有効になる(ライトが光る)なら大西配列モードになっている
;=== (将来性としてtoggleでない方がいいかも？)

#NoEnv
#SingleInstance Force
#UseHook On  ; 低レベルフックを強制
#InstallKeybdHook  ; 明示的にキーボードフックを有効にする

isDiffLayout := False ; 大西配列モードかどうか

SetCapsLockState, AlwaysOff
*CapsLock::
  if (isDiffLayout) {
    SetCapsLockState, AlwaysOn
  }
Return
*CapsLock Up::
  SetCapsLockState, AlwaysOff
Return

Enter::
  if GetKeyState("CapsLock", "P") {
    if (isDiffLayout) {
      isDiffLayout := False
      SetCapsLockState, AlwaysOff
    } else {
      isDiffLayout := True
      SetCapsLockState, AlwaysOn
    }
  } else {
    Send, {Enter}
  }
Return

#If isDiffLayout ; isDiffLayout が true のときだけ以下のホットキーが有効
  *a::Send {Blind}{e}
  *b::Send {Blind}{`;}
  ; *c::Send {Blind}{c}
  *d::Send {Blind}{a}
  *e::Send {Blind}{u}
  *f::Send {Blind}{o}
  *g::Send {Blind}{-}
  *h::Send {Blind}{k}
  *i::Send {Blind}{r}
  *j::Send {Blind}{t}
  *k::Send {Blind}{n}
  *l::Send {Blind}{s}
  *n::Send {Blind}{g}
  *m::Send {Blind}{d}
  *o::Send {Blind}{y}
  ; *p::Send {Blind}{p}
  ; *q::Send {Blind}{q}
  *r::Send {Blind}{,}
  *s::Send {Blind}{i}
  *t::Send {Blind}{.}
  *u::Send {Blind}{w}
  ; *v::Send {Blind}{v}
  *w::Send {Blind}{l}
  ; *x::Send {Blind}{x}
  *y::Send {Blind}{f}
  ; *z::Send {Blind}{z}
  ;=== qwertyで記号であって置き換える必要のあるキーたち
  *-::Send {Blind}{/}
  *`;::Send {Blind}{h}
  *,::Send {Blind}{m}
  *.::Send {Blind}{j}
  */::Send {Blind}{b}
#If  ; 条件解除
