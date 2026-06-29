#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct GPMReportType {
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
    static repXML => 0

    /**
     * @type {Integer (Int32)}
     */
    static repHTML => 1

    /**
     * @type {Integer (Int32)}
     */
    static repInfraXML => 2

    /**
     * @type {Integer (Int32)}
     */
    static repInfraRefreshXML => 3

    /**
     * @type {Integer (Int32)}
     */
    static repClientHealthXML => 4

    /**
     * @type {Integer (Int32)}
     */
    static repClientHealthRefreshXML => 5
}
