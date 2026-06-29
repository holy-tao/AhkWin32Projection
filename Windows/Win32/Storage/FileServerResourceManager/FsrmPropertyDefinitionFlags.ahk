#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Flags the describe the type of classification property.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmpropertydefinitionflags
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct FsrmPropertyDefinitionFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The FSRM classification property definition is defined globally, using group policy.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyDefinitionFlags_Global => 1

    /**
     * The FSRM classification property definition is deprecated.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyDefinitionFlags_Deprecated => 2

    /**
     * The FSRM classification property definition is used for security purposes.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyDefinitionFlags_Secure => 4
}
