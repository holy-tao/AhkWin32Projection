#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class PCW_CALLBACK_TYPE extends Win32Enum {

    /**
     * Native name: PcwCallbackAddCounter
     * @type {Integer (Int32)}
     */
    static AddCounter => 0

    /**
     * Native name: PcwCallbackRemoveCounter
     * @type {Integer (Int32)}
     */
    static RemoveCounter => 1

    /**
     * Native name: PcwCallbackEnumerateInstances
     * @type {Integer (Int32)}
     */
    static EnumerateInstances => 2

    /**
     * Native name: PcwCallbackCollectData
     * @type {Integer (Int32)}
     */
    static CollectData => 3
}
