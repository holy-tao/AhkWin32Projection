#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IXpsPartIterator extends IUnknown {
    /**
     * The interface identifier for IXpsPartIterator
     * @type {Guid}
     */
    static IID := Guid("{0021d3cd-af6f-42ab-9999-14bc82a62d2e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsPartIterator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Reset   : IntPtr
        Current : IntPtr
        IsDone  : IntPtr
        Next    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsPartIterator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Reset() {
        ComCall(3, this)
    }

    /**
     * 
     * @param {Pointer<BSTR>} pUri 
     * @param {Pointer<IUnknown>} ppXpsPart 
     * @returns {HRESULT} 
     */
    Current(pUri, ppXpsPart) {
        result := ComCall(4, this, BSTR.Ptr, pUri, IUnknown.Ptr, ppXpsPart, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsDone() {
        result := ComCall(5, this, BOOL)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Next() {
        ComCall(6, this)
    }

    Query(iid) {
        if (IXpsPartIterator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Current := CallbackCreate(GetMethod(implObj, "Current"), flags, 3)
        this.vtbl.IsDone := CallbackCreate(GetMethod(implObj, "IsDone"), flags, 1)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Current)
        CallbackFree(this.vtbl.IsDone)
        CallbackFree(this.vtbl.Next)
    }
}
