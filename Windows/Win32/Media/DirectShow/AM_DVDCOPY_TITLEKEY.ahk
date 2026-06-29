#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the DVD title key from the current content.
 * @remarks
 * The AM_PROPERTY_DVDCOPY_TITLE_KEY property uses this structure.
 * 
 * A title key is used for the DVD CSS key exchange for decryption. Implementors should get a CSS license and further instructions from CSS.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ns-dvdmedia-am_dvdcopy_titlekey
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_DVDCOPY_TITLEKEY {
    #StructPack 4

    /**
     * Key flags.
     */
    KeyFlags : UInt32

    Reserved1 : UInt32[2]

    /**
     * Title key.
     */
    TitleKey : Int8[6]

    Reserved2 : Int8[2]

}
