#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Provides information about an object's inherited access control entry (ACE). (ANSI)
 * @remarks
 * > [!NOTE]
 * > The accctrl.h header defines INHERITED_FROM as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/accctrl/ns-accctrl-inherited_froma
 * @namespace Windows.Win32.Security.Authorization
 * @charset ANSI
 */
export default struct INHERITED_FROMA {
    #StructPack 8

    /**
     * Number of levels, or generations, between the object and the ancestor. Set this to zero for an explicit ACE. If the ancestor cannot be determined for the inherited ACE, set this member to –1.
     */
    GenerationGap : Int32

    /**
     * Name of the ancestor from which the ACE was inherited. For an explicit ACE, set this to <b>NULL</b>.
     */
    AncestorName : PSTR

}
