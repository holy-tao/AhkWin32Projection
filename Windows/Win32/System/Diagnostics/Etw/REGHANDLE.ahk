#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Win32Handle.ahk
#Include .\Apis.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class REGHANDLE extends Win32Handle
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => [0]

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    __Delete(){
        if(!this.owned)
            return

        Etw.EventUnregister(this.Value)
        this.Value := 0
    }
}
