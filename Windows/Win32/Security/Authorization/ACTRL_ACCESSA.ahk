#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ACTRL_PROPERTY_ENTRYA.ahk" { ACTRL_PROPERTY_ENTRYA }

/**
 * Contains an array of access-control lists for an object and its properties. (ANSI)
 * @remarks
 * Note the following type definition.
 * 
 * 
 * ``` syntax
 * typedef PACTRL_ACCESSW PACTRL_ACCESSW_ALLOCATE_ALL_NODES;
 * ```
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The accctrl.h header defines ACTRL_ACCESS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/accctrl/ns-accctrl-actrl_accessa
 * @namespace Windows.Win32.Security.Authorization
 * @charset ANSI
 */
export default struct ACTRL_ACCESSA {
    #StructPack 8

    /**
     * The number of entries in the <b>pPropertyAccessList</b> array.
     */
    cEntries : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/accctrl/ns-accctrl-actrl_property_entrya">ACTRL_PROPERTY_ENTRY</a> structures. Each structure contains a list of access-control entries for an object or a specified property on the object.
     */
    pPropertyAccessList : ACTRL_PROPERTY_ENTRYA.Ptr

}
