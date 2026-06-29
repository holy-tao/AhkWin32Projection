#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct IEObjectType {
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
    static IE_EPM_OBJECT_EVENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static IE_EPM_OBJECT_MUTEX => 1

    /**
     * @type {Integer (Int32)}
     */
    static IE_EPM_OBJECT_SEMAPHORE => 2

    /**
     * @type {Integer (Int32)}
     */
    static IE_EPM_OBJECT_SHARED_MEMORY => 3

    /**
     * @type {Integer (Int32)}
     */
    static IE_EPM_OBJECT_WAITABLE_TIMER => 4

    /**
     * @type {Integer (Int32)}
     */
    static IE_EPM_OBJECT_FILE => 5

    /**
     * @type {Integer (Int32)}
     */
    static IE_EPM_OBJECT_NAMED_PIPE => 6

    /**
     * @type {Integer (Int32)}
     */
    static IE_EPM_OBJECT_REGISTRY => 7
}
