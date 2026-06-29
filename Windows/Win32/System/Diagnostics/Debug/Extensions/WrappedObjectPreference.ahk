#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct WrappedObjectPreference {
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
    static WrappedObjectNameResolution => 0

    /**
     * @type {Integer (Int32)}
     */
    static WrappedObjectGeneralProxy => 1
}
