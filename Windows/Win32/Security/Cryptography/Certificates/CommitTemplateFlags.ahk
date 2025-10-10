#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies options for saving and deleting templates.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/ne-certenroll-committemplateflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class CommitTemplateFlags{

    /**
     * Save the template and create an object identifier for it.
     * @type {Integer (Int32)}
     */
    static CommitFlagSaveTemplateGenerateOID => 1

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static CommitFlagSaveTemplateUseCurrentOID => 2

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static CommitFlagSaveTemplateOverwrite => 3

    /**
     * Delete the template.
     * @type {Integer (Int32)}
     */
    static CommitFlagDeleteTemplate => 4
}
