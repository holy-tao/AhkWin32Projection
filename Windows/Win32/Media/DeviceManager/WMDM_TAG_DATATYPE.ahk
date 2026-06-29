#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMDM\_TAG\_DATATYPE enumeration type defines a data type.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-tag-datatype
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct WMDM_TAG_DATATYPE {
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
    static WMDM_TYPE_DWORD => 0

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_TYPE_STRING => 1

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_TYPE_BINARY => 2

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_TYPE_BOOL => 3

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_TYPE_QWORD => 4

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_TYPE_WORD => 5

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_TYPE_GUID => 6

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_TYPE_DATE => 7
}
