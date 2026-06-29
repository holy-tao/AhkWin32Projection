#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class TRANSACTION_LIST_ENTRY extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Guid}
     */
    UOW {
        get {
            if(!this.HasProp("__UOW"))
                this.__UOW := Guid(0, this)
            return this.__UOW
        }
    }
}
