#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class eAVDecVideoMPEG2ErrorConcealment extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static eErrorConcealmentOff => 0

    /**
     * @type {Integer (Int32)}
     */
    static eErrorConcealmentOn => 1
}
