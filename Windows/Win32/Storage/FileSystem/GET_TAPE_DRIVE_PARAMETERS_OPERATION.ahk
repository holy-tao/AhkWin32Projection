#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct GET_TAPE_DRIVE_PARAMETERS_OPERATION {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static GET_TAPE_DRIVE_INFORMATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GET_TAPE_MEDIA_INFORMATION => 0
}
