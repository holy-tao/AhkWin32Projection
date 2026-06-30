#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Cryptography\Sip\SIP_INDIRECT_DATA.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Cryptography\Sip\SIP_DISPATCH_INFO.ahk
#Include ..\Cryptography\Sip\SIP_SUBJECTINFO.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
class PROVDATA_SIP extends Win32Struct {
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    gSubject {
        get {
            if(!this.HasProp("__gSubject"))
                this.__gSubject := Guid(4, this)
            return this.__gSubject
        }
    }

    /**
     * @type {Pointer<SIP_DISPATCH_INFO>}
     */
    pSip {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<SIP_DISPATCH_INFO>}
     */
    pCATSip {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<SIP_SUBJECTINFO>}
     */
    psSipSubjectInfo {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<SIP_SUBJECTINFO>}
     */
    psSipCATSubjectInfo {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<SIP_INDIRECT_DATA>}
     */
    psIndirectData {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
