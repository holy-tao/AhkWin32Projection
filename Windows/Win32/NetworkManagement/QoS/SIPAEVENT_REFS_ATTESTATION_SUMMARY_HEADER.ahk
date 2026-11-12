#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SIPAEVENT_REFS_ATTESTATION_ATTESTED_TYPE.ahk
#Include .\SIPAEVENT_REFS_ATTESTATION_CERTIFICATE_HEADER.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.QoS
 */
class SIPAEVENT_REFS_ATTESTATION_SUMMARY_HEADER extends Win32Struct {
    static sizeof => 448

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
     * @type {SIPAEVENT_REFS_ATTESTATION_ATTESTED_TYPE}
     */
    AttestedType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    AttestedHashSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<Integer>}
     */
    AttestedHash {
        get {
            if(!this.HasProp("__AttestedHashProxyArray"))
                this.__AttestedHashProxyArray := Win32FixedArray(this.ptr + 16, 64, Primitive, "char")
            return this.__AttestedHashProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ProofOfOriginHashSize {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Array<Integer>}
     */
    ProofOfOriginHash {
        get {
            if(!this.HasProp("__ProofOfOriginHashProxyArray"))
                this.__ProofOfOriginHashProxyArray := Win32FixedArray(this.ptr + 84, 64, Primitive, "char")
            return this.__ProofOfOriginHashProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved {
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 152, 4, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }

    /**
     * @type {SIPAEVENT_REFS_ATTESTATION_CERTIFICATE_HEADER}
     */
    CertificateHeader {
        get {
            if(!this.HasProp("__CertificateHeader"))
                this.__CertificateHeader := SIPAEVENT_REFS_ATTESTATION_CERTIFICATE_HEADER(184, this)
            return this.__CertificateHeader
        }
    }
}
