#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HCERTSTORE.ahk

/**
 * Sets parameters for building a non-default certificate chain engine. The engine used determines the ways that certificate chains are built.
 * @remarks
 * 
  * The chain-building engine uses four certificate stores in building chains. These are hRoot, hWorld, hTrust, and hOther. These stores' handles are established by using information in this structure when a chain engine is created.
  * 
  * hRoot is the store handle from <b>hRestrictedRoot</b> or, if <b>hRestrictedRoot</b> is <b>NULL</b>, the handle for System Store "Root."
  * 
  * hWorld is a collection certificate store including sibling stores hRoot, "CA," "My," "Trust," and any additional stores whose handles are in the array pointed to by <b>rghAdditionalStore</b>.
  * 
  * hTrust is the store handle from <b>hRestrictedTrust</b> or, if <b>hRestrictedTrust</b> is <b>NULL</b>, hWorld.
  * 
  * hOther is <b>hRestrictedOther</b> plus hRoot or, if <b>hRestrictedTrust</b> is non-<b>NULL</b>, the hWorld collection store plus the store handle from <b>hRestrictedTrust</b>.
  * 
  * Exclusive trust mode allows applications to specify trust anchors and peer-trusted certificates  for certificate chain validation. In the exclusive trust mode, the root store and the trusted people store on the system are ignored, and the anchors and certificates pointed to by the <b>hExclusiveRoot</b> and <b>hExclusiveTrustedPeople</b> members are used instead.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-cert_chain_engine_config
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_CHAIN_ENGINE_CONFIG extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Size of this structure in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * This configuration parameter can be used to restrict the root store. If used, it can be the handle of any HCERTSTORE containing only a proper subset of the certificates in the root store.
     * @type {HCERTSTORE}
     */
    hRestrictedRoot{
        get {
            if(!this.HasProp("__hRestrictedRoot"))
                this.__hRestrictedRoot := HCERTSTORE(this.ptr + 8)
            return this.__hRestrictedRoot
        }
    }

    /**
     * Store handle. If used, restricts the stores searched to find CTLs.
     * @type {HCERTSTORE}
     */
    hRestrictedTrust{
        get {
            if(!this.HasProp("__hRestrictedTrust"))
                this.__hRestrictedTrust := HCERTSTORE(this.ptr + 16)
            return this.__hRestrictedTrust
        }
    }

    /**
     * Store handle. If used, restricts the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">stores</a> searched for certificates and <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">CRLs</a>.
     * @type {HCERTSTORE}
     */
    hRestrictedOther{
        get {
            if(!this.HasProp("__hRestrictedOther"))
                this.__hRestrictedOther := HCERTSTORE(this.ptr + 24)
            return this.__hRestrictedOther
        }
    }

    /**
     * Count of additional stores to be searched for certificates and CRLs needed to build chains.
     * @type {Integer}
     */
    cAdditionalStore {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A pointer to an array of store handles for any additional stores to be searched in building chains.
     * @type {Pointer<HCERTSTORE>}
     */
    rghAdditionalStore {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The following flags are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CHAIN_CACHE_END_CERT"></a><a id="cert_chain_cache_end_cert"></a><dl>
     * <dt><b>CERT_CHAIN_CACHE_END_CERT</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Information in the end certificate is cached. By default, information in all certificates except the end certificate is cached as a chain is built. Setting this flag extends the caching to the end certificate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CHAIN_CACHE_ONLY_URL_RETRIEVAL"></a><a id="cert_chain_cache_only_url_retrieval"></a><dl>
     * <dt><b>CERT_CHAIN_CACHE_ONLY_URL_RETRIEVAL</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use only cached URLs in building a certificate chain. The Internet and intranet are not searched for URL-based objects.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CHAIN_USE_LOCAL_MACHINE_STORE"></a><a id="cert_chain_use_local_machine_store"></a><dl>
     * <dt><b>CERT_CHAIN_USE_LOCAL_MACHINE_STORE</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Build the chain using the LocalMachine registry location as opposed to the CurrentUser location.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CHAIN_ENABLE_CACHE_AUTO_UPDATE"></a><a id="cert_chain_enable_cache_auto_update"></a><dl>
     * <dt><b>CERT_CHAIN_ENABLE_CACHE_AUTO_UPDATE</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enable automatic updating of the cache as a chain is being built.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CHAIN_ENABLE_SHARE_STORE"></a><a id="cert_chain_enable_share_store"></a><dl>
     * <dt><b>CERT_CHAIN_ENABLE_SHARE_STORE</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allow certificate stores used to build the chain to be shared.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CHAIN_DISABLE_AIA"></a><a id="cert_chain_disable_aia"></a><dl>
     * <dt><b>CERT_CHAIN_DISABLE_AIA</b></dt>
     * <dt>0x00002000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Turn off  Authority Information Access (AIA) retrievals explicitly.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Number of milliseconds before a time-out for network based–URL object retrievals. Can be set to zero to use the default limit.
     * @type {Integer}
     */
    dwUrlRetrievalTimeout {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Limit on the number of certificates that can be cached as a chain is built. Can be set to 0 to use the default limit.
     * @type {Integer}
     */
    MaximumCachedCertificates {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Number of certificates added to the chain before a check is made to determine whether there is a cycle of certificates in the chain. A cycle may be defined as having the same certificate in two different places in a chain. 
     * 
     * 
     * 
     * 
     * The lower the number, the more frequently checks will be made. Extra checking for cycles of certificates will slow the process considerably. This parameter can be set to zero to use the default limit.
     * @type {Integer}
     */
    CycleDetectionModulus {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Handle to a  certificate store that contains exclusive trust anchors.  If either the <b>hExclusiveRoot</b> or <b>hExclusiveTrustedPeople</b> member points to a valid store, exclusive trust mode is used for the chain building.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>Support for this member begins.
     * @type {HCERTSTORE}
     */
    hExclusiveRoot{
        get {
            if(!this.HasProp("__hExclusiveRoot"))
                this.__hExclusiveRoot := HCERTSTORE(this.ptr + 64)
            return this.__hExclusiveRoot
        }
    }

    /**
     * Handle to a certificate store that contains  application-specific peer trusted certificates. If either the <b>hExclusiveRoot</b> or <b>hExclusiveTrustedPeople</b> member points to a valid store, exclusive trust mode is used for the chain building.
     * 
     * <b>Windows 7 and Windows Server 2008 R2:  </b>Support for this member begins.
     * @type {HCERTSTORE}
     */
    hExclusiveTrustedPeople{
        get {
            if(!this.HasProp("__hExclusiveTrustedPeople"))
                this.__hExclusiveTrustedPeople := HCERTSTORE(this.ptr + 72)
            return this.__hExclusiveTrustedPeople
        }
    }

    /**
     * The following flag can be set. The flag applies only if the <b>hExclusiveRoot</b> or <b>hExclusiveTrustedPeople</b> or both are not <b>NULL</b>.
     * 
     * <b>Windows 8 and Windows Server 2012:  </b>Support for this member begins.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CERT_CHAIN_EXCLUSIVE_ENABLE_CA_FLAG"></a><a id="cert_chain_exclusive_enable_ca_flag"></a><dl>
     * <dt><b>CERT_CHAIN_EXCLUSIVE_ENABLE_CA_FLAG</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that a non-self-signed intermediate CA certificate in the <b>hExclusiveRoot</b> store should be treated as a trust anchor during certificate validation. If a certificate chains up to this CA, chain building is terminated and the certificate is considered trusted. No signature verification or revocation checking is performed on the CA certificate.
     * 
     * By default, if this flag is not set, only self-signed certificates in the <b>hExclusiveRoot</b> store are treated as trust anchors.
     * 
     * See also the <b>CERT_TRUST_IS_CA_TRUSTED</b> value in the <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_trust_status">CERT_TRUST_STATUS</a> structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwExclusiveFlags {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 88
    }
}
