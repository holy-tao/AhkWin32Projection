#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class OPM_CGMSA extends Win32Enum {

    /**
     * Native name: OPM_CGMSA_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 0

    /**
     * Native name: OPM_CGMSA_COPY_FREELY
     * @type {Integer (Int32)}
     */
    static COPY_FREELY => 1

    /**
     * Native name: OPM_CGMSA_COPY_NO_MORE
     * @type {Integer (Int32)}
     */
    static COPY_NO_MORE => 2

    /**
     * Native name: OPM_CGMSA_COPY_ONE_GENERATION
     * @type {Integer (Int32)}
     */
    static COPY_ONE_GENERATION => 3

    /**
     * Native name: OPM_CGMSA_COPY_NEVER
     * @type {Integer (Int32)}
     */
    static COPY_NEVER => 4

    /**
     * Native name: OPM_CGMSA_REDISTRIBUTION_CONTROL_REQUIRED
     * @type {Integer (Int32)}
     */
    static REDISTRIBUTION_CONTROL_REQUIRED => 8
}
