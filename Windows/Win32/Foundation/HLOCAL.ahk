#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32Handle.ahk
#Include .\Apis.ahk

/**
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class HLOCAL extends Win32Handle
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => [-1, 0]

    /**
     * @type {Pointer<Void>}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    __Delete(){
        if(!this.owned)
            return

        Foundation.LocalFree(this.Value)
        this.Value := -1
    }
}
