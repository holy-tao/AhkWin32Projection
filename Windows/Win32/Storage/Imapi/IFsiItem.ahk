#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Base interface containing properties common to both file and directory items.
 * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nn-imapi2fs-ifsiitem
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IFsiItem extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsiItem
     * @type {Guid}
     */
    static IID => Guid("{2c941fd9-975b-59be-a960-9a2a262853a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_FullPath", "get_CreationTime", "put_CreationTime", "get_LastAccessedTime", "put_LastAccessedTime", "get_LastModifiedTime", "put_LastModifiedTime", "get_IsHidden", "put_IsHidden", "FileSystemName", "FileSystemPath"]

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-get_name
     */
    get_Name(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-get_fullpath
     */
    get_FullPath(pVal) {
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-get_creationtime
     */
    get_CreationTime(pVal) {
        result := ComCall(9, this, "double*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-put_creationtime
     */
    put_CreationTime(newVal) {
        result := ComCall(10, this, "double", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-get_lastaccessedtime
     */
    get_LastAccessedTime(pVal) {
        result := ComCall(11, this, "double*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-put_lastaccessedtime
     */
    put_LastAccessedTime(newVal) {
        result := ComCall(12, this, "double", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-get_lastmodifiedtime
     */
    get_LastModifiedTime(pVal) {
        result := ComCall(13, this, "double*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-put_lastmodifiedtime
     */
    put_LastModifiedTime(newVal) {
        result := ComCall(14, this, "double", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-get_ishidden
     */
    get_IsHidden(pVal) {
        result := ComCall(15, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-put_ishidden
     */
    put_IsHidden(newVal) {
        result := ComCall(16, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fileSystem 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-filesystemname
     */
    FileSystemName(fileSystem, pVal) {
        result := ComCall(17, this, "int", fileSystem, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fileSystem 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsiitem-filesystempath
     */
    FileSystemPath(fileSystem, pVal) {
        result := ComCall(18, this, "int", fileSystem, "ptr", pVal, "HRESULT")
        return result
    }
}
