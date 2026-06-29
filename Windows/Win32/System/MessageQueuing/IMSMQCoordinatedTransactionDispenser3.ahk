#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSMQTransaction3.ahk" { IMSMQTransaction3 }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct IMSMQCoordinatedTransactionDispenser3 extends IDispatch {
    /**
     * The interface identifier for IMSMQCoordinatedTransactionDispenser3
     * @type {Guid}
     */
    static IID := Guid("{eba96b14-2168-11d3-898c-00e02c074f6b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSMQCoordinatedTransactionDispenser3 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        BeginTransaction : IntPtr
        get_Properties   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSMQCoordinatedTransactionDispenser3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IDispatch} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @returns {IMSMQTransaction3} 
     */
    BeginTransaction() {
        result := ComCall(7, this, "ptr*", &ptransaction := 0, "HRESULT")
        return IMSMQTransaction3(ptransaction)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Properties() {
        result := ComCall(8, this, "ptr*", &ppcolProperties := 0, "HRESULT")
        return IDispatch(ppcolProperties)
    }

    Query(iid) {
        if (IMSMQCoordinatedTransactionDispenser3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.BeginTransaction := CallbackCreate(GetMethod(implObj, "BeginTransaction"), flags, 2)
        this.vtbl.get_Properties := CallbackCreate(GetMethod(implObj, "get_Properties"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.BeginTransaction)
        CallbackFree(this.vtbl.get_Properties)
    }
}
