#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct USER_MARSHAL_CB_TYPE {
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
    static USER_MARSHAL_CB_BUFFER_SIZE => 0

    /**
     * @type {Integer (Int32)}
     */
    static USER_MARSHAL_CB_MARSHALL => 1

    /**
     * @type {Integer (Int32)}
     */
    static USER_MARSHAL_CB_UNMARSHALL => 2

    /**
     * @type {Integer (Int32)}
     */
    static USER_MARSHAL_CB_FREE => 3
}
