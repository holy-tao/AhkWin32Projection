#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct GPO_LINK {
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
    static GPLinkUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static GPLinkMachine => 1

    /**
     * @type {Integer (Int32)}
     */
    static GPLinkSite => 2

    /**
     * @type {Integer (Int32)}
     */
    static GPLinkDomain => 3

    /**
     * @type {Integer (Int32)}
     */
    static GPLinkOrganizationalUnit => 4
}
