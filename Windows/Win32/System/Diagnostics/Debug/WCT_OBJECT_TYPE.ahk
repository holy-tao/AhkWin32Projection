#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WCT_OBJECT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static WctCriticalSectionType => 1

    /**
     * @type {Integer (Int32)}
     */
    static WctSendMessageType => 2

    /**
     * @type {Integer (Int32)}
     */
    static WctMutexType => 3

    /**
     * @type {Integer (Int32)}
     */
    static WctAlpcType => 4

    /**
     * @type {Integer (Int32)}
     */
    static WctComType => 5

    /**
     * @type {Integer (Int32)}
     */
    static WctThreadWaitType => 6

    /**
     * @type {Integer (Int32)}
     */
    static WctProcessWaitType => 7

    /**
     * @type {Integer (Int32)}
     */
    static WctThreadType => 8

    /**
     * @type {Integer (Int32)}
     */
    static WctComActivationType => 9

    /**
     * @type {Integer (Int32)}
     */
    static WctUnknownType => 10

    /**
     * @type {Integer (Int32)}
     */
    static WctSocketIoType => 11

    /**
     * @type {Integer (Int32)}
     */
    static WctSmbIoType => 12

    /**
     * @type {Integer (Int32)}
     */
    static WctMaxType => 13
}
