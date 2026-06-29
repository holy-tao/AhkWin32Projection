#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct OpenServiceActivityContentType {
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
    static ActivityContentNone => -1

    /**
     * @type {Integer (Int32)}
     */
    static ActivityContentDocument => 0

    /**
     * @type {Integer (Int32)}
     */
    static ActivityContentSelection => 1

    /**
     * @type {Integer (Int32)}
     */
    static ActivityContentLink => 2

    /**
     * @type {Integer (Int32)}
     */
    static ActivityContentCount => 3
}
