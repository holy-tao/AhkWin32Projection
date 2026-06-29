#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ParentalControls
 */
export default struct WPC_ARGS_APPLICATIONEVENT {
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
    static WPC_ARGS_APPLICATIONEVENT_SERIALIZEDAPPLICATION => 0

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_APPLICATIONEVENT_DECISION => 1

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_APPLICATIONEVENT_PROCESSID => 2

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_APPLICATIONEVENT_CREATIONTIME => 3

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_APPLICATIONEVENT_TIMEUSED => 4

    /**
     * @type {Integer (Int32)}
     */
    static WPC_ARGS_APPLICATIONEVENT_CARGS => 5
}
