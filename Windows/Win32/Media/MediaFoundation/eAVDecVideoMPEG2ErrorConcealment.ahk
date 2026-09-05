#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVDecVideoMPEG2ErrorConcealment extends Win32Enum {

    /**
     * Native name: eErrorConcealmentOff
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * Native name: eErrorConcealmentOn
     * @type {Integer (Int32)}
     */
    static On => 1
}
