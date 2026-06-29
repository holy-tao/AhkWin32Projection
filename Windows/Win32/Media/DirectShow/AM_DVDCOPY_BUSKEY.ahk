#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies the DVD bus key.
 * @remarks
 * The AM_PROPERTY_DVDCOPY_DVD_KEY1 and AM_PROPERTY_DVDCOPY_DEC_KEY2 properties use this structure.
 * 
 * A bus key is used for the DVD CSS key exchange for decryption. Implementors should get a CSS license and further instructions from CSS.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ns-dvdmedia-am_dvdcopy_buskey
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_DVDCOPY_BUSKEY {
    #StructPack 1

    /**
     * DVD drive bus key.
     */
    BusKey : Int8[5]

    /**
     * Reserved.
     */
    Reserved : Int8[1]

}
