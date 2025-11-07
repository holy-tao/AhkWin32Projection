#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an array of access-control lists for an object and its properties.
 * @remarks
 * 
 * Note the following type definition.
 * 
 * <pre class="syntax" xml:space="preserve"><c>typedef PACTRL_ACCESSW PACTRL_ACCESSW_ALLOCATE_ALL_NODES;</c></pre>
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The accctrl.h header defines ACTRL_ACCESS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//accctrl/ns-accctrl-actrl_accessw
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 * @charset Unicode
 */
class ACTRL_ACCESSW extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of entries in the <b>pPropertyAccessList</b> array.
     * @type {Integer}
     */
    cEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-actrl_property_entrya">ACTRL_PROPERTY_ENTRY</a> structures. Each structure contains a list of access-control entries for an object or a specified property on the object.
     * @type {Pointer<ACTRL_PROPERTY_ENTRYW>}
     */
    pPropertyAccessList {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
