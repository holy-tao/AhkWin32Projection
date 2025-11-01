#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_BIR_DATA.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-bir
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_BIR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {WINBIO_BIR_DATA}
     */
    HeaderBlock{
        get {
            if(!this.HasProp("__HeaderBlock"))
                this.__HeaderBlock := WINBIO_BIR_DATA(0, this)
            return this.__HeaderBlock
        }
    }

    /**
     * @type {WINBIO_BIR_DATA}
     */
    StandardDataBlock{
        get {
            if(!this.HasProp("__StandardDataBlock"))
                this.__StandardDataBlock := WINBIO_BIR_DATA(8, this)
            return this.__StandardDataBlock
        }
    }

    /**
     * @type {WINBIO_BIR_DATA}
     */
    VendorDataBlock{
        get {
            if(!this.HasProp("__VendorDataBlock"))
                this.__VendorDataBlock := WINBIO_BIR_DATA(16, this)
            return this.__VendorDataBlock
        }
    }

    /**
     * @type {WINBIO_BIR_DATA}
     */
    SignatureBlock{
        get {
            if(!this.HasProp("__SignatureBlock"))
                this.__SignatureBlock := WINBIO_BIR_DATA(24, this)
            return this.__SignatureBlock
        }
    }
}
