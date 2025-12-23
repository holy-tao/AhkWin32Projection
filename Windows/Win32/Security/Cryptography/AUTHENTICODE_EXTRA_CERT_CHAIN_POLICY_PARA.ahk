#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Holds policy information used in the verification of certificate chains for files.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-authenticode_extra_cert_chain_policy_para
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class AUTHENTICODE_EXTRA_CERT_CHAIN_POLICY_PARA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size, in bytes, of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Flags set during installation that can be modified by a user. The SetReg tool found in the Authenticode Tool Pack can be used to select or cancel the selection of each value. These flags can be combined using a bitwise-<b>OR</b> operation. 
     * 
     * 
     * 
     * 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WTPF_TRUSTTEST"></a><a id="wtpf_trusttest"></a><dl>
     * <dt><b>WTPF_TRUSTTEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Trust any "TEST" certificate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WTPF_TESTCANBEVALID"></a><a id="wtpf_testcanbevalid"></a><dl>
     * <dt><b>WTPF_TESTCANBEVALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Check any "TEST" certificate for validity.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WTPF_IGNOREEXPIRATION"></a><a id="wtpf_ignoreexpiration"></a><dl>
     * <dt><b>WTPF_IGNOREEXPIRATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore the expiration date on certificates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WTPF_IGNOREREVOKATION"></a><a id="wtpf_ignorerevokation"></a><dl>
     * <dt><b>WTPF_IGNOREREVOKATION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore revocation checks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WTPF_OFFLINEOK_IND"></a><a id="wtpf_offlineok_ind"></a><dl>
     * <dt><b>WTPF_OFFLINEOK_IND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the source is offline, trust any individual certificates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WTPF_OFFLINEOK_COM"></a><a id="wtpf_offlineok_com"></a><dl>
     * <dt><b>WTPF_OFFLINEOK_COM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the source is offline, trust any commercial certificates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WTPF_OFFLINEOKNBU_IND"></a><a id="wtpf_offlineoknbu_ind"></a><dl>
     * <dt><b>WTPF_OFFLINEOKNBU_IND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the source is offline, trust any individual certificates. Do not use UI.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WTPF_OFFLINEOKNBU_COM"></a><a id="wtpf_offlineoknbu_com"></a><dl>
     * <dt><b>WTPF_OFFLINEOKNBU_COM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the source is offline, trust any commercial certificates. Do not use checking UI.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WTPF_VERIFY_V1_OFF"></a><a id="wtpf_verify_v1_off"></a><dl>
     * <dt><b>WTPF_VERIFY_V1_OFF</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Turn off verification of v1 certificates.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WTPF_IGNOREREVOCATIONONTS"></a><a id="wtpf_ignorerevocationonts"></a><dl>
     * <dt><b>WTPF_IGNOREREVOCATIONONTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore time stamp revocation checks.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WTPF_ALLOWONLYPERTRUST"></a><a id="wtpf_allowonlypertrust"></a><dl>
     * <dt><b>WTPF_ALLOWONLYPERTRUST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allow only items in personal trust database.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwRegPolicySettings {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cmsg_signer_info">CMSG_SIGNER_INFO</a> structure that contains information on the signer of the file.
     * @type {Pointer<CMSG_SIGNER_INFO>}
     */
    pSignerInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 16
    }
}
