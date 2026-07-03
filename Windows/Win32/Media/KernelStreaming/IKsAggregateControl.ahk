#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct IKsAggregateControl extends IUnknown {
    /**
     * The interface identifier for IKsAggregateControl
     * @type {Guid}
     */
    static IID := Guid("{7f40eac0-3947-11d2-874e-00a0c9223196}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKsAggregateControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        KsAddAggregate    : IntPtr
        KsRemoveAggregate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKsAggregateControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Guid>} AggregateClass 
     * @returns {HRESULT} 
     */
    KsAddAggregate(AggregateClass) {
        result := ComCall(3, this, Guid.Ptr, AggregateClass, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} AggregateClass 
     * @returns {HRESULT} 
     */
    KsRemoveAggregate(AggregateClass) {
        result := ComCall(4, this, Guid.Ptr, AggregateClass, "HRESULT")
        return result
    }

    Query(iid) {
        if (IKsAggregateControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.KsAddAggregate := CallbackCreate(GetMethod(implObj, "KsAddAggregate"), flags, 2)
        this.vtbl.KsRemoveAggregate := CallbackCreate(GetMethod(implObj, "KsRemoveAggregate"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.KsAddAggregate)
        CallbackFree(this.vtbl.KsRemoveAggregate)
    }
}
