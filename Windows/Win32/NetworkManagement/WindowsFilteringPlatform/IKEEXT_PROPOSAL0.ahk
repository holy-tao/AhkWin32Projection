#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IKEEXT_CIPHER_ALGORITHM0.ahk
#Include .\IKEEXT_INTEGRITY_ALGORITHM0.ahk

/**
 * Is used to store an IKE/AuthIP main mode proposal.
 * @remarks
 * 
  * The proposal describes the
  * various parameters of the IKE/AuthIP main mode SA that is potentially generated
  * from this proposal.
  * 
  * <b>IKEEXT_PROPOSAL0</b> is a specific implementation of IKEEXT_PROPOSAL. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iketypes/ns-iketypes-ikeext_proposal0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_PROPOSAL0 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Parameters for the encryption algorithm specified by [IKEEXT_CIPHER_ALGORITHM0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_cipher_algorithm0).
     * @type {IKEEXT_CIPHER_ALGORITHM0}
     */
    cipherAlgorithm{
        get {
            if(!this.HasProp("__cipherAlgorithm"))
                this.__cipherAlgorithm := IKEEXT_CIPHER_ALGORITHM0(this.ptr + 0)
            return this.__cipherAlgorithm
        }
    }

    /**
     * Parameters for the hash algorithm specified by [IKEEXT_INTEGRITY_ALGORITHM0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_integrity_algorithm0).
     * @type {IKEEXT_INTEGRITY_ALGORITHM0}
     */
    integrityAlgorithm{
        get {
            if(!this.HasProp("__integrityAlgorithm"))
                this.__integrityAlgorithm := IKEEXT_INTEGRITY_ALGORITHM0(this.ptr + 12)
            return this.__integrityAlgorithm
        }
    }

    /**
     * Main mode security association (SA) lifetime in seconds.
     * @type {Integer}
     */
    maxLifetimeSeconds {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The Diffie Hellman group specified by [IKEEXT_DH_GROUP](/windows/desktop/api/iketypes/ne-iketypes-ikeext_dh_group).
     * @type {Integer}
     */
    dhGroup {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Maximum number of IPsec quick mode SAs that can be generated from this
     *    main mode SA. 0 (zero) means infinite.
     * @type {Integer}
     */
    quickModeLimit {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
