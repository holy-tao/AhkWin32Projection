#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PROCESS_SYSCALL_PROVIDER_INFORMATION extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Guid}
     */
    ProviderId {
        get {
            if(!this.HasProp("__ProviderId"))
                this.__ProviderId := Guid(0, this)
            return this.__ProviderId
        }
    }

    /**
     * @type {Integer}
     */
    Level {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }
}
