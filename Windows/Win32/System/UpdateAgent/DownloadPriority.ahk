#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the possible priorities for a download operation.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/ne-wuapi-downloadpriority
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct DownloadPriority {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Updates are downloaded as low priority.
     * @type {Integer (Int32)}
     */
    static dpLow => 1

    /**
     * Updates are downloaded as normal priority.
     * @type {Integer (Int32)}
     */
    static dpNormal => 2

    /**
     * Updates are downloaded as high priority.
     * @type {Integer (Int32)}
     */
    static dpHigh => 3

    /**
     * @type {Integer (Int32)}
     */
    static dpExtraHigh => 4
}
