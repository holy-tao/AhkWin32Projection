#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IAssocHandler.ahk" { IAssocHandler }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes a method that allows enumeration of a collection of handlers associated with particular file name extensions.
 * @remarks
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-shassocenumhandlers">SHAssocEnumHandlers</a> is the usual method of creating an IEnumAssocHandlers pointer.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ienumassochandlers
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IEnumAssocHandlers extends IUnknown {
    /**
     * The interface identifier for IEnumAssocHandlers
     * @type {Guid}
     */
    static IID := Guid("{973810ae-9599-4b88-9e4d-6ee98c9552da}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumAssocHandlers interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumAssocHandlers.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a specified number of elements.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of elements to retrieve.
     * @param {Pointer<IAssocHandler>} rgelt Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iassochandler">IAssocHandler</a>**</b>
     * 
     * When this method returns, contains the address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-iassochandler">IAssocHandler</a> pointers. Each <b>IAssocHandler</b> represents a single handler.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * When this method returns, contains a pointer to the number of elements retrieved.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumassochandlers-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, IAssocHandler.Ptr, rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEnumAssocHandlers.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Next)
    }
}
