#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a method that determines whether the Shell will be allowed to move, copy, delete, or rename a folder in a cloud provider's sync root.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/nn-shobjidl-istorageprovidercopyhook
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IStorageProviderCopyHook extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderCopyHook
     * @type {Guid}
     */
    static IID => Guid("{7bf992a9-af7a-4dba-b2e5-4d080b1ecbc6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CopyCallback"]

    /**
     * Determines whether the Shell will be allowed to move, copy, delete, or rename a folder in a cloud provider's sync root.
     * @remarks
     * The Shell calls the cloud provider's copy hook handler for every folder under the registered sync root. To register a copy hook handler for cloud folders, set the **CopyHook** value under the **HKEY_LOCAL_MACHINE/Software/Microsoft/Windows/CurrentVersion/Explorer/SyncRootManager/{SyncRootId}** key to the CLSID of the copy hook object.
     * 
     * When the **CopyCallback** method is called, the Shell initializes the [IStorageProviderCopyHook](nn-shobjidl-istorageprovidercopyhook.md) interface directly without using an [IShellExtInit](/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellextinit) interface first.
     * @param {HWND} hwnd_ A handle to the window that the copy hook handler should use as the parent for any user interface elements the handler may need to display. If **FOF_SILENT** is specified in *operation*, the method should ignore this parameter.
     * @param {Integer} operation The operation to perform. This parameter can be one of the values listed under the **wFunc** member of the [SHFILEOPSTRUCT](/windows/win32/api/shellapi/ns-shellapi-shfileopstructa) structure.
     * @param {Integer} flags The flags that control the operation. This parameter can be one or more of the values listed under the *fFlags* member of the [SHFILEOPSTRUCT](/windows/desktop/api/shellapi/ns-shellapi-shfileopstructa) structure.
     * 
     * For printer copy hooks, this value is one of the following values defined in shellapi.h.
     * 
     * | Value       | Description |
     * |-------------|------------|
     * |  **PO_DELETE**      | A printer is being deleted. The *srcFile* parameter points to the full path to the specified printer.           |
     * |  **PO_RENAME**       | A printer is being renamed. The *srcFile* parameter points to the printer's new name. The *destFile* parameter points to the old name.           |
     * | **PO_PORTCHANGE**    | Not supported. Do not use.          |
     * | **PO_REN_PORT**    | Not supported. Do not use.           |
     * @param {PWSTR} srcFile A pointer to a string that contains the name of the source folder.
     * @param {Integer} srcAttribs The attributes of the source folder. This parameter can be a combination of any of the file attribute flags (FILE_ATTRIBUTE_*) defined in the header files. See [File Attribute Constants](../fileio/file-attribute-constants.md).
     * @param {PWSTR} destFile A pointer to a string that contains the name of the destination folder.
     * @param {Integer} destAttribs The attributes of the destination folder. This parameter can be a combination of any of the file attribute flags (FILE_ATTRIBUTE_*) defined in the header files. See [File Attribute Constants](../fileio/file-attribute-constants.md).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/shell/nf-shobjidl-istorageprovidercopyhook-copycallback
     */
    CopyCallback(hwnd_, operation, flags, srcFile, srcAttribs, destFile, destAttribs) {
        hwnd_ := hwnd_ is Win32Handle ? NumGet(hwnd_, "ptr") : hwnd_
        srcFile := srcFile is String ? StrPtr(srcFile) : srcFile
        destFile := destFile is String ? StrPtr(destFile) : destFile

        result := ComCall(3, this, "ptr", hwnd_, "uint", operation, "uint", flags, "ptr", srcFile, "uint", srcAttribs, "ptr", destFile, "uint", destAttribs, "uint*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
