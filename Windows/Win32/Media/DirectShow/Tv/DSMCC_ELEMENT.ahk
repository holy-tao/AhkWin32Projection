#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DSMCC_ELEMENT structure contains information from a DSM-CC element.
 * @see https://learn.microsoft.com/windows/win32/api/mpeg2structs/ns-mpeg2structs-dsmcc_element
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct DSMCC_ELEMENT {
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
     * Carousel identifier.
     */
    dwCarouselId : UInt32

    /**
     * Transaction identifier.
     */
    dwTransactionId : UInt32

    /**
     * Pointer to the next <b>DSMCC_ELEMENT</b> structure in the list, or <b>NULL</b> if this element is the end of the list.
     */
    pNext : DSMCC_ELEMENT.Ptr

}
