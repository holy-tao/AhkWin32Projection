# AhkWin32Projection
A language projection of the Win32 API into AutoHotkey V2.

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

Replace `DllCall` with readable function calls...
```autohotkey
hDC := DllCall("GetDC", "ptr", 0)
hDC := Gdi.GetDC(0)                 ;Readable!
```

With rich IntelliSense features and full documentation directly in your IDE:
![Modern IntelliSense for APIs from the 90s](./Examples/Images/IntelliSense-Example.png)

## Table of Contents
- [AhkWin32Projection](#ahkwin32projection)
  - [Table of Contents](#table-of-contents)
  - [What Is This?](#what-is-this)
  - [Usage](#usage)
    - [Common Namespaces](#common-namespaces)
  - [Structs](#structs)
    - [Creating Structs](#creating-structs)
    - [Arrays](#arrays)
    - [Other Notes](#other-notes)
  - [Enums and Constants](#enums-and-constants)
  - [Methods](#methods)
    - [Notes](#notes)
  - [Limitations](#limitations)
  - [Links](#links)


## What Is This?
This project is a language projection of the Win32 API into 64-bit AutoHotkey V2. It aims greatly simplify the process of working with structs and DllCalls and to alleviate the plague of [magic numbers](https://en.wikipedia.org/wiki/Magic_number_(programming)) that afflicts AutoHotkey programmers.

The project provides generated struct proxy objects, constant values, and friendly `DllCall` wrappers with doc comments rich Intellisense documentation compatible with [AHK++](https://github.com/mark-wiemer/ahkpp).

Imagine you wanted to enumerate all the fonts on your system:
```autohotkey v2
stdout := FileOpen("*", "w")

hDc := Gdi.GetDC(0)     ;Equivalent to DllCall("GetDC", "ptr", 0)

searchFont := LOGFONTW()
searchFont.lfCharSet := FONT_CHARSET.ANSI_CHARSET
searchFont.lfFaceName := "Papyrus"

callback := CallbackCreate(EnumFontFamExProc, "Fast", 4)
Gdi.EnumFontFamiliesExW(hDc, searchFont, callback, 0, 0)

;https://learn.microsoft.com/en-us/previous-versions/dd162618(v=vs.85)
EnumFontFamExProc(lpelfe, lpntme, fontType, lparam){
    logfont := LOGFONTW(lpelfe)
    stdout.WriteLine(logfont.lfFaceName)

    return 1    ;Return non-zero value to continue enumeration
}
```
~~No more~~ fewer magic numbers, much more readable code, no mucking around deprecated Win32 documentation!

## Usage
This project is intended to be used as a library. You can "install" it by cloning the repo into an AutoHotkey [library directory](https://www.autohotkey.com/docs/v2/Scripts.htm#lib), and then reference types in your script using `<library>` syntax. Note that many scripts also include other dependent scripts. Files are organized by namespace:

```autohotkey v2
#Include <AhkWin32Projection\Windows\Win32\Foundation\RECT>
#Include <AhkWin32Projection\Windows\Win32\UI\Controls\HDITEMW>
```

### Common Namespaces
Namespaces can be unintuitive and they aren't really mapped to headers, so a few common namespaces are listed here:
- [`Windows\Win32\UI\Controls`](./Windows/Win32/UI/Controls): Most Gui and GuiControl related types
- [`Windows\Win32\UI\WindowsAndMessaging`](./Windows/Win32/WindowsAndMessaging): Contains more fundamental window-related structs and enums (e.g. the [`WINDOW_EX_STYLE`](./Windows/Win32/UI/WindowsAndMessaging/WINDOW_EX_STYLE.ahk) enum)
- [`Windows\Win32\Foundation`](./Windows/Win32/Foundation): Contains types common to all namespaces like [`RECT`](https://learn.microsoft.com/en-us/windows/win32/api/windef/ns-windef-rect), [`FILETIME`](https://learn.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-filetime), and [`POINT`](https://learn.microsoft.com/en-us/windows/win32/api/windef/ns-windef-point).
- [`Windows\Win32\Graphics\Gdi`](./Windows/Win32/Graphics/Gdi) and [`GdiPlus`](./Windows/Win32/Graphics/GdiPlus) : Contains most graphics-related types not otherwise contained in `UI\Controls` - font structs like [`LOGFONTW`](https://learn.microsoft.com/en-us/windows/win32/api/wingdi/ns-wingdi-logfontw), for example.
- [`Windows\Win32\Networking\WinHttp`](./Windows/Win32/Networking/WinHttp): WinHTTP-related items (see also: [About WinHTTP - Win32 apps | Microsoft Learn](https://learn.microsoft.com/en-us/windows/win32/winhttp/about-winhttp))

GitHub's file search functionality is also great if you're looking for something specific.

## Structs
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

### Creating Structs
The `Win32Struct.__New` takes a pointer as its only argument. If that pointer is 0, a new [`Buffer`](https://www.autohotkey.com/docs/v2/lib/Buffer.htm) is created to serve as the object's backing memory. This buffer is always cleared; every member of a new struct starts as 0 / `NULL`. If the pointer is not zero, the pointer is taken to be a pointer to the start of the struct proxy's memory block. Thus all you need to create a struct proxy is its pointer, as with the font enumeration example above:
```autohotkey v2
logfont := LOGFONTW(lpelfe)     ;Create a LOGFONTW struct at the pointer lpelfe
logfont := LOGFONTW()           ;Create a new LOGFONTW struct backed by a Buffer
```

Note that in the first case, where the proxy is created at an existing memory location, the script has no way to know whether or not the underlying memory has been freed. You can use `Win32Struct.Clone()` to create a clone of a struct backed by a `Buffer` if necessary.

### Arrays
Arrays in struct proxies are themselves proxy objects extending [`Win32FixedArray`](./Win32FixedArray.ahk). These are typed, fixed-length arrays. The class mimics the applicable functionality of `Array`, allowing enumeration and access via [`__Item`](https://www.autohotkey.com/docs/v2/Objects.htm#__Item).

In cases where it is clear that an array is in fact a string (arrats of `char` or `tchar` elements, for example), properties are generated using `StrPut` and `StrGet`. In this case, assign strings to the properties directly:
```autohotkey v2
lpLogFont := LOGFONTW()
lpLogFont.lfFaceName := "Papyrus"
```

To create resizeable arrays in script-managed memory, use [`CStyleArray`](./CStyleArray.ahk) objects. 

### Other Notes
- Handles, pointers (including function pointers and COM interface pointers), and "pseudo-primitives" structs like `CHAR` and `HWND` (also known as NativeTypeDefs; these are wrapper structs with a single member) have no special handling in generated struct proxies, and are exposed as pure Integers.
  - For COM interfaces, use [`ComObjFromPtr`](https://www.autohotkey.com/docs/v2/lib/ComObjFromPtr.htm) and [`ComObjQuery`](https://www.autohotkey.com/docs/v2/lib/ComObjQuery.htm) to use native AutoHotkey COM functionality.
  - Use [`CallbackCreate`](https://www.autohotkey.com/docs/v2/lib/CallbackCreate.htm) to create function pointers
- Unions, unlike embedded structs, are flattened. Struct proxies that contain union types will have multiple members at the same offset; in this case, only one can be valid at a time.
- When struct members have conflicting names, the second member has a number appended to it. Type names are not otherwise changed.
  - For example, [`YxyCOLOR`](./Windows/Win32/UI/ColorSystem/YxyCOLOR.ahk) has a member `Y` (uppercase) and `y` (lowercase):
      ```c++
      struct YxyCOLOR {
          WORD Y;
          WORD x;
          WORD y;
       };
      ```
    Because AutoHotkey is [case-insensitive](https://www.autohotkey.com/docs/v2/Concepts.htm#names), `y` (lowercase) is emitted as `y1` to avoid duplicate declaration errors. This can also happen with structs where more than one of the same union is embedded in a struct.
 - In many cases, if a struct contains a `cbSize` member whose size must always be the size of the struct, (e.g. [`GUITHREADINFO`](./Windows/Win32/UI/WindowsAndMessaging/GUITHREADINFO.ahk), that member is set automatically in the proxy object's [`__New`](https://www.autohotkey.com/docs/v2/Objects.htm#Custom_NewDelete) method. This is only true for `cbSize` members, note that there are some more obscure cases where a similar size member is not set automatically.

## Enums and Constants
Enums are simply classes with a series of static read-only variables like so (doc comments removed)
```autohotkey v2
class DUPLICATE_HANDLE_OPTIONS{

    static DUPLICATE_CLOSE_SOURCE => 1
    static DUPLICATE_SAME_ACCESS => 2
}
```

Similarly, constant values are static read-only variables attached to their namespace's `Apis` class - see [Methods](#methods) below.

## Methods
Rather than emitting global functions, methods (and global constants) are all static to a class named after their relevant namespace. These classes live in files called `Apis.ahk` in their relevant directories. This decision was made to improve readability and to prevent the interpreter from allocating global variables which are never used.

To use these methods, simply `#Include` the relevant `Apis` file and call them:
```autohotkey
#Include <AhkWin32Projection\Windows\Win32\Graphics\Gdi\Apis>

hDC := Gdi.GetDC(0)
; Do stuff ...
Gdi.ReleaseDC(0, hDC)
```

For methods that set the [last error](https://www.autohotkey.com/docs/v2/Variables.htm#LastError), the error value is cleared before `DllCall` is invoked and checked immediately afterwards. If it is nonzero (that is, if an error occurred), an [`OSError`](https://www.autohotkey.com/docs/v2/lib/Error.htm#OSError) is thrown.

### Notes
- Wrapper function inputs are not sanitized or type checked. The value you specify in the wrapper function is passed directly to the `DllCall`. This _may_ change in the future, though any checking implemented is likely to be very rudimentary.
- Reserved parameters are omitted from generated function signatures. As such, signatures may differ _slightly_ from the function signatures in Microsoft's documentation.
- In cases where parameter names conflict with reserved words ("this", "in", etc), an underscore is appended to the parameter name.

## Limitations
This projet has some limitations, not all of which will be addressed.
- Only 64-bit AutoHotkey is supported
  - ANSI and Unicode variants, where applicable, are both generated
  - Generated files all have the `#Requires AutoHotkey v2.0.0 64-bit` [directive](https://www.autohotkey.com/docs/v2/lib/_Requires.htm), which should prevent mix-ups.
- Only structs with fixed layouts are supported. This means flexible arrays are **not** supported (unless you only need one element)
- In string constants with unprintable characters, those characters are encoded (e.g. a null character becomes `\0000`) and may need to be decoded before use.
- Macros are not included in the win32metadata project, and so are not included in the generated AutoHotkey code. While many macros have corresponding functions, not all of them do. 
  - See [this issue](https://github.com/microsoft/win32metadata/issues/436) on the win32metadata project page for details.
- Code examples in the documentation are generally in `C++`.
  - Documentation is taken from the [Microsoft.Windows.SKD.Win32Docs](https://www.nuget.org/packages/Microsoft.Windows.SDK.Win32Docs/) package.

## Links
- [Microsoft's win32metadata project](https://github.com/microsoft/win32metadata/tree/main): the data from which these files are generated
- [Generator](https://github.com/holy-tao/AhkWin32Structs-Generator): the actual generator
