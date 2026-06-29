#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IComponent.ahk" { IComponent }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IEnumComponents interface provides a standard COM enumeration object for the components (substreams) in a given program stream.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IEnumComponents)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-ienumcomponents
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IEnumComponents extends IUnknown {
    /**
     * The interface identifier for IEnumComponents
     * @type {Guid}
     */
    static IID := Guid("{2a6e2939-2595-11d3-b64c-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEnumComponents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Next  : IntPtr
        Skip  : IntPtr
        Reset : IntPtr
        Clone : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEnumComponents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Next method retrieves the next n elements in the collection.
     * @param {Integer} celt The number of elements to retrieve.
     * @param {Pointer<IComponent>} rgelt Address of an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-icomponent">IComponent</a> interface pointers that will receive the retrieved <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/component-object">Component</a> objects.
     * @param {Pointer<Integer>} pceltFetched Receives the number of elements actually retrieved.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ienumcomponents-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, IComponent.Ptr, rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * The Skip method skips the specified element in the collection without retrieving it.
     * @param {Integer} celt Specifies the element to skip.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ienumcomponents-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The Reset method resets the enumerator to the beginning of the collection.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ienumcomponents-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The Clone method creates a new copy of the entire collection.
     * @remarks
     * The application must release this new collection when done with it.
     * @returns {IEnumComponents} Address of an <b>IEnumComponents</b> interface pointer that will be set to the new collection.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-ienumcomponents-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumComponents(ppEnum)
    }

    Query(iid) {
        if (IEnumComponents.IID.Equals(iid)) {
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
