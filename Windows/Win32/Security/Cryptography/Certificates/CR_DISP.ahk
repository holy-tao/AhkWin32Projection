#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class CR_DISP extends Win32Enum {

    /**
     * Native name: CR_DISP_DENIED
     * @type {Integer (UInt32)}
     */
    static DENIED => 2

    /**
     * Native name: CR_DISP_ERROR
     * @type {Integer (UInt32)}
     */
    static ERROR => 1

    /**
     * Native name: CR_DISP_INCOMPLETE
     * @type {Integer (UInt32)}
     */
    static INCOMPLETE => 0

    /**
     * Native name: CR_DISP_ISSUED
     * @type {Integer (UInt32)}
     */
    static ISSUED => 3

    /**
     * Native name: CR_DISP_ISSUED_OUT_OF_BAND
     * @type {Integer (UInt32)}
     */
    static ISSUED_OUT_OF_BAND => 4

    /**
     * Native name: CR_DISP_UNDER_SUBMISSION
     * @type {Integer (UInt32)}
     */
    static UNDER_SUBMISSION => 5
}
