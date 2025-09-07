#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_DVDCOPYSTATE{

    /**
     * @type {Integer (Int32)}
     */
    static KS_DVDCOPYSTATE_INITIALIZE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_DVDCOPYSTATE_INITIALIZE_TITLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_DVDCOPYSTATE_AUTHENTICATION_NOT_REQUIRED => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_DVDCOPYSTATE_AUTHENTICATION_REQUIRED => 3

    /**
     * @type {Integer (Int32)}
     */
    static KS_DVDCOPYSTATE_DONE => 4
}
