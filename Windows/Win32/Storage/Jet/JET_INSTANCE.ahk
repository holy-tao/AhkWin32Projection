#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Learn more about: JET_INSTANCE
 * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/jet-instance
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 */
class JET_INSTANCE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
