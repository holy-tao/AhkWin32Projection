#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Base class for all FSRM objects.
 * @see https://learn.microsoft.com/windows/win32/api/fsrm/nn-fsrm-ifsrmobject
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmObject extends IDispatch {
    /**
     * The interface identifier for IFsrmObject
     * @type {Guid}
     */
    static IID := Guid("{22bcef93-4a3f-4183-89f9-2f8b8a628aee}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmObject interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Id          : IntPtr
        get_Description : IntPtr
        put_Description : IntPtr
        Delete          : IntPtr
        Commit          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmObject.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Guid} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * Retrieves the identifier of the object.
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmobject-get_id
     */
    get_Id() {
        id := Guid()
        result := ComCall(7, this, Guid.Ptr, id, "HRESULT")
        return id
    }

    /**
     * Retrieves or sets the description of the object. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmobject-get_description
     */
    get_Description() {
        description := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, description, "HRESULT")
        return description
    }

    /**
     * Retrieves or sets the description of the object. (Put)
     * @param {BSTR} description 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmobject-put_description
     */
    put_Description(description) {
        description := description is String ? BSTR.Alloc(description).Value : description

        result := ComCall(9, this, BSTR, description, "HRESULT")
        return result
    }

    /**
     * Removes the object from the server's list of objects.
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrm/nf-fsrm-ifsrmobject-commit">IFsrmObject::Commit</a> method to complete the delete operation.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmobject-delete
     */
    Delete() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Saves the object in the server's list of objects.
     * @returns {HRESULT} The method returns the following return values as well as others depending of the object being committed.
     * @see https://learn.microsoft.com/windows/win32/api/fsrm/nf-fsrm-ifsrmobject-commit
     */
    Commit() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFsrmObject.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Id := CallbackCreate(GetMethod(implObj, "get_Id"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.Delete := CallbackCreate(GetMethod(implObj, "Delete"), flags, 1)
        this.vtbl.Commit := CallbackCreate(GetMethod(implObj, "Commit"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Id)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.Delete)
        CallbackFree(this.vtbl.Commit)
    }
}
