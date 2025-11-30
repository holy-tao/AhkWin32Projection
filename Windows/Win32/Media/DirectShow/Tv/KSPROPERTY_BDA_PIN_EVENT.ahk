#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSPROPERTY_BDA_PIN_EVENT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_BDA_PIN_CONNECTED => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_BDA_PIN_DISCONNECTED => 1
}
