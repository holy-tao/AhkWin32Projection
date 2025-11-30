#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the copy protection state.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/dvdmedia/ns-dvdmedia-am_dvdcopy_set_copy_state">AM_DVDCOPY_SET_COPY_STATE</a> structure uses this data type.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dvdmedia/ne-dvdmedia-am_dvdcopystate
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_DVDCOPYSTATE extends Win32Enum{

    /**
     * Starting a full key-exchange algorithm.
     * @type {Integer (Int32)}
     */
    static AM_DVDCOPYSTATE_INITIALIZE => 0

    /**
     * Starting a title key-exchange algorithm.
     * @type {Integer (Int32)}
     */
    static AM_DVDCOPYSTATE_INITIALIZE_TITLE => 1

    /**
     * Authentication is not required.
     * @type {Integer (Int32)}
     */
    static AM_DVDCOPYSTATE_AUTHENTICATION_NOT_REQUIRED => 2

    /**
     * Authentication required.
     * @type {Integer (Int32)}
     */
    static AM_DVDCOPYSTATE_AUTHENTICATION_REQUIRED => 3

    /**
     * Key exchange negotiation is complete.
     * @type {Integer (Int32)}
     */
    static AM_DVDCOPYSTATE_DONE => 4
}
