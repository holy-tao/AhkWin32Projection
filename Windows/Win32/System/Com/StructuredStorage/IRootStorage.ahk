#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IUnknown.ahk

/**
 * The IRootStorage interface contains a single method that switches a storage object to a different underlying file and saves the storage object to that file.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-irootstorage
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class IRootStorage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRootStorage
     * @type {Guid}
     */
    static IID => Guid("{00000012-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SwitchToFile"]

    /**
     * The SwitchToFile method copies the current file associated with the storage object to a new file.
     * @param {PWSTR} pszFile A pointer to a null terminated string that specifies the file name for the new file. It cannot be the name of an existing file. If <b>NULL</b>, this method creates a temporary file with a unique name, and you can call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-istorage-stat">IStorage::Stat</a> to retrieve the name of the temporary file.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * | Return code | Description |
     * |----------------|---------------|
     * |S_OK | The file was successfully copied.|
     * |STG_E_MEDIUMFULL | The file was not copied because of insufficient space on the storage device.|
     * |STG_E_ACCESSDENIED | The file was not copied because the caller does not have permission to access storage device.|
     * |STG_E_INVALIDPOINTER | The file was not copied because the *pszFile* pointer is not valid.|
     * |STG_E_FILEALREADYEXISTS | The file was not copied because the new filename (*pszFile*) points to an existing file.|
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-irootstorage-switchtofile
     */
    SwitchToFile(pszFile) {
        pszFile := pszFile is String ? StrPtr(pszFile) : pszFile

        result := ComCall(3, this, "ptr", pszFile, "HRESULT")
        return result
    }
}
