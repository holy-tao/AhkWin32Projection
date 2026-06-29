#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies options for saving and deleting templates.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-committemplateflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct CommitTemplateFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
