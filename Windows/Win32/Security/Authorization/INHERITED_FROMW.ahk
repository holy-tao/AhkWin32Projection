#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Provides information about an object's inherited access control entry (ACE).
 * @remarks
 * 
  * > [!NOTE]
  * > The accctrl.h header defines INHERITED_FROM as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//accctrl/ns-accctrl-inherited_fromw
 * @namespace Windows.Win32.Security.Authorization
 * @version v4.0.30319
 * @charset Unicode
 */
class INHERITED_FROMW extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of levels, or generations, between the object and the ancestor. Set this to zero for an explicit ACE. If the ancestor cannot be determined for the inherited ACE, set this member to –1.
     * @type {Integer}
     */
    GenerationGap {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Name of the ancestor from which the ACE was inherited. For an explicit ACE, set this to <b>NULL</b>.
     * @type {PWSTR}
     */
    AncestorName{
        get {
            if(!this.HasProp("__AncestorName"))
                this.__AncestorName := PWSTR(this.ptr + 8)
            return this.__AncestorName
        }
    }
}
