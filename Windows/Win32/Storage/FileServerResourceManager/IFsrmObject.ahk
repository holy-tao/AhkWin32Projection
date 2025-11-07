#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Base class for all FSRM objects.
 * @see https://docs.microsoft.com/windows/win32/api//fsrm/nn-fsrm-ifsrmobject
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmObject extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmObject
     * @type {Guid}
     */
    static IID => Guid("{22bcef93-4a3f-4183-89f9-2f8b8a628aee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_Description", "put_Description", "Delete", "Commit"]

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmobject-get_id
     */
    get_Id() {
        id := Guid()
        result := ComCall(7, this, "ptr", id, "HRESULT")
        return id
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmobject-get_description
     */
    get_Description() {
        description := BSTR()
        result := ComCall(8, this, "ptr", description, "HRESULT")
        return description
    }

    /**
     * 
     * @param {BSTR} description 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmobject-put_description
     */
    put_Description(description) {
        description := description is String ? BSTR.Alloc(description).Value : description

        result := ComCall(9, this, "ptr", description, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmobject-delete
     */
    Delete() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmobject-commit
     */
    Commit() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}
