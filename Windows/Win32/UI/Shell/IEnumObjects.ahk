#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods to enumerate unknown objects.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ienumobjects
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IEnumObjects extends IUnknown {
    /**
     * The interface identifier for IEnumObjects
     * @type {Guid}
     */
    static IID := Guid("{2c1c7e2e-2d0e-4059-831e-1e6f82335c2e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumObjects interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumObjects.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the next specified number and type of objects.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of objects to retrieve.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Reference to the desired interface ID.
     * @param {Pointer<Pointer<Void>>} rgelt Type: <b>void**</b>
     * 
     * When this method returns, contains the interface pointer requested in <i>riid</i>.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * Pointer to a <b>ULONG</b> value that, when this method returns, states the actual number of objects retrieved. This value can be <b>NULL</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the method successfully retrieved the requested objects. This method only returns S_OK if the full count of requested items are successfully retrieved.
     *                     
     *                     
     * 
     * S_FALSE indicates that more items were requested than remained in the enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumobjects-next
     */
    Next(celt, riid, rgelt, pceltFetched) {
        rgeltMarshal := rgelt is VarRef ? "ptr*" : "ptr"
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, Guid.Ptr, riid, rgeltMarshal, rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * Skips a specified number of objects.
     * @remarks
     * Enumeration index is advanced by the number of items skipped.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * The number of objects to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumobjects-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration index to 0. (IEnumObjects.Reset)
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumobjects-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Not implemented.Not implemented.
     * @returns {IEnumObjects} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ienumobjects">IEnumObjects</a>**</b>
     * 
     * Not used.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ienumobjects-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumObjects(ppenum)
    }

    Query(iid) {
        if (IEnumObjects.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 5)
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
