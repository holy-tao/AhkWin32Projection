#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class AEC_INPUT_STREAM extends Win32Enum {

    /**
     * Native name: AEC_CAPTURE_STREAM
     * @type {Integer (Int32)}
     */
    static CAPTURE_STREAM => 0

    /**
     * Native name: AEC_REFERENCE_STREAM
     * @type {Integer (Int32)}
     */
    static REFERENCE_STREAM => 1
}
