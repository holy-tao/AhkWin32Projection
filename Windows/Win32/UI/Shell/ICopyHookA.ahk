#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that creates a copy hook handler. (ANSI)
 * @remarks
 * The copy hook handler, which is an OLE in-process server (a dll), does not perform the task itself, but it does approve or disapprove the action. If the Shell receives approval from the copy hook handler, it performs the file system operation. Copy hook handlers are not informed about the success of an operation, so they cannot monitor actions taken on folder objects unless [FindFirstChangeNotification](/windows/desktop/api/fileapi/nf-fileapi-findfirstchangenotificationa) is used.
 * 
 * A folder object can have multiple copy hook handlers. For example, even if the Shell already has a copy hook handler registered for a particular folder object, you can still register one of your own. If two or more copy hook handlers are registered for an object, the Shell simply calls each of them before performing one of the specified file system operations.
 * 
 * The Shell initializes **ICopyHookA** directly, without using the [IShellExtInit](/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellextinit) interface first.
 * 
 * [CopyCallback](nf-shlobj-icopyhooka-copycallback.md) returns an int value that indicates whether the Shell should perform the operation. The Shell will call each copy hook handler registered for a folder object until all the handlers have been called or until one of them has returned a value other than IDYES. The handler returns IDYES to specify that the operation should be performed, or IDNO or IDCANCEL to specify that the operation should be discontinued.
 * 
 * Implement a copy hook handler when you want to be able to control when, or if, these file system operations are performed on a given object. You might want to use a copy hook handler on shared folders, for example.
 * 
 * You do not call this Shell extension directly. [CopyCallback](nf-shlobj-icopyhooka-copycallback.md) is called by the Shell prior to moving, copying, deleting, or renaming a Shell folder object.
 * 		
 * 
 * 
 * > [!NOTE]
 * > The shlobj.h header defines ICopyHook as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/nn-shlobj-icopyhooka
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 * @charset ANSI
 */
class ICopyHookA extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICopyHookA
     * @type {Guid}
     */
    static IID => Guid("{000214ef-0000-0000-c000-000000000046}")

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
     * Determines whether the Shell will be allowed to move, copy, delete, or rename a folder or printer object. (ANSI)
     * @remarks
     * The Shell calls each copy hook handler registered for a folder or printer object until all the handlers have been called, or until one of them returns IDNO or IDCANCEL.
     * 
     * Copy hook handlers for folders are registered under the following key:
     * 
     * **HKEY_CLASSES_ROOT/Directory/Shellex/CopyHookHandlers/your_copyhook/{copyhook CLSID value}**
     * 
     * Copy hook handlers for printers are registered under the following key.
     * 
     * **HKEY_CLASSES_ROOT/Printers/Shellex/CopyHookHandlers/your_copyhook/{copyhook CLSID value}**
     *                 
     * When this method is called, the Shell initializes the [ICopyHookA](nn-shlobj-icopyhooka.md) interface directly without using an [IShellExtInit](/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellextinit) interface first.
     * @param {HWND} _hwnd 
     * @param {Integer} wFunc The operation to perform. This parameter can be one of the values listed under the **wFunc** member of the [SHFILEOPSTRUCT](/windows/desktop/api/shellapi/ns-shellapi-shfileopstructa) structure.
     * @param {Integer} wFlags The flags that control the operation. This parameter can be one or more of the values listed under the *fFlags* member of the [SHFILEOPSTRUCT](/windows/desktop/api/shellapi/ns-shellapi-shfileopstructa) structure.
     * @param {PSTR} pszSrcFile A pointer to a string that contains the name of the source folder.
     * @param {Integer} dwSrcAttribs The attributes of the source folder. This parameter can be a combination of any of the file attribute flags (FILE_ATTRIBUTE_*) defined in the header files. See [File Attribute Constants](/windows/desktop/FileIO/file-attribute-constants).
     * @param {PSTR} pszDestFile A pointer to a string that contains the name of the destination folder.
     * @param {Integer} dwDestAttribs The attributes of the destination folder. This parameter can be a combination of any of the file attribute flags (FILE_ATTRIBUTE_*) defined in the header files. See [File Attribute Constants](/windows/desktop/FileIO/file-attribute-constants).
     * @returns {Integer} Returns an integer value that indicates whether the Shell should perform the operation. One of the following:
     * 
     * | Value       | Description |
     * |-------------|------------|
     * | **IDYES**       | Allows the operation.           |
     * | **IDNO**        | Prevents the operation on this folder but continues with any other operations that have been approved (for example, a batch copy operation).           |
     * | **IDCANCEL**    | Prevents the current operation and cancels any pending operations.           |
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-icopyhooka-copycallback
     */
    CopyCallback(_hwnd, wFunc, wFlags, pszSrcFile, dwSrcAttribs, pszDestFile, dwDestAttribs) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd
        pszSrcFile := pszSrcFile is String ? StrPtr(pszSrcFile) : pszSrcFile
        pszDestFile := pszDestFile is String ? StrPtr(pszDestFile) : pszDestFile

        result := ComCall(3, this, "ptr", _hwnd, "uint", wFunc, "uint", wFlags, "ptr", pszSrcFile, "uint", dwSrcAttribs, "ptr", pszDestFile, "uint", dwDestAttribs, "uint")
        return result
    }
}
