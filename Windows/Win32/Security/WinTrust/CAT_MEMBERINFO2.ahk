#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
class CAT_MEMBERINFO2 extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Guid}
     */
    SubjectGuid {
        get {
            if(!this.HasProp("__SubjectGuid"))
                this.__SubjectGuid := Guid(0, this)
            return this.__SubjectGuid
        }
    }

    /**
     * @type {Integer}
     */
    dwCertVersion {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
