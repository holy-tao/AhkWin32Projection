#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
class DNS_TLSA_DATA extends Win32Struct {
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
     * @type {Array<Integer>}
     */
    bPad {
        get {
            if(!this.HasProp("__bPadProxyArray"))
                this.__bPadProxyArray := Win32FixedArray(this.ptr + 6, 3, Primitive, "char")
            return this.__bPadProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    bCertificateAssociationData {
        get {
            if(!this.HasProp("__bCertificateAssociationDataProxyArray"))
                this.__bCertificateAssociationDataProxyArray := Win32FixedArray(this.ptr + 9, 1, Primitive, "char")
            return this.__bCertificateAssociationDataProxyArray
        }
    }
}
