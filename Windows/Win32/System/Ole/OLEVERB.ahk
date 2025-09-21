#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a verb that an object supports. The IOleObject::EnumVerbs method creates an enumerator that can enumerate these structures for an object, and supplies a pointer to the enumerator's IEnumOLEVERB.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/ns-oleidl-oleverb
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OLEVERB extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Integer identifier associated with this verb.
     * @type {Integer}
     */
    lVerb {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Pointer to a string that contains the verb's name.
     * @type {Pointer<Char>}
     */
    lpszVerbName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * In Windows, a group of flags taken from the flag constants beginning with MF_ defined in <a href="https://docs.microsoft.com/windows/desktop/menurc/u">AppendMenu</a>. Containers should use these flags in building an object's verb menu. All Flags defined in <b>AppendMenu</b> are supported except for MF_BITMAP, MF_OWNERDRAW, and MF_POPUP.
     * @type {Integer}
     */
    fuFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Combination of the verb attributes in the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-oleverbattrib">OLEVERBATTRIB</a> enumeration.
     * @type {Integer}
     */
    grfAttribs {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
