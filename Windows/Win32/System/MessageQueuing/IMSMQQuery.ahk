#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSMQQueueInfos.ahk" { IMSMQQueueInfos }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct IMSMQQuery extends IDispatch {
    /**
     * The interface identifier for IMSMQQuery
     * @type {Guid}
     */
    static IID := Guid("{d7d6e072-dccd-11d0-aa4b-0060970debae}")

    /**
     * The class identifier for MSMQQuery
     * @type {Guid}
     */
    static CLSID := Guid("{d7d6e073-dccd-11d0-aa4b-0060970debae}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSMQQuery interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        LookupQueue : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSMQQuery.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<VARIANT>} QueueGuid 
     * @param {Pointer<VARIANT>} ServiceTypeGuid 
     * @param {Pointer<VARIANT>} Label 
     * @param {Pointer<VARIANT>} CreateTime 
     * @param {Pointer<VARIANT>} ModifyTime 
     * @param {Pointer<VARIANT>} RelServiceType 
     * @param {Pointer<VARIANT>} RelLabel 
     * @param {Pointer<VARIANT>} RelCreateTime 
     * @param {Pointer<VARIANT>} RelModifyTime 
     * @returns {IMSMQQueueInfos} 
     */
    LookupQueue(QueueGuid, ServiceTypeGuid, Label, CreateTime, ModifyTime, RelServiceType, RelLabel, RelCreateTime, RelModifyTime) {
        result := ComCall(7, this, VARIANT.Ptr, QueueGuid, VARIANT.Ptr, ServiceTypeGuid, VARIANT.Ptr, Label, VARIANT.Ptr, CreateTime, VARIANT.Ptr, ModifyTime, VARIANT.Ptr, RelServiceType, VARIANT.Ptr, RelLabel, VARIANT.Ptr, RelCreateTime, VARIANT.Ptr, RelModifyTime, "ptr*", &ppqinfos := 0, "HRESULT")
        return IMSMQQueueInfos(ppqinfos)
    }

    Query(iid) {
        if (IMSMQQuery.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LookupQueue := CallbackCreate(GetMethod(implObj, "LookupQueue"), flags, 11)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LookupQueue)
    }
}
