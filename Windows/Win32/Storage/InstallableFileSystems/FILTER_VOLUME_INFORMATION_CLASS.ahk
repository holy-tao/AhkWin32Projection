#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 */
export default struct FILTER_VOLUME_INFORMATION_CLASS {
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
    static FilterVolumeBasicInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static FilterVolumeStandardInformation => 1
}
