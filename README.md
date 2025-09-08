# AhkWin32Projection
A partial projection of the Win32 APIs into AutoHotkey V2.

This project allows you to replace this:
```autohotkey v2
rect := Buffer(16, 0)
NumPut("int", 20, rect, 12)
```

With much more friendly, object-oriented syntax:
```autohotkey
myRect := Rect()
myRect.top := 20
```

## What Is This?
This project is a partial language projection of the Win32 API into 64-bit AutoHotkey V2. The project provides struct and enum classes to greatly simplify the process of working with structs and DllCalls and to alleviate the plague of [magic numbers](https://en.wikipedia.org/wiki/Magic_number_(programming)) that afflicts AutoHotkey programmers.

The project currently contains structs and enums, because structs are by far the worst source of AHK's magic number plague and requires some user-unfriendly memory manipulation.

And that's a simple struct! Imagine you wanted to enumerate all the fonts on your system:
```autohotkey v2
stdout := FileOpen("*", "w")

hDc := DllCall("GetDC", "ptr", 0)
lpLogFont := LOGFONTW()
lpLogFont.lfCharSet := FONT_CHARSET.ANSI_CHARSET

callback := CallbackCreate(EnumFontFamExProc, "Fast", 4)
DllCall("gdi32\EnumFontFamiliesExW", "ptr", hDc, "ptr", lpLogFont, "ptr", callback, "ptr", 0, "int", 0)

;https://learn.microsoft.com/en-us/previous-versions/dd162618(v=vs.85)
EnumFontFamExProc(lpelfe, lpntme, fontType, lparam){
    logfont := LOGFONTW(lpelfe)
    stdout.WriteLine(logfont.lfFaceName)

    return 1    ;Return non-zero value to continue enumeration
}
```
~~No more~~ fewer magic numbers, much more readable code, no mucking around deprecated Win32 documentation! Unless you enjoy that sort of thing - in which case the projection also provides rich Intellisense documentation compatible with [AHK++](https://github.com/mark-wiemer/ahkpp) for your viewing pleasure.

## Usage
This project is intended to be used as a library. You can "install" it by cloning the repo into an AutoHotkey [library directory](https://www.autohotkey.com/docs/v2/Scripts.htm#lib), and then reference types in your script using `<library>` syntax. Note that many scripts also include other dependent scripts. Files are organized by namespace:

```autohotkey v2
#Include <AhkWin32Projection\Windows\Win32\Foundation\RECT>
#Include <AhkWin32Projection\Windows\Win32\UI\Controls\HDITEMW>
```

### Common Namespaces
Namespaces can be unintuitive and they aren't really mapped to headers, so a few common namespaces are listed here:
- `Windows\Win32\Ui\Controls`: Most Gui and GuiControl related types live in this namespace.
- `Windows\Win32\Foundation`: Contains types common to all namespaces like [`RECT`](https://learn.microsoft.com/en-us/windows/win32/api/windef/ns-windef-rect), [`FILETIME`](https://learn.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-filetime), and [`POINT`](https://learn.microsoft.com/en-us/windows/win32/api/windef/ns-windef-point).
- `Windows\Win32\Graphics\Gdi` and `GdiPlus` : Contains most graphics-related types not otherwise contained in `UI\Controls` - font structs like [`LOGFONTW`](https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-logfontw), for example.

GitHub's file search functionality is also great if you're looking for something specific. 

### Structs
All structs are represented with proxy objects extending [`Win32Struct`](./Win32FixedArray.ahk). The base class provides utilities for initializing structs, cloning, copying, and comparing memory blocks. Struct proxy objects have properties whose getters and setters invoke [`NumGet`](https://www.autohotkey.com/docs/v2/lib/NumGet.htm) and [`NumPut`](https://www.autohotkey.com/docs/v2/lib/NumPut.htm):
```autohotkey v2
cchTextMax {
    get => NumGet(this, 24, "int")
    set => NumPut("int", value, this, 24)
}
```

Embedded structs are not flattened (though unions are). For example, to get the handle of the window for which a [`NMHDDISPINFOW`](./Windows/Win32/UI/Controls/NMHDDISPINFOW.ahk) message was dispatched, you simply access its `hdr` property:
```autohotkey v2
hwnd := dispInfo.hdr.hwndFrom
``` 

Struct proxies are [buffer-like](https://www.autohotkey.com/docs/v2/lib/Buffer.htm#like), so you can use them anywhere you would use a pointer.

#### Creating Structs
The `Win32Struct.__New` takes a pointer as its only argument. If that pointer is 0, a new [`Buffer`](https://www.autohotkey.com/docs/v2/lib/Buffer.htm) is created to serve as the object's backing memory. This buffer is always cleared; every member of a new struct starts as 0 / `NULL`. If the pointer is not zero, the pointer is taken to be a pointer to the start of the struct proxy's memory block. Thus all you need to create a struct proxy is its pointer, as with the font enumeration example above:
```autohotkey v2
logfont := LOGFONTW(lpelfe)     ;Create a LOGFONTW struct at the pointer lpelfe
logfont := LOGFONTW()           ;Create a new LOGFONTW struct backed by a Buffer
```

Note that in the first case, where the proxy is created at an existing memory location, the script has no way to know whether or not the underlying memory has been freed. You can use `Win32Struct.Clone()` to create a clone of a struct backed by a `Buffer` if necessary.

#### Arrays
Arrays in struct proxies are themselves proxy objects extending [`Win32FixedArray`](./Win32FixedArray.ahk). These are typed, fixed-length arrays. The class mimics the applicable functionality of `Array`, allowing enumeration and access via [`__Item`](https://www.autohotkey.com/docs/v2/Objects.htm#__Item).

In cases where it is clear that an array is in fact a string (arrats of `char` or `tchar` elements, for example), properties are generated using `StrPut` and `StrGet`. In this case, assign strings to the properties directly:
```autohotkey v2
lpLogFont := LOGFONTW()
lpLogFont.lfFaceName := "Papyrus"
```

To create resizeable arrays in script-managed memory, use [`CStyleArray`](./CStyleArray.ahk) objects. 

#### Other Notes
- Handles, pointers (including function pointers and COM interface pointers), and "pseudo-primitives" structs like `CHAR` and `HWND` (also known as NativeTypeDefs; these are wrapper structs with a single member) have no special handling in generated struct proxies, and are exposed as pure Integers.
  - For COM interfaces, use [`ComObjFromPtr`](https://www.autohotkey.com/docs/v2/lib/ComObjFromPtr.htm) and [`ComObjQuery`](https://www.autohotkey.com/docs/v2/lib/ComObjQuery.htm) to use native AutoHotkey COM functionality.
  - Use [`CallbackCreate`](https://www.autohotkey.com/docs/v2/lib/CallbackCreate.htm) to create function pointers
- Unions, unlike embedded structs, are flattened. Struct proxies that contain union types will have multiple members at the same offset; in this case, only one can be valid at a time.
- When struct members have conflicting names, the second member has a number appended to it (e.g. if a struct has two members `x` and `X`, `X` appears in the generated AutoHotkey as `X1`). Type names are not otherwise changed.

## Enums
Enums are simply classes with a series of static read-only variables.

## Limitations
The project currently only covers structs and enums. I plan to also cover functions, but these are likely to be thin wrappers around `DllCall`, which is already quite robust. 

Some other notes:
- Only 64-bit AutoHotkey is supported
  - ANSI and Unicode variants, where applicable, are both generated
  - Generated files all have the `#Requires AutoHotkey v2.0.0 64-bit` [directive](https://www.autohotkey.com/docs/v2/lib/_Requires.htm), which should prevent mix-ups.
- Only structs with fixed layouts are supported. This means flexible arrays are **not** supported (unless you only need one element)

## Links
- [Microsoft's win32metadata project](https://github.com/microsoft/win32metadata/tree/main): the data from which these files are generated
- [Generator](https://github.com/holy-tao/AhkWin32Structs-Generator): the actual generator