#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MPE_ELEMENT structure contains information from a multi-protocol encapsulation (MPE) element.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-mpe_element
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct MPE_ELEMENT {
    #StructPack 8

    /**
     * Packet identifier (PID).
     */
    pid : UInt16

    /**
     * Component tag.
     */
    bComponentTag : Int8

    /**
     * Pointer to the next <b>MPE_ELEMENT</b> structure in the list, or <b>NULL</b> if this element is the end of the list.
     */
    pNext : MPE_ELEMENT.Ptr

}
