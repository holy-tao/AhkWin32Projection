#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the options for applying template changes to derived objects.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmenums/ne-fsrmenums-fsrmtemplateapplyoptions
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct FsrmTemplateApplyOptions {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Apply template changes to derived objects only if the object's properties match the template's properties.
     * 
     * Note that the comparison is made against the template as it exists in the database, not your local copy that 
     *        has not been committed yet.
     * @type {Integer (Int32)}
     */
    static FsrmTemplateApplyOptions_ApplyToDerivedMatching => 1

    /**
     * Apply template changes to all derived objects, whether their properties match the template's or not.
     * @type {Integer (Int32)}
     */
    static FsrmTemplateApplyOptions_ApplyToDerivedAll => 2
}
