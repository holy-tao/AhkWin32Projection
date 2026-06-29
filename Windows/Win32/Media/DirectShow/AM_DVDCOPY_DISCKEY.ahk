#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the DVD disc key.
 * @remarks
 * The AM_PROPERTY_DVDCOPY_DISC_KEY property uses this structure.
 * 
 * A disc key is used for the DVD CSS key exchange for decryption. Implementors should get a CSS license and further instructions from CSS.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ns-dvdmedia-am_dvdcopy_disckey
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_DVDCOPY_DISCKEY {
    #StructPack 1

    /**
     * DVD disc key.
     */
    DiscKey : Int8[2048]

}
