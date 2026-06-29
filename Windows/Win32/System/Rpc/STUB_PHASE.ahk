#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct STUB_PHASE {
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
    static STUB_UNMARSHAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static STUB_CALL_SERVER => 1

    /**
     * @type {Integer (Int32)}
     */
    static STUB_MARSHAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static STUB_CALL_SERVER_NO_HRESULT => 3
}
