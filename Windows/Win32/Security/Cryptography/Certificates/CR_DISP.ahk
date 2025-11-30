#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CR_DISP extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CR_DISP_DENIED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CR_DISP_ERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CR_DISP_INCOMPLETE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CR_DISP_ISSUED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CR_DISP_ISSUED_OUT_OF_BAND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CR_DISP_UNDER_SUBMISSION => 5
}
