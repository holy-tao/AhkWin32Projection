#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMSMQQueueInfos4.ahk" { IMSMQQueueInfos4 }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct IMSMQQuery4 extends IDispatch {
    /**
     * The interface identifier for IMSMQQuery4
     * @type {Guid}
     */
    static IID := Guid("{eba96b24-2168-11d3-898c-00e02c074f6b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSMQQuery4 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        LookupQueue_v2 : IntPtr
        get_Properties : IntPtr
        LookupQueue    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSMQQuery4.Vtbl()
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
     * @param {Pointer<VARIANT>} QueueGuid 
     * @param {Pointer<VARIANT>} ServiceTypeGuid 
     * @param {Pointer<VARIANT>} Label 
     * @param {Pointer<VARIANT>} CreateTime 
     * @param {Pointer<VARIANT>} ModifyTime 
     * @param {Pointer<VARIANT>} RelServiceType 
     * @param {Pointer<VARIANT>} RelLabel 
     * @param {Pointer<VARIANT>} RelCreateTime 
     * @param {Pointer<VARIANT>} RelModifyTime 
     * @returns {IMSMQQueueInfos4} 
     */
    LookupQueue_v2(QueueGuid, ServiceTypeGuid, Label, CreateTime, ModifyTime, RelServiceType, RelLabel, RelCreateTime, RelModifyTime) {
        result := ComCall(7, this, VARIANT.Ptr, QueueGuid, VARIANT.Ptr, ServiceTypeGuid, VARIANT.Ptr, Label, VARIANT.Ptr, CreateTime, VARIANT.Ptr, ModifyTime, VARIANT.Ptr, RelServiceType, VARIANT.Ptr, RelLabel, VARIANT.Ptr, RelCreateTime, VARIANT.Ptr, RelModifyTime, "ptr*", &ppqinfos := 0, "HRESULT")
        return IMSMQQueueInfos4(ppqinfos)
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Properties() {
        result := ComCall(8, this, "ptr*", &ppcolProperties := 0, "HRESULT")
        return IDispatch(ppcolProperties)
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
     * @param {Pointer<VARIANT>} MulticastAddress 
     * @param {Pointer<VARIANT>} RelMulticastAddress 
     * @returns {IMSMQQueueInfos4} 
     */
    LookupQueue(QueueGuid, ServiceTypeGuid, Label, CreateTime, ModifyTime, RelServiceType, RelLabel, RelCreateTime, RelModifyTime, MulticastAddress, RelMulticastAddress) {
        result := ComCall(9, this, VARIANT.Ptr, QueueGuid, VARIANT.Ptr, ServiceTypeGuid, VARIANT.Ptr, Label, VARIANT.Ptr, CreateTime, VARIANT.Ptr, ModifyTime, VARIANT.Ptr, RelServiceType, VARIANT.Ptr, RelLabel, VARIANT.Ptr, RelCreateTime, VARIANT.Ptr, RelModifyTime, VARIANT.Ptr, MulticastAddress, VARIANT.Ptr, RelMulticastAddress, "ptr*", &ppqinfos := 0, "HRESULT")
        return IMSMQQueueInfos4(ppqinfos)
    }

    Query(iid) {
        if (IMSMQQuery4.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LookupQueue_v2 := CallbackCreate(GetMethod(implObj, "LookupQueue_v2"), flags, 11)
        this.vtbl.get_Properties := CallbackCreate(GetMethod(implObj, "get_Properties"), flags, 2)
        this.vtbl.LookupQueue := CallbackCreate(GetMethod(implObj, "LookupQueue"), flags, 13)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LookupQueue_v2)
        CallbackFree(this.vtbl.get_Properties)
        CallbackFree(this.vtbl.LookupQueue)
    }
}
