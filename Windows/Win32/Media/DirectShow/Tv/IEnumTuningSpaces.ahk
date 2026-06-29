#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITuningSpace.ahk" { ITuningSpace }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IEnumTuningSpaces interface is implemented on a standard COM collection of tuning space objects and is obtained through various ITuningSpaceContainer.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IEnumTuningSpaces)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ienumtuningspaces
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IEnumTuningSpaces extends IUnknown {
    /**
     * The interface identifier for IEnumTuningSpaces
     * @type {Guid}
     */
    static IID := Guid("{8b8eb248-fc2b-11d2-9d8c-00c04f72d980}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumTuningSpaces interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumTuningSpaces.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Next method retrieves the next n elements in the collection.
     * @param {Integer} celt The number of elements to retrieve.
     * @param {Pointer<ITuningSpace>} rgelt Address of an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ituningspace">ITuningSpace</a> interface pointers that will receive the retrieved Tuning Space objects.
     * @param {Pointer<Integer>} pceltFetched Receives the number of elements actually retrieved.
     * @returns {HRESULT} Returns S_OK if successful. This method will succeed even if <i>celt</i> is zero. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ienumtuningspaces-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, ITuningSpace.Ptr, rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * The Skip method skips the specified element in the collection.
     * @param {Integer} celt The index of the element to skip.
     * @returns {HRESULT} Returns S_OK if successful. This method will succeed even if <i>celt</i> is zero. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ienumtuningspaces-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The Reset method moves the iterator to the beginning of the collection.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ienumtuningspaces-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Clone method creates a new copy of the collection and all its sub-objects.
     * @returns {IEnumTuningSpaces} Address of an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ienumtuningspaces">IEnumTuningSpaces</a> interface pointer that will receive the returned interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ienumtuningspaces-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTuningSpaces(ppEnum)
    }

    Query(iid) {
        if (IEnumTuningSpaces.IID.Equals(iid)) {
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
