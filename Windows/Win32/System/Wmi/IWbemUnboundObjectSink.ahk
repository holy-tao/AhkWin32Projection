#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWbemClassObject.ahk" { IWbemClassObject }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWbemUnboundObjectSink interface is implemented by all logical event consumers. It is a simple sink interface that accepts delivery of event objects.
 * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nn-wbemprov-iwbemunboundobjectsink
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWbemUnboundObjectSink extends IUnknown {
    /**
     * The interface identifier for IWbemUnboundObjectSink
     * @type {Guid}
     */
    static IID := Guid("{e246107b-b06e-11d0-ad61-00c04fd8fdff}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemUnboundObjectSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        IndicateToConsumer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemUnboundObjectSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by WMI to actually deliver events to a consumer.
     * @remarks
     * WMI typically obtains the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemprov/nn-wbemprov-iwbemunboundobjectsink">IWbemUnboundObjectSink</a> pointer for a particular logical consumer from a event consumer provider which implements the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemprov/nn-wbemprov-iwbemeventconsumerprovider">IWbemEventConsumerProvider</a> interface. Then, Windows Management calls 
     * <b>IndicateToConsumer</b> to deliver the actual event objects.
     * 
     * Most implementations of 
     * <b>IndicateToConsumer</b> assume that the notification is asynchronous. To support synchronous notification, a sink must complete event processing in less than 20 milliseconds. Extremely fast event consumer providers that support synchronous notification must not hold the pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> interface or increment the pointer reference count in 
     * <b>IndicateToConsumer</b>. If 
     * <b>IndicateToConsumer</b> requires the class object defined by 
     * <b>IWbemClassObject</b> beyond the lifetime of the 
     * <b>IndicateToConsumer</b> call, make a copy of the object. However, if there must be long-term access to the information pointed to by the 
     * <b>IWbemClassObject</b> pointer, it is recommended that the event consumer provider not support synchronous notification. Event consumer providers indicate the type of notification that they support when they complete their registration.
     * @param {IWbemClassObject} pLogicalConsumer Pointer to the logical consumer object for which this set of objects is delivered.
     * @param {Integer} lNumObjects Number of objects delivered in the array that follows.
     * @param {Pointer<IWbemClassObject>} apObjects Pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> instances which represent the events delivered. Because each object in the array corresponds to a separate event, an implementation of 
     * <b>IndicateToConsumer</b> must treat each object separately.
     * @returns {HRESULT} This method returns <b>WBEM_S_NO_ERROR</b> if successful. Otherwise, the implementation should return an appropriate error code.
     * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbemunboundobjectsink-indicatetoconsumer
     */
    IndicateToConsumer(pLogicalConsumer, lNumObjects, apObjects) {
        result := ComCall(3, this, "ptr", pLogicalConsumer, "int", lNumObjects, IWbemClassObject.Ptr, apObjects, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWbemUnboundObjectSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IndicateToConsumer := CallbackCreate(GetMethod(implObj, "IndicateToConsumer"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IndicateToConsumer)
    }
}
