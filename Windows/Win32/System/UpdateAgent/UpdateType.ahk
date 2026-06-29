#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the types of update, such as a driver or software update.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/ne-wuapi-updatetype
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct UpdateType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the update is a software update.
     * @type {Integer (Int32)}
     */
    static utSoftware => 1

    /**
     * Indicates that the update is a driver update.
     * @type {Integer (Int32)}
     */
    static utDriver => 2
}
