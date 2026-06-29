#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct CameraUIControlCaptureMode {
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
    static PhotoOrVideo => 0

    /**
     * @type {Integer (Int32)}
     */
    static Photo => 1

    /**
     * @type {Integer (Int32)}
     */
    static Video => 2
}
