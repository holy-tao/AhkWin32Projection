#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * Describes how to prepare the tape.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-tape_prepare
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class TAPE_PREPARE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    Operation {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {BOOLEAN}
     */
    Immediate{
        get {
            if(!this.HasProp("__Immediate"))
                this.__Immediate := BOOLEAN(this.ptr + 4)
            return this.__Immediate
        }
    }
}
