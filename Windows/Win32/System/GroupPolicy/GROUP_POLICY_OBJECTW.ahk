#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The GROUP_POLICY_OBJECT structure provides information about a GPO in a GPO list. (Unicode)
 * @remarks
 * Each GPO could contain data that must be processed by multiple snap-in extensions. Therefore, the data in the <b>lpExtensions</b> member is organized as a series of <b>GUID</b>s that identify the extensions and snap-in extensions. The data format is as follows:
 * 
 * 
 * ```cpp
 * [ext_guid1, snap_in_guid1, snap_in_guid2, ...] 
 * [ext_guid2, snap_in_guid3, snap_in_guid4, ...] 
 * ```
 * 
 * 
 * First, there is an opening bracket, "[", followed by the <b>GUID</b> of the extension. Next, you'll find one or more <b>GUID</b>s identifying the snap-in extensions that have stored data in the GPO. After the last snap-in <b>GUID</b> for an extension, there is a closing bracket, "]". This pattern is repeated for the next extension.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The userenv.h header defines GROUP_POLICY_OBJECT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/userenv/ns-userenv-group_policy_objectw
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 * @charset Unicode
 */
class GROUP_POLICY_OBJECTW extends Win32Struct
{
    static sizeof => 184

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    dwOptions {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the version number of the GPO.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to a string that specifies the path to the directory service portion of the GPO.
     * @type {PWSTR}
     */
    lpDSPath {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a string that specifies the path to the file system portion of the GPO.
     * @type {PWSTR}
     */
    lpFileSysPath {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to the display name of the GPO.
     * @type {PWSTR}
     */
    lpDisplayName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a string that specifies a unique name that identifies the GPO.
     * @type {String}
     */
    szGPOName {
        get => StrGet(this.ptr + 32, 49, "UTF-16")
        set => StrPut(value, this.ptr + 32, 49, "UTF-16")
    }

    /**
     * 
     * @type {Integer}
     */
    GPOLink {
        get => NumGet(this, 132, "int")
        set => NumPut("int", value, this, 132)
    }

    /**
     * User-supplied data.
     * @type {LPARAM}
     */
    lParam {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * Pointer to the next GPO in the list.
     * @type {Pointer<GROUP_POLICY_OBJECTW>}
     */
    pNext {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * Pointer to the previous GPO in the list.
     * @type {Pointer<GROUP_POLICY_OBJECTW>}
     */
    pPrev {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * Extensions that have stored data in this GPO. The format is a string of <b>GUID</b>s grouped in brackets. For more information, see the following Remarks section.
     * @type {PWSTR}
     */
    lpExtensions {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * User-supplied data.
     * @type {LPARAM}
     */
    lParam2 {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * Path to the Active Directory site, domain, or organization unit to which this GPO is linked. If the GPO is linked to the local GPO, this member is "Local".
     * @type {PWSTR}
     */
    lpLink {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }
}
