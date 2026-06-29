#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ACTRL_ACCESS_ENTRYW.ahk" { ACTRL_ACCESS_ENTRYW }

/**
 * Contains a list of access entries. (Unicode)
 * @remarks
 * To create an empty access list, set <b>cEntries</b> to zero and <b>pAccessList</b> to <b>NULL</b>. An empty list does not grant access to any trustee, and thus, denies all access to an object.
 * 
 * To create a null access list, set the <b>pAccessEntryList</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-actrl_property_entrya">ACTRL_PROPERTY_ENTRY</a> structure to <b>NULL</b>. A null access list grants everyone full access to the object.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The accctrl.h header defines ACTRL_ACCESS_ENTRY_LIST as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/accctrl/ns-accctrl-actrl_access_entry_listw
 * @namespace Windows.Win32.Security.Authorization
 * @charset Unicode
 */
export default struct ACTRL_ACCESS_ENTRY_LISTW {
    #StructPack 8

    /**
     * The number of entries in the <b>pAccessList</b> array.
     */
    cEntries : UInt32

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-actrl_access_entrya">ACTRL_ACCESS_ENTRY</a> structures. Each structure specifies access-control information for a specified trustee.
     */
    pAccessList : ACTRL_ACCESS_ENTRYW.Ptr

}
