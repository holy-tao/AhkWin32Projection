#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_DVDCOPYSTATE extends Win32Enum {

    /**
     * Native name: KS_DVDCOPYSTATE_INITIALIZE
     * @type {Integer (Int32)}
     */
    static INITIALIZE => 0

    /**
     * Native name: KS_DVDCOPYSTATE_INITIALIZE_TITLE
     * @type {Integer (Int32)}
     */
    static INITIALIZE_TITLE => 1

    /**
     * Native name: KS_DVDCOPYSTATE_AUTHENTICATION_NOT_REQUIRED
     * @type {Integer (Int32)}
     */
    static AUTHENTICATION_NOT_REQUIRED => 2

    /**
     * Native name: KS_DVDCOPYSTATE_AUTHENTICATION_REQUIRED
     * @type {Integer (Int32)}
     */
    static AUTHENTICATION_REQUIRED => 3

    /**
     * Native name: KS_DVDCOPYSTATE_DONE
     * @type {Integer (Int32)}
     */
    static DONE => 4
}
