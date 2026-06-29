#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The WMDM\_FIND\_SCOPE enumeration type defines the scope of the storage object.
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdm-find-scope
 * @namespace Windows.Win32.Media.DeviceManager
 */
export default struct WMDM_FIND_SCOPE {
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
    static WMDM_FIND_SCOPE_GLOBAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static WMDM_FIND_SCOPE_IMMEDIATE_CHILDREN => 1
}
