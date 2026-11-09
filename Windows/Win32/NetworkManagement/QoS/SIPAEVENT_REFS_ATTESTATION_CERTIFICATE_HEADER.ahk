#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
class SIPAEVENT_REFS_ATTESTATION_CERTIFICATE_HEADER extends Win32Struct {
    static sizeof => 264

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    LeafCertificateFingerprintSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Integer>}
     */
    LeafCertificateFingerprint {
        get {
            if(!this.HasProp("__LeafCertificateFingerprintProxyArray"))
                this.__LeafCertificateFingerprintProxyArray := Win32FixedArray(this.ptr + 12, 64, Primitive, "char")
            return this.__LeafCertificateFingerprintProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    RootCertificateFingerprintSize {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Array<Integer>}
     */
    RootCertificateFingerprint {
        get {
            if(!this.HasProp("__RootCertificateFingerprintProxyArray"))
                this.__RootCertificateFingerprintProxyArray := Win32FixedArray(this.ptr + 80, 64, Primitive, "char")
            return this.__RootCertificateFingerprintProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    AttestedHashSize {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * @type {Array<Integer>}
     */
    AttestedHash {
        get {
            if(!this.HasProp("__AttestedHashProxyArray"))
                this.__AttestedHashProxyArray := Win32FixedArray(this.ptr + 148, 64, Primitive, "char")
            return this.__AttestedHashProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    UserPayloadOffset {
        get => NumGet(this, 212, "uint")
        set => NumPut("uint", value, this, 212)
    }

    /**
     * @type {Integer}
     */
    UserPayloadSize {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * @type {Integer}
     */
    LeafCertificateIssuerBlobOffset {
        get => NumGet(this, 220, "uint")
        set => NumPut("uint", value, this, 220)
    }

    /**
     * @type {Integer}
     */
    LeafCertificateIssuerBlobSize {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * @type {Integer}
     */
    LeafCertificateSubjectBlobOffset {
        get => NumGet(this, 228, "uint")
        set => NumPut("uint", value, this, 228)
    }

    /**
     * @type {Integer}
     */
    LeafCertificateSubjectBlobSize {
        get => NumGet(this, 232, "uint")
        set => NumPut("uint", value, this, 232)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 240, 2, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Data {
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 256, 1, Primitive, "char")
            return this.__DataProxyArray
        }
    }
}
