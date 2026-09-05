#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class WCT_OBJECT_TYPE extends Win32Enum {

    /**
     * Native name: WctCriticalSectionType
     * @type {Integer (Int32)}
     */
    static CriticalSectionType => 1

    /**
     * Native name: WctSendMessageType
     * @type {Integer (Int32)}
     */
    static SendMessageType => 2

    /**
     * Native name: WctMutexType
     * @type {Integer (Int32)}
     */
    static MutexType => 3

    /**
     * Native name: WctAlpcType
     * @type {Integer (Int32)}
     */
    static AlpcType => 4

    /**
     * Native name: WctComType
     * @type {Integer (Int32)}
     */
    static ComType => 5

    /**
     * Native name: WctThreadWaitType
     * @type {Integer (Int32)}
     */
    static ThreadWaitType => 6

    /**
     * Native name: WctProcessWaitType
     * @type {Integer (Int32)}
     */
    static ProcessWaitType => 7

    /**
     * Native name: WctThreadType
     * @type {Integer (Int32)}
     */
    static ThreadType => 8

    /**
     * Native name: WctComActivationType
     * @type {Integer (Int32)}
     */
    static ComActivationType => 9

    /**
     * Native name: WctUnknownType
     * @type {Integer (Int32)}
     */
    static UnknownType => 10

    /**
     * Native name: WctSocketIoType
     * @type {Integer (Int32)}
     */
    static SocketIoType => 11

    /**
     * Native name: WctSmbIoType
     * @type {Integer (Int32)}
     */
    static SmbIoType => 12

    /**
     * Native name: WctMaxType
     * @type {Integer (Int32)}
     */
    static MaxType => 13
}
