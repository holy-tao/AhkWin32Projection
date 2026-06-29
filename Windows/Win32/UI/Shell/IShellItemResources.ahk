#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumResources.ahk" { IEnumResources }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SHELL_ITEM_RESOURCE.ahk" { SHELL_ITEM_RESOURCE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Exposes methods to manipulate and query Shell item resources.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ishellitemresources
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellItemResources extends IUnknown {
    /**
     * The interface identifier for IShellItemResources
     * @type {Guid}
     */
    static IID := Guid("{ff5693be-2ce0-4d48-b5c5-40817d1acdb9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellItemResources interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAttributes          : IntPtr
        GetSize                : IntPtr
        GetTimes               : IntPtr
        SetTimes               : IntPtr
        GetResourceDescription : IntPtr
        EnumResources          : IntPtr
        SupportsResource       : IntPtr
        OpenResource           : IntPtr
        CreateResource         : IntPtr
        MarkForDelete          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellItemResources.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets resource attributes.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to resource attributes. The following are attribute values.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemresources-getattributes
     */
    GetAttributes() {
        result := ComCall(3, this, "uint*", &pdwAttributes := 0, "HRESULT")
        return pdwAttributes
    }

    /**
     * Gets the source size.
     * @returns {Integer} Type: <b>ULONGLONG*</b>
     * 
     * A pointer to the source size.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemresources-getsize
     */
    GetSize() {
        result := ComCall(4, this, "uint*", &pullSize := 0, "HRESULT")
        return pullSize
    }

    /**
     * Gets file times.
     * @param {Pointer<FILETIME>} pftCreation Type: <b>FILETIME*</b>
     * 
     * A pointer to the creation date and time as a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @param {Pointer<FILETIME>} pftWrite Type: <b>FILETIME*</b>
     * 
     * A pointer to write date and time as a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @param {Pointer<FILETIME>} pftAccess Type: <b>FILETIME*</b>
     * 
     * A pointer to access date and time as a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemresources-gettimes
     */
    GetTimes(pftCreation, pftWrite, pftAccess) {
        result := ComCall(5, this, FILETIME.Ptr, pftCreation, FILETIME.Ptr, pftWrite, FILETIME.Ptr, pftAccess, "HRESULT")
        return result
    }

    /**
     * Sets file times.
     * @param {Pointer<FILETIME>} pftCreation Type: <b>const FILETIME*</b>
     * 
     * A pointer to a creation date and time as a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @param {Pointer<FILETIME>} pftWrite Type: <b>const FILETIME*</b>
     * 
     * A pointer to a write date and time as a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @param {Pointer<FILETIME>} pftAccess Type: <b>const FILETIME*</b>
     * 
     * A pointer to an access date and time as a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemresources-settimes
     */
    SetTimes(pftCreation, pftWrite, pftAccess) {
        result := ComCall(6, this, FILETIME.Ptr, pftCreation, FILETIME.Ptr, pftWrite, FILETIME.Ptr, pftAccess, "HRESULT")
        return result
    }

    /**
     * Gets a resource description.
     * @param {Pointer<SHELL_ITEM_RESOURCE>} pcsir Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shell_item_resource">SHELL_ITEM_RESOURCE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shell_item_resource">SHELL_ITEM_RESOURCE</a> resource.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * A pointer to a resource description as a Unicode string.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemresources-getresourcedescription
     */
    GetResourceDescription(pcsir) {
        result := ComCall(7, this, SHELL_ITEM_RESOURCE.Ptr, pcsir, PWSTR.Ptr, &ppszDescription := 0, "HRESULT")
        return ppszDescription
    }

    /**
     * Gets a resource enumerator object.
     * @returns {IEnumResources} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumresources">IEnumResources</a>**</b>
     * 
     * The address of an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumresources">IEnumResources</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemresources-enumresources
     */
    EnumResources() {
        result := ComCall(8, this, "ptr*", &ppenumr := 0, "HRESULT")
        return IEnumResources(ppenumr)
    }

    /**
     * Retrieves whether an item supports a specified resource.
     * @param {Pointer<SHELL_ITEM_RESOURCE>} pcsir Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shell_item_resource">SHELL_ITEM_RESOURCE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shell_item_resource">SHELL_ITEM_RESOURCE</a> resource.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemresources-supportsresource
     */
    SupportsResource(pcsir) {
        result := ComCall(9, this, SHELL_ITEM_RESOURCE.Ptr, pcsir, "HRESULT")
        return result
    }

    /**
     * Opens a specified resource.
     * @param {Pointer<SHELL_ITEM_RESOURCE>} pcsir Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shell_item_resource">SHELL_ITEM_RESOURCE</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shell_item_resource">SHELL_ITEM_RESOURCE</a> resource.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to a desired IID.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The address of a pointer to a resource.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemresources-openresource
     */
    OpenResource(pcsir, riid) {
        result := ComCall(10, this, SHELL_ITEM_RESOURCE.Ptr, pcsir, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Creates a specified resource.
     * @param {Pointer<SHELL_ITEM_RESOURCE>} pcsir Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shell_item_resource">SHELL_ITEM_RESOURCE</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shell_item_resource">SHELL_ITEM_RESOURCE</a> resource.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to a desired IID.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The address of a pointer to the resource.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemresources-createresource
     */
    CreateResource(pcsir, riid) {
        result := ComCall(11, this, SHELL_ITEM_RESOURCE.Ptr, pcsir, Guid.Ptr, riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * Marks for delete.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ishellitemresources-markfordelete
     */
    MarkForDelete() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellItemResources.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAttributes := CallbackCreate(GetMethod(implObj, "GetAttributes"), flags, 2)
        this.vtbl.GetSize := CallbackCreate(GetMethod(implObj, "GetSize"), flags, 2)
        this.vtbl.GetTimes := CallbackCreate(GetMethod(implObj, "GetTimes"), flags, 4)
        this.vtbl.SetTimes := CallbackCreate(GetMethod(implObj, "SetTimes"), flags, 4)
        this.vtbl.GetResourceDescription := CallbackCreate(GetMethod(implObj, "GetResourceDescription"), flags, 3)
        this.vtbl.EnumResources := CallbackCreate(GetMethod(implObj, "EnumResources"), flags, 2)
        this.vtbl.SupportsResource := CallbackCreate(GetMethod(implObj, "SupportsResource"), flags, 2)
        this.vtbl.OpenResource := CallbackCreate(GetMethod(implObj, "OpenResource"), flags, 4)
        this.vtbl.CreateResource := CallbackCreate(GetMethod(implObj, "CreateResource"), flags, 4)
        this.vtbl.MarkForDelete := CallbackCreate(GetMethod(implObj, "MarkForDelete"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAttributes)
        CallbackFree(this.vtbl.GetSize)
        CallbackFree(this.vtbl.GetTimes)
        CallbackFree(this.vtbl.SetTimes)
        CallbackFree(this.vtbl.GetResourceDescription)
        CallbackFree(this.vtbl.EnumResources)
        CallbackFree(this.vtbl.SupportsResource)
        CallbackFree(this.vtbl.OpenResource)
        CallbackFree(this.vtbl.CreateResource)
        CallbackFree(this.vtbl.MarkForDelete)
    }
}
