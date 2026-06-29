#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SecPkgContext_ClientCertPolicyResult extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {HRESULT}
     */
    dwPolicyResult {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    guidPolicyId {
        get {
            if(!this.HasProp("__guidPolicyId"))
                this.__guidPolicyId := Guid(4, this)
            return this.__guidPolicyId
        }
    }
}
