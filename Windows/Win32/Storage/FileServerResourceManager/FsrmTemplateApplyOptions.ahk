#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the options for applying template changes to derived objects.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmenums/ne-fsrmenums-fsrmtemplateapplyoptions
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class FsrmTemplateApplyOptions{

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
