#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSMQQueueInfo.ahk" { IMSMQQueueInfo }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct IMSMQQueueInfos extends IDispatch {
    /**
     * The interface identifier for IMSMQQueueInfos
     * @type {Guid}
     */
    static IID := Guid("{d7d6e07d-dccd-11d0-aa4b-0060970debae}")

    /**
     * The class identifier for MSMQQueueInfos
     * @type {Guid}
     */
    static CLSID := Guid("{d7d6e07e-dccd-11d0-aa4b-0060970debae}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSMQQueueInfos interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Reset : IntPtr
        Next  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSMQQueueInfos.Vtbl()
        }
        super.__New(implObj, flags)
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
     * @returns {IMSMQQueueInfo} 
     */
    Next() {
        result := ComCall(8, this, "ptr*", &ppqinfoNext := 0, "HRESULT")
        return IMSMQQueueInfo(ppqinfoNext)
    }

    Query(iid) {
        if (IMSMQQueueInfos.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Next)
    }
}
