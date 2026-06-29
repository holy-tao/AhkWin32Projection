#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains the hash store data for the certificate that Schannel uses in kernel-mode.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-schannel_cert_hash_store
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SCHANNEL_CERT_HASH_STORE {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    dwLength : UInt32

    /**
     * Contains bit flags that control the behavior of Schannel. This member can be zero or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SCH_MACHINE_CERT_HASH"></a><a id="sch_machine_cert_hash"></a><dl>
     * <dt><b>SCH_MACHINE_CERT_HASH</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The certificate hash of the computer.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

    /**
     * Handle to the cryptography provider.
     */
    hProv : IntPtr

    /**
     * The secure hash algorithm.
     */
    ShaHash : Int8[20]

    /**
     * Pointer to the size of the store name.
     */
    pwszStoreName : WCHAR[128]

}
