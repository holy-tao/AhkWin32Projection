#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class TRANSACTIONMANAGER_LOG_INFORMATION extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Guid}
     */
    LogIdentity {
        get {
            if(!this.HasProp("__LogIdentity"))
                this.__LogIdentity := Guid(0, this)
            return this.__LogIdentity
        }
    }
}
