#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * An entry in the public POS (Part of Speech) table.
 * @see https://learn.microsoft.com/windows/win32/api/msime/ns-msime-postbl
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class POSTBL extends Win32Struct
{
    static sizeof => 10

    static packingSize => 1

    /**
     * The number of the part of speech.
     * @type {Integer}
     */
    nPos {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The name of the part of speech.
     * @type {Pointer<Byte>}
     */
    szName {
        get => NumGet(this, 2, "ptr")
        set => NumPut("ptr", value, this, 2)
    }
}
