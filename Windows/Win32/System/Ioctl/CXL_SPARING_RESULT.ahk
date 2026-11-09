#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_SPARING_RESULT extends Win32Enum {

    /**
     * Native name: CxlSparingResult_Success
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Native name: CxlSparingResult_ResourcesExhausted
     * @type {Integer (Int32)}
     */
    static ResourcesExhausted => 1

    /**
     * Native name: CxlSparingResult_GeneralFailure
     * @type {Integer (Int32)}
     */
    static GeneralFailure => 255
}
