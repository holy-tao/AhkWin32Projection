#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the copy protection state.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/dvdmedia/ns-dvdmedia-am_dvdcopy_set_copy_state">AM_DVDCOPY_SET_COPY_STATE</a> structure uses this data type.
 * @see https://learn.microsoft.com/windows/win32/api/dvdmedia/ne-dvdmedia-am_dvdcopystate
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_DVDCOPYSTATE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
