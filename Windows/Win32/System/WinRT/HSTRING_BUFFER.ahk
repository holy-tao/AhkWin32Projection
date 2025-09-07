#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A handle to a mutable string buffer that you can use to create an HSTRING.
 * @remarks
 * **HSTRING\_BUFFER** represents a string buffer that you can modify before converting it to an immutable [**HSTRING**](hstring.md).
  * 
  * Call the [**WindowsPreallocateStringBuffer**](/windows/win32/api/winstring/nf-winstring-windowspreallocatestringbuffer) function to create an **HSTRING\_BUFFER**. Call the [**WindowsPromoteStringBuffer**](/windows/win32/api/winstring/nf-winstring-windowspromotestringbuffer) to convert an **HSTRING\_BUFFER** to an immutable [**HSTRING**](hstring.md).
 * @see https://learn.microsoft.com/windows/win32/WinRT/hstring-buffer
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class HSTRING_BUFFER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
