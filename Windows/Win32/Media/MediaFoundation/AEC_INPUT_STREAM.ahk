#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class AEC_INPUT_STREAM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AEC_CAPTURE_STREAM => 0

    /**
     * @type {Integer (Int32)}
     */
    static AEC_REFERENCE_STREAM => 1
}
