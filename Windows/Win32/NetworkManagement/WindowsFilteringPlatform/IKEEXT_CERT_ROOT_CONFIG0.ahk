#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }
#Import ".\IKEEXT_CERT_FLAGS.ahk" { IKEEXT_CERT_FLAGS }

/**
 * Stores the IKE, AuthIP, or IKEv2 certificate root configuration.
 * @remarks
 * <b>IKEEXT_CERT_ROOT_CONFIG0</b> is a specific implementation of IKEEXT_CERT_ROOT_CONFIG. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a>  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_cert_root_config0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_CERT_ROOT_CONFIG0 {
    #StructPack 8

    /**
     * X509/ASN.1 encoded name of the certificate root.
     * 
     * See [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) for more information.
     */
    certData : FWP_BYTE_BLOB

    flags : IKEEXT_CERT_FLAGS

}
