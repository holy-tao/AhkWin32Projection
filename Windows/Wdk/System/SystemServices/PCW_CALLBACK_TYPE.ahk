#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCW_CALLBACK_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PcwCallbackAddCounter => 0

    /**
     * @type {Integer (Int32)}
     */
    static PcwCallbackRemoveCounter => 1

    /**
     * @type {Integer (Int32)}
     */
    static PcwCallbackEnumerateInstances => 2

    /**
     * @type {Integer (Int32)}
     */
    static PcwCallbackCollectData => 3
}
