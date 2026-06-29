#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\GPO_LINK.ahk" { GPO_LINK }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The GROUP_POLICY_OBJECT structure provides information about a GPO in a GPO list. (ANSI)
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
 * @see https://learn.microsoft.com/windows/win32/api/userenv/ns-userenv-group_policy_objecta
 * @namespace Windows.Win32.System.GroupPolicy
 * @charset ANSI
 */
export default struct GROUP_POLICY_OBJECTA {
    #StructPack 8

    dwOptions : UInt32

    /**
     * Specifies the version number of the GPO.
     */
    dwVersion : UInt32

    /**
     * Pointer to a string that specifies the path to the directory service portion of the GPO.
     */
    lpDSPath : PSTR

    /**
     * Pointer to a string that specifies the path to the file system portion of the GPO.
     */
    lpFileSysPath : PSTR

    /**
     * Pointer to the display name of the GPO.
     */
    lpDisplayName : PSTR

    /**
     * Pointer to a string that specifies a unique name that identifies the GPO.
     */
    szGPOName : CHAR[50]

    GPOLink : GPO_LINK

    /**
     * User-supplied data.
     */
    lParam : LPARAM

    /**
     * Pointer to the next GPO in the list.
     */
    pNext : GROUP_POLICY_OBJECTA.Ptr

    /**
     * Pointer to the previous GPO in the list.
     */
    pPrev : GROUP_POLICY_OBJECTA.Ptr

    /**
     * Extensions that have stored data in this GPO. The format is a string of <b>GUID</b>s grouped in brackets. For more information, see the following Remarks section.
     */
    lpExtensions : PSTR

    /**
     * User-supplied data.
     */
    lParam2 : LPARAM

    /**
     * Path to the Active Directory site, domain, or organization unit to which this GPO is linked. If the GPO is linked to the local GPO, this member is "Local".
     */
    lpLink : PSTR

}
