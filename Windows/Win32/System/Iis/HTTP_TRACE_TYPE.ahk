#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HTTP_TRACE_TYPE {
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
    static HTTP_TRACE_TYPE_BYTE => 17

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_USHORT => 18

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_ULONG => 19

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_ULONGLONG => 21

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_CHAR => 16

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_SHORT => 2

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_LONG => 3

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_LONGLONG => 20

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_LPCWSTR => 31

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_LPCSTR => 30

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_LPCGUID => 72

    /**
     * @type {Integer (Int32)}
     */
    static HTTP_TRACE_TYPE_BOOL => 11
}
