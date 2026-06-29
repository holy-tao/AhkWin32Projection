#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Cryptography\ALG_ID.ahk" { ALG_ID }

/**
 * Contains code image information and criteria to be checked on the code image.S
 * @see https://learn.microsoft.com/windows/win32/api/winsafer/ns-winsafer-safer_code_properties_v2
 * @namespace Windows.Win32.Security.AppLocker
 */
export default struct SAFER_CODE_PROPERTIES_V2 {
    #StructPack 8

    /**
     * The size of this structure in bytes. This is used for future and backward compatibility.
     */
    cbSize : UInt32 := this.Size

    /**
     * The types of criteria considered when evaluating this structure. Some flags might be silently ignored if some or all of their associated structure elements are not supplied. Specifying zero for this parameter causes the entire structure's contents to be ignored. 
     * 
     * 
     * 
     * 
     * The following table shows the possible values. These values may be combined using a bitwise-<b>OR</b> operation.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SAFER_CRITERIA_IMAGEPATH"></a><a id="safer_criteria_imagepath"></a><dl>
     * <dt><b>SAFER_CRITERIA_IMAGEPATH</b></dt>
     * <dt>0x00001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Check the code image path.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SAFER_CRITERIA_IMAGEHASH"></a><a id="safer_criteria_imagehash"></a><dl>
     * <dt><b>SAFER_CRITERIA_IMAGEHASH</b></dt>
     * <dt>0x00004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Check the code hash.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SAFER_CRITERIA_AUTHENTICODE"></a><a id="safer_criteria_authenticode"></a><dl>
     * <dt><b>SAFER_CRITERIA_AUTHENTICODE</b></dt>
     * <dt>0x00008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Check the Authenticode signature. If this value is used, either the <b>hImageFileHandle</b> member or the <b>ImagePath</b> member must be set.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SAFER_CRITERIA_URLZONE"></a><a id="safer_criteria_urlzone"></a><dl>
     * <dt><b>SAFER_CRITERIA_URLZONE</b></dt>
     * <dt>0x00010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Check the URL of origin.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SAFER_CRITERIA_IMAGEPATH_NT"></a><a id="safer_criteria_imagepath_nt"></a><dl>
     * <dt><b>SAFER_CRITERIA_IMAGEPATH_NT</b></dt>
     * <dt>0x01000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Check the Windows NT image path.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SAFER_CRITERIA_APPX_PACKAGE"></a><a id="safer_criteria_appx_package"></a><dl>
     * <dt><b>SAFER_CRITERIA_APPX_PACKAGE</b></dt>
     * <dt>0x00020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Check for a Windows Store app package. For use by Windows Store apps.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwCheckFlags : UInt32

    /**
     * A string specifying the fully qualified path and file name to be used for discrimination checks based on the path. The image path is also used to open and read the file to identify any other discrimination criteria not supplied in this structure. This member can be <b>NULL</b>; however, if the <b>dwCheckFlags</b> member includes <b>SAFER_CRITERIA_AUTHENTICODE</b>, either this member or the <b>hImageFileHandle</b> member must be set.
     */
    ImagePath : PWSTR

    /**
     * A file handle to a code image with at least GENERIC_READ access. The handle is used instead of explicitly reopening the file  to compute discrimination criteria not supplied in this structure. This member can be <b>NULL</b>; however, if <b>dwCheckFlags</b> includes <b>SAFER_CRITERIA_AUTHENTICODE</b>, either this member or the <b>ImagePath</b> member must be set.
     */
    hImageFileHandle : HANDLE

    /**
     * The predetermined Internet Explorer security zones. The following zones are defined: 
     * 
     * 
     * 
     * 
     * <ul>
     * <li>URLZONE_LOCAL_MACHINE</li>
     * <li>URLZONE_INTRANET</li>
     * <li>URLZONE_TRUSTED</li>
     * <li>URLZONE_INTERNET</li>
     * <li>URLZONE_UNTRUSTED</li>
     * </ul>
     * This member can be set to 0.
     */
    UrlZoneId : UInt32

    /**
     * The pre-computed hash of the image. The supplied hash is interpreted as  valid if both the <b>ImageSize</b> member and the <b>dwImageHashSize</b> member are nonzero and the <b>HashAlgorithm</b> member contains a valid hashing algorithm from Wincrypt.h. 
     * 
     * 
     * 
     * 
     * If the supplied hash fails to meet these conditions, the hash will be automatically recomputed  by:
     * 
     * <ul>
     * <li>Using the <b>ImageSize</b> member and the <b>pByteBlock</b> member if both are nonzero.</li>
     * <li>Using the <b>hImageFileHandle</b> member if it is not <b>NULL</b>.</li>
     * <li>Opening and using the <b>ImagePath</b> member if it is not <b>NULL</b>.</li>
     * </ul>
     */
    ImageHash : Int8[64]

    /**
     * The size in bytes of the <b>ImageHash</b> member.
     */
    dwImageHashSize : UInt32

    /**
     * The size in bytes of the <b>pByteBlock</b> member. This member is not used if the <b>pByteBlock</b> member is <b>NULL</b>.
     */
    ImageSize : Int64

    /**
     * The hash algorithm used to create the <b>ImageHash</b> member.
     */
    HashAlgorithm : ALG_ID

    /**
     * The memory block containing the image of the code being checked. This member is optional. If this member is specified, the <b>ImageSize</b> member must also be supplied.
     */
    pByteBlock : IntPtr

    /**
     * The arguments used for Authenticode signer certificate verification. These arguments are passed to the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/nf-wintrust-winverifytrust">WinVerifyTrust</a> function and control the user interface (UI) that prompts the user to accept or reject entrusted certificates.
     */
    hWndParent : HWND

    /**
     * Indicates  the type of UI used. The following table shows the possible values. 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>WTD_UI_ALL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Display all UI.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>WTD_UI_NONE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Display no UI.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>WTD_UI_NOBAD</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Display UI only if there were no errors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>WTD_UI_NOGOOD</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Display UI only if an error occurs.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwWVTUIChoice : UInt32

    /**
     * The package moniker property. For use by Windows Store apps.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This member is not available.
     */
    PackageMoniker : PWSTR

    /**
     * The package publisher property. For use by Windows Store apps.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This member is not available.
     */
    PackagePublisher : PWSTR

    /**
     * The package name property. For use by Windows Store apps.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This member is not available.
     */
    PackageName : PWSTR

    /**
     * The package version property. For use by Windows Store apps.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This member is not available.
     */
    PackageVersion : Int64

    /**
     * The package is a framework package. For use by Windows Store apps.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This member is not available.
     */
    PackageIsFramework : BOOL

}
