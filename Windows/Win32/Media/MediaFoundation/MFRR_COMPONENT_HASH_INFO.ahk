#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a revoked component.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ns-mfidl-mfrr_component_hash_info
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFRR_COMPONENT_HASH_INFO extends Win32Struct
{
    static sizeof => 696

    static packingSize => 4

    /**
     * Specifies the reason for the revocation. The following values are defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_BOOT_DRIVER_VERIFICATION_FAILED"></a><a id="mf_boot_driver_verification_failed"></a><dl>
     * <dt><b>MF_BOOT_DRIVER_VERIFICATION_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A boot driver could not be verified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_COMPONENT_CERT_REVOKED"></a><a id="mf_component_cert_revoked"></a><dl>
     * <dt><b>MF_COMPONENT_CERT_REVOKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A certificate in a trusted component's certificate chain was revoked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_COMPONENT_HS_CERT_REVOKED"></a><a id="mf_component_hs_cert_revoked"></a><dl>
     * <dt><b>MF_COMPONENT_HS_CERT_REVOKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The high-security certificate for authenticating the protected environment (PE) was revoked.
     * 
     * The high-security certificate is typically used by ITAs that handle high-definition content and next-generation formats such as HD-DVD.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_COMPONENT_INVALID_EKU"></a><a id="mf_component_invalid_eku"></a><dl>
     * <dt><b>MF_COMPONENT_INVALID_EKU</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A certificate's extended key usage (EKU) object is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_COMPONENT_INVALID_ROOT"></a><a id="mf_component_invalid_root"></a><dl>
     * <dt><b>MF_COMPONENT_INVALID_ROOT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The root certificate is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_COMPONENT_LS_CERT_REVOKED"></a><a id="mf_component_ls_cert_revoked"></a><dl>
     * <dt><b>MF_COMPONENT_LS_CERT_REVOKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The low-security certificate for authenticating the PE was revoked.
     * 
     * The low-security certificate is typically used by ITAs that handle standard-definition content and current-generation formats.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_COMPONENT_REVOKED"></a><a id="mf_component_revoked"></a><dl>
     * <dt><b>MF_COMPONENT_REVOKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A trusted component was revoked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_GRL_ABSENT"></a><a id="mf_grl_absent"></a><dl>
     * <dt><b>MF_GRL_ABSENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The GRL was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_GRL_LOAD_FAILED"></a><a id="mf_grl_load_failed"></a><dl>
     * <dt><b>MF_GRL_LOAD_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not load the global revocation list (GRL).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_INVALID_GRL_SIGNATURE"></a><a id="mf_invalid_grl_signature"></a><dl>
     * <dt><b>MF_INVALID_GRL_SIGNATURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The GRL signature is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_MINCRYPT_FAILURE"></a><a id="mf_mincrypt_failure"></a><dl>
     * <dt><b>MF_MINCRYPT_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A certificate chain was not well-formed, or a boot driver is unsigned or is signed with an untrusted certificate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_TEST_SIGNED_COMPONENT_LOADING"></a><a id="mf_test_signed_component_loading"></a><dl>
     * <dt><b>MF_TEST_SIGNED_COMPONENT_LOADING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A component was signed by a test certificate.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * In addition, one of the following flags might be present, indicating the type of component that failed to load.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_USER_MODE_COMPONENT_LOAD"></a><a id="mf_user_mode_component_load"></a><dl>
     * <dt><b>MF_USER_MODE_COMPONENT_LOAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * User-mode component.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MF_KERNEL_MODE_COMPONENT_LOAD"></a><a id="mf_kernel_mode_component_load"></a><dl>
     * <dt><b>MF_KERNEL_MODE_COMPONENT_LOAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Kernel-mode component.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ulReason {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains a hash of the file header.
     * @type {String}
     */
    rgHeaderHash {
        get => StrGet(this.ptr + 4, 42, "UTF-16")
        set => StrPut(value, this.ptr + 4, 42, "UTF-16")
    }

    /**
     * Contains a hash of the public key in the component's certificate.
     * @type {String}
     */
    rgPublicKeyHash {
        get => StrGet(this.ptr + 90, 42, "UTF-16")
        set => StrPut(value, this.ptr + 90, 42, "UTF-16")
    }

    /**
     * File name of the revoked component.
     * @type {String}
     */
    wszName {
        get => StrGet(this.ptr + 176, 259, "UTF-16")
        set => StrPut(value, this.ptr + 176, 259, "UTF-16")
    }
}
