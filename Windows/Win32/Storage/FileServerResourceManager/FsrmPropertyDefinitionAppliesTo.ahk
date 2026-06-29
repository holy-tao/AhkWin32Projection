#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Flags that indicate what a FSRM classification property can be applied to.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmpropertydefinitionappliesto
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct FsrmPropertyDefinitionAppliesTo {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates if a classification property can be applied to a file.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyDefinitionAppliesTo_Files => 1

    /**
     * Indicates if a classification property can be applied to a folder.
     * @type {Integer (Int32)}
     */
    static FsrmPropertyDefinitionAppliesTo_Folders => 2
}
