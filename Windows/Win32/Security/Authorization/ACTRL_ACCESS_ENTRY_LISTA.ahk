#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a list of access entries. (ANSI)
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
 * @see https://learn.microsoft.com/windows/win32/api/accctrl/ns-accctrl-actrl_access_entry_lista
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 * @charset ANSI
 */
class ACTRL_ACCESS_ENTRY_LISTA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of entries in the <b>pAccessList</b> array.
     * @type {Integer}
     */
    cEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-actrl_access_entrya">ACTRL_ACCESS_ENTRY</a> structures. Each structure specifies access-control information for a specified trustee.
     * @type {Pointer<ACTRL_ACCESS_ENTRYA>}
     */
    pAccessList {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
