#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SHELL_ITEM_RESOURCE.ahk" { SHELL_ITEM_RESOURCE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes resource enumeration methods.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ienumresources
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IEnumResources extends IUnknown {
    /**
     * The interface identifier for IEnumResources
     * @type {Guid}
     */
    static IID := Guid("{2dd81fe3-a83c-4da9-a330-47249d345ba1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumResources interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumResources.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the next SHELL_ITEM_RESOURCE structure.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of resources requested. Currently, must be 1.
     * @param {Pointer<SHELL_ITEM_RESOURCE>} psir Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shell_item_resource">SHELL_ITEM_RESOURCE</a>*</b>
     * 
     * Receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-shell_item_resource">SHELL_ITEM_RESOURCE</a> structure.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * A pointer to the number of resources retrieved. Currently, not used.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumresources-next
     */
    Next(celt, psir, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, SHELL_ITEM_RESOURCE.Ptr, psir, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * Skips a specified number of resources.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of resources to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumresources-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration index to 0. (IEnumResources.Reset)
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumresources-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Clones a resource enumerator.
     * @returns {IEnumResources} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumresources">IEnumResources</a>**</b>
     * 
     * Contains the address of an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumresources">IEnumResources</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumresources-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenumr := 0, "HRESULT")
        return IEnumResources(ppenumr)
    }

    Query(iid) {
        if (IEnumResources.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
        this.vtbl.Skip := CallbackCreate(GetMethod(implObj, "Skip"), flags, 2)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Clone := CallbackCreate(GetMethod(implObj, "Clone"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.Skip)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Clone)
    }
}
