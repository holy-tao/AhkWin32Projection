#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies the DVD challenge key.
 * @remarks
 * The AM_PROPERTY_DVDCOPY_CHLG_KEY property uses this structure.
 * 
 * A challenge key is used for the DVD CSS key exchange for decryption. Implementors should get a CSS license and further instructions from CSS.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ns-dvdmedia-am_dvdcopy_chlgkey
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_DVDCOPY_CHLGKEY {
    #StructPack 1

    /**
     * Challenge key.
     */
    ChlgKey : Int8[10]

    /**
     * Reserved.
     */
    Reserved : Int8[2]

}
