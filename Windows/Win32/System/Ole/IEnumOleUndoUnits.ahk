#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IOleUndoUnit.ahk" { IOleUndoUnit }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Enumerates the undo units on the undo or redo stack.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/nn-ocidl-ienumoleundounits
 * @namespace Windows.Win32.System.Ole
 */
export default struct IEnumOleUndoUnits extends IUnknown {
    /**
     * The interface identifier for IEnumOleUndoUnits
     * @type {Guid}
     */
    static IID := Guid("{b3e7c340-ef97-11ce-9bc9-00aa00608e01}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumOleUndoUnits interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumOleUndoUnits.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the specified number of items in the enumeration sequence. (IEnumOleUndoUnits.Next)
     * @remarks
     * The caller is responsible for calling the Release method for each element in the array once this method returns successfully. If cUndoUnits is greater than one, the caller must also pass a non-NULL pointer to pcFetched to get the number of pointers it has to release. 
     * 
     * 
     * 
     * E_NOTIMPL is not allowed as a return value. If an error value is returned, no entries in the rgpcd array are valid on exit and require no release.
     * @param {Integer} cElt The number of items to be retrieved. If there are fewer than the requested number of items left in the sequence, this method retrieves the remaining elements.
     * @param {Pointer<IOleUndoUnit>} rgElt An array of enumerated items.
     * 
     * The enumerator is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a>, and the caller is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> through each pointer enumerated. If <i>cElt</i> is greater than 1, the caller must also pass a non-NULL pointer passed to <i>pcEltFetched</i> to know how many pointers to release.
     * @param {Pointer<Integer>} pcEltFetched The number of items that were retrieved. This parameter is always less than or equal to the number of items requested.
     * @returns {HRESULT} If the method retrieves the number of items requested, the return value is S_OK. Otherwise, it is S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ienumoleundounits-next
     */
    Next(cElt, rgElt, pcEltFetched) {
        pcEltFetchedMarshal := pcEltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cElt, IOleUndoUnit.Ptr, rgElt, pcEltFetchedMarshal, pcEltFetched, Int32)
        return result
    }

    /**
     * Skips over the specified number of items in the enumeration sequence. (IEnumOleUndoUnits.Skip)
     * @param {Integer} cElt The number of items to be skipped.
     * @returns {HRESULT} If the method skips the number of items requested, the return value is S_OK. Otherwise, it is S_FALSE.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ienumoleundounits-skip
     */
    Skip(cElt) {
        result := ComCall(4, this, "uint", cElt, "HRESULT")
        return result
    }

    /**
     * Resets the enumeration sequence to the beginning. (IEnumOleUndoUnits.Reset)
     * @remarks
     * There is no guarantee that the same set of objects will be enumerated after the reset operation has completed. A static collection is reset to the beginning, but it can be too expensive for some collections, such as files in a directory, to guarantee this condition.
     * @returns {HRESULT} This method returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ienumoleundounits-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Creates a new enumerator that contains the same enumeration state as the current one. (IEnumOleUndoUnits.Clone)
     * @returns {IEnumOleUndoUnits} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nn-ocidl-ienumoleundounits">IEnumOleUndoUnits</a> interface pointer on the newly created enumerator. The caller must release this enumerator separately from the one from which it was cloned.
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ienumoleundounits-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumOleUndoUnits(ppEnum)
    }

    Query(iid) {
        if (IEnumOleUndoUnits.IID.Equals(iid)) {
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
