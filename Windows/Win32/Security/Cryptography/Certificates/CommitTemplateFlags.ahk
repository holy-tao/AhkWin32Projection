#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies options for saving and deleting templates.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-committemplateflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
class CommitTemplateFlags extends Win32Enum {

    /**
     * Save the template and create an object identifier for it.
     * Native name: CommitFlagSaveTemplateGenerateOID
     * @type {Integer (Int32)}
     */
    static FlagSaveTemplateGenerateOID => 1

    /**
     * Not used.
     * Native name: CommitFlagSaveTemplateUseCurrentOID
     * @type {Integer (Int32)}
     */
    static FlagSaveTemplateUseCurrentOID => 2

    /**
     * Not used.
     * Native name: CommitFlagSaveTemplateOverwrite
     * @type {Integer (Int32)}
     */
    static FlagSaveTemplateOverwrite => 3

    /**
     * Delete the template.
     * Native name: CommitFlagDeleteTemplate
     * @type {Integer (Int32)}
     */
    static FlagDeleteTemplate => 4
}
