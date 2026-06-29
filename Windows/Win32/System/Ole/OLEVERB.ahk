#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\OLEIVERB.ahk" { OLEIVERB }
#Import "..\..\UI\WindowsAndMessaging\MENU_ITEM_FLAGS.ahk" { MENU_ITEM_FLAGS }

/**
 * Defines a verb that an object supports. The IOleObject::EnumVerbs method creates an enumerator that can enumerate these structures for an object, and supplies a pointer to the enumerator's IEnumOLEVERB.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/ns-oleidl-oleverb
 * @namespace Windows.Win32.System.Ole
 */
export default struct OLEVERB {
    #StructPack 8

    /**
     * Integer identifier associated with this verb.
     */
    lVerb : OLEIVERB

    /**
     * Pointer to a string that contains the verb's name.
     */
    lpszVerbName : PWSTR

    /**
     * In Windows, a group of flags taken from the flag constants beginning with MF_ defined in <a href="https://docs.microsoft.com/windows/desktop/menurc/u">AppendMenu</a>. Containers should use these flags in building an object's verb menu. All Flags defined in <b>AppendMenu</b> are supported except for MF_BITMAP, MF_OWNERDRAW, and MF_POPUP.
     */
    fuFlags : MENU_ITEM_FLAGS

    /**
     * Combination of the verb attributes in the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-oleverbattrib">OLEVERBATTRIB</a> enumeration.
     */
    grfAttribs : UInt32

}
