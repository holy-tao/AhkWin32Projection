#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct VS_FIXEDFILEINFO_FILE_FLAGS {
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
    static VS_FF_DEBUG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VS_FF_PRERELEASE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VS_FF_PATCHED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VS_FF_PRIVATEBUILD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VS_FF_INFOINFERRED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static VS_FF_SPECIALBUILD => 32
}
