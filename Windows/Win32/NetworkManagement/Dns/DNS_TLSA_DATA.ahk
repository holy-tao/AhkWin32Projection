#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class DNS_TLSA_DATA extends Win32Struct
{
    static sizeof => 10

    static packingSize => 2

    /**
     * @type {Integer}
     */
    bCertUsage {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    bSelector {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    bMatchingType {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    bCertificateAssociationDataLength {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    bPad{
        get {
            if(!this.HasProp("__bPadProxyArray"))
                this.__bPadProxyArray := Win32FixedArray(this.ptr + 6, 1, Primitive, "char")
            return this.__bPadProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    bCertificateAssociationData{
        get {
            if(!this.HasProp("__bCertificateAssociationDataProxyArray"))
                this.__bCertificateAssociationDataProxyArray := Win32FixedArray(this.ptr + 9, 1, Primitive, "char")
            return this.__bCertificateAssociationDataProxyArray
        }
    }
}
