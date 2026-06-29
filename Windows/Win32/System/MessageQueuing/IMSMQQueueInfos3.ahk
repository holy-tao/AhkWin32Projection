#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSMQQueueInfo3.ahk" { IMSMQQueueInfo3 }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct IMSMQQueueInfos3 extends IDispatch {
    /**
     * The interface identifier for IMSMQQueueInfos3
     * @type {Guid}
     */
    static IID := Guid("{eba96b1e-2168-11d3-898c-00e02c074f6b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSMQQueueInfos3 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Reset          : IntPtr
        Next           : IntPtr
        get_Properties : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSMQQueueInfos3.Vtbl()
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
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMSMQQueueInfo3} 
     */
    Next() {
        result := ComCall(8, this, "ptr*", &ppqinfoNext := 0, "HRESULT")
        return IMSMQQueueInfo3(ppqinfoNext)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Properties() {
        result := ComCall(9, this, "ptr*", &ppcolProperties := 0, "HRESULT")
        return IDispatch(ppcolProperties)
    }

    Query(iid) {
        if (IMSMQQueueInfos3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 2)
        this.vtbl.get_Properties := CallbackCreate(GetMethod(implObj, "get_Properties"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.get_Properties)
    }
}
