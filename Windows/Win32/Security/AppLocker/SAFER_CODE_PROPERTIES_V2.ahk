#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains code image information and criteria to be checked on the code image.S
 * @see https://learn.microsoft.com/windows/win32/api/winsafer/ns-winsafer-safer_code_properties_v2
 * @namespace Windows.Win32.Security.AppLocker
 * @version v4.0.30319
 */
class SAFER_CODE_PROPERTIES_V2 extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * The size of this structure in bytes. This is used for future and backward compatibility.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
     * @type {Integer}
     */
    dwCheckFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A string specifying the fully qualified path and file name to be used for discrimination checks based on the path. The image path is also used to open and read the file to identify any other discrimination criteria not supplied in this structure. This member can be <b>NULL</b>; however, if the <b>dwCheckFlags</b> member includes <b>SAFER_CRITERIA_AUTHENTICODE</b>, either this member or the <b>hImageFileHandle</b> member must be set.
     * @type {Pointer<PWSTR>}
     */
    ImagePath {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A file handle to a code image with at least GENERIC_READ access. The handle is used instead of explicitly reopening the file  to compute discrimination criteria not supplied in this structure. This member can be <b>NULL</b>; however, if <b>dwCheckFlags</b> includes <b>SAFER_CRITERIA_AUTHENTICODE</b>, either this member or the <b>ImagePath</b> member must be set.
     * @type {Pointer<HANDLE>}
     */
    hImageFileHandle {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

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
     * @type {Integer}
     */
    UrlZoneId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

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
     * @type {Array<Byte>}
     */
    ImageHash{
        get {
            if(!this.HasProp("__ImageHashProxyArray"))
                this.__ImageHashProxyArray := Win32FixedArray(this.ptr + 28, 64, Primitive, "char")
            return this.__ImageHashProxyArray
        }
    }

    /**
     * The size in bytes of the <b>ImageHash</b> member.
     * @type {Integer}
     */
    dwImageHashSize {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * The size in bytes of the <b>pByteBlock</b> member. This member is not used if the <b>pByteBlock</b> member is <b>NULL</b>.
     * @type {Integer}
     */
    ImageSize {
        get => NumGet(this, 96, "int64")
        set => NumPut("int64", value, this, 96)
    }

    /**
     * The hash algorithm used to create the <b>ImageHash</b> member.
     * @type {Integer}
     */
    HashAlgorithm {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * The memory block containing the image of the code being checked. This member is optional. If this member is specified, the <b>ImageSize</b> member must also be supplied.
     * @type {Pointer<Byte>}
     */
    pByteBlock {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * The arguments used for Authenticode signer certificate verification. These arguments are passed to the <a href="https://docs.microsoft.com/windows/desktop/api/wintrust/nf-wintrust-winverifytrust">WinVerifyTrust</a> function and control the user interface (UI) that prompts the user to accept or reject entrusted certificates.
     * @type {Pointer<HWND>}
     */
    hWndParent {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

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
     * @type {Integer}
     */
    dwWVTUIChoice {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * The package moniker property. For use by Windows Store apps.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This member is not available.
     * @type {Pointer<PWSTR>}
     */
    PackageMoniker {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * The package publisher property. For use by Windows Store apps.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This member is not available.
     * @type {Pointer<PWSTR>}
     */
    PackagePublisher {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * The package name property. For use by Windows Store apps.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This member is not available.
     * @type {Pointer<PWSTR>}
     */
    PackageName {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * The package version property. For use by Windows Store apps.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This member is not available.
     * @type {Integer}
     */
    PackageVersion {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * The package is a framework package. For use by Windows Store apps.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This member is not available.
     * @type {Integer}
     */
    PackageIsFramework {
        get => NumGet(this, 168, "int")
        set => NumPut("int", value, this, 168)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 176
    }
}
