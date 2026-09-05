#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSMETHOD_BDA_EVENTING_SERVICE extends Win32Enum {

    /**
     * Native name: KSMETHOD_BDA_EVENT_DATA
     * @type {Integer (Int32)}
     */
    static EVENT_DATA => 0

    /**
     * Native name: KSMETHOD_BDA_EVENT_COMPLETE
     * @type {Integer (Int32)}
     */
    static EVENT_COMPLETE => 1
}
