#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ACTRL_ACCESS_ENTRY_LISTW.ahk" { ACTRL_ACCESS_ENTRY_LISTW }

/**
 * Contains a list of access-control entries for an object or a specified property on an object. (Unicode)
 * @remarks
 * To create an <b>ACTRL_PROPERTY_ENTRY</b> structure that grants everyone full access to an object, set the <b>pAccessEntryList</b> member to <b>NULL</b>. 
 * 
 * 
 * 
 * To create an <b>ACTRL_PROPERTY_ENTRY</b> structure that denies all access to an object, set the <b>pAccessEntryList</b> member to point to an <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-actrl_access_entry_lista">ACTRL_ACCESS_ENTRY_LIST</a> structure whose <b>cEntries</b> member is 0 and <b>pAccessList</b> member is <b>NULL</b>. 
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The accctrl.h header defines ACTRL_PROPERTY_ENTRY as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/accctrl/ns-accctrl-actrl_property_entryw
 * @namespace Windows.Win32.Security.Authorization
 * @charset Unicode
 */
export default struct ACTRL_PROPERTY_ENTRYW {
    #StructPack 8

    /**
     * The GUID of a property on an object. Use the <a href="https://docs.microsoft.com/windows/desktop/api/rpcdce/nf-rpcdce-uuidtostring">UuidToString</a> function to generate a string representation of a property GUID.
     */
    lpProperty : PWSTR

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-actrl_access_entry_lista">ACTRL_ACCESS_ENTRY_LIST</a> structure that contains a list of access-control entries.
     */
    pAccessEntryList : ACTRL_ACCESS_ENTRY_LISTW.Ptr

    /**
     * Flags that specify information about the <b>pProperty</b> property. This member can be 0 or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="ACTRL_ACCESS_PROTECTED_"></a><a id="actrl_access_protected_"></a><dl>
     * <dt><b>ACTRL_ACCESS_PROTECTED
     * </b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Protects the object or property from inheriting access-control entries.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     */
    fListFlags : UInt32

}
