#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct PROFILER_RELATIONSHIP_INFO {
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
    static PROFILER_PROPERTY_TYPE_NUMBER => 1

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_PROPERTY_TYPE_STRING => 2

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_PROPERTY_TYPE_HEAP_OBJECT => 3

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_PROPERTY_TYPE_EXTERNAL_OBJECT => 4

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_PROPERTY_TYPE_BSTR => 5

    /**
     * @type {Integer (Int32)}
     */
    static PROFILER_PROPERTY_TYPE_SUBSTRING => 6
}
