#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSPIN_COMMUNICATION.ahk" { KSPIN_COMMUNICATION }
#Import ".\KSSTREAM_SEGMENT.ahk" { KSSTREAM_SEGMENT }
#Import "..\DirectShow\IMemAllocator.ahk" { IMemAllocator }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\DirectShow\IMediaSample.ahk" { IMediaSample }
#Import ".\KSIDENTIFIER.ahk" { KSIDENTIFIER }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\KSMULTIPLE_ITEM.ahk" { KSMULTIPLE_ITEM }
#Import ".\KSPEEKOPERATION.ahk" { KSPEEKOPERATION }

/**
 * The IKsPin interface provides a method to retrieve the mediums supported by a pin on a kernel-mode filter. IKsPin has additional methods besides the one shown here, but they are not supported for DirectShow.
 * @remarks
 * The **IKsPin** interface inherits from the [**IUnknown**](/windows/win32/api/unknwn/nn-unknwn-iunknown) interface. **IKsPin** also has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * You must include Ks.h before Ksproxy.h.
 * @see https://learn.microsoft.com/windows/win32/DirectShow/ikspin
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct IKsPin extends IUnknown {
    /**
     * The interface identifier for IKsPin
     * @type {Guid}
     */
    static IID := Guid("{b61178d1-a2d9-11cf-9e53-00aa00a216a1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKsPin interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        KsQueryMediums            : IntPtr
        KsQueryInterfaces         : IntPtr
        KsCreateSinkPinHandle     : IntPtr
        KsGetCurrentCommunication : IntPtr
        KsPropagateAcquire        : IntPtr
        KsDeliver                 : IntPtr
        KsMediaSamplesCompleted   : IntPtr
        KsPeekAllocator           : IntPtr
        KsReceiveAllocator        : IntPtr
        KsRenegotiateAllocator    : IntPtr
        KsIncrementPendingIoCount : IntPtr
        KsDecrementPendingIoCount : IntPtr
        KsQualityNotify           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKsPin.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The KsQueryMediums method retrieves the mediums supported by a pin.
     * @remarks
     * This method returns a task-allocated [**KSMULTIPLE\_ITEM**](ksmultiple-item.md) structure, which is followed by zero or more [**REGPINMEDIUM**](/windows/desktop/api/strmif/ns-strmif-regpinmedium) structures. The **Count** member of the **KSMULTIPLE\_ITEM** structure specifies the number of **REGPINMEDIUM** structures. Each **REGPINMEDIUM** structure defines a medium supported by the pin.
     * 
     * The caller must free the returned structures, using the **CoTaskMemFree** function.
     * 
     * You must include Ks.h before Ksproxy.h.
     * @returns {Pointer<KSMULTIPLE_ITEM>} 
     * @see https://learn.microsoft.com/windows/win32/DirectShow/ikspin-ksquerymediums
     */
    KsQueryMediums() {
        result := ComCall(3, this, "ptr*", &MediumList := 0, "HRESULT")
        return MediumList
    }

    /**
     * 
     * @returns {Pointer<KSMULTIPLE_ITEM>} 
     */
    KsQueryInterfaces() {
        result := ComCall(4, this, "ptr*", &InterfaceList := 0, "HRESULT")
        return InterfaceList
    }

    /**
     * 
     * @param {Pointer<KSIDENTIFIER>} _Interface 
     * @param {Pointer<KSIDENTIFIER>} Medium 
     * @returns {HRESULT} 
     */
    KsCreateSinkPinHandle(_Interface, Medium) {
        result := ComCall(5, this, KSIDENTIFIER.Ptr, _Interface, KSIDENTIFIER.Ptr, Medium, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<KSPIN_COMMUNICATION>} Communication 
     * @param {Pointer<KSIDENTIFIER>} _Interface 
     * @param {Pointer<KSIDENTIFIER>} Medium 
     * @returns {HRESULT} 
     */
    KsGetCurrentCommunication(Communication, _Interface, Medium) {
        CommunicationMarshal := Communication is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, CommunicationMarshal, Communication, KSIDENTIFIER.Ptr, _Interface, KSIDENTIFIER.Ptr, Medium, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    KsPropagateAcquire() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMediaSample} Sample 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    KsDeliver(Sample, Flags) {
        result := ComCall(8, this, "ptr", Sample, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<KSSTREAM_SEGMENT>} StreamSegment 
     * @returns {HRESULT} 
     */
    KsMediaSamplesCompleted(StreamSegment) {
        result := ComCall(9, this, KSSTREAM_SEGMENT.Ptr, StreamSegment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {KSPEEKOPERATION} Operation 
     * @returns {IMemAllocator} 
     */
    KsPeekAllocator(Operation) {
        result := ComCall(10, this, KSPEEKOPERATION, Operation, IMemAllocator)
        return result
    }

    /**
     * 
     * @param {IMemAllocator} MemAllocator 
     * @returns {HRESULT} 
     */
    KsReceiveAllocator(MemAllocator) {
        result := ComCall(11, this, "ptr", MemAllocator, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    KsRenegotiateAllocator() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    KsIncrementPendingIoCount() {
        result := ComCall(13, this, Int32)
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    KsDecrementPendingIoCount() {
        result := ComCall(14, this, Int32)
        return result
    }

    /**
     * 
     * @param {Integer} Proportion 
     * @param {Integer} TimeDelta 
     * @returns {HRESULT} 
     */
    KsQualityNotify(Proportion, TimeDelta) {
        result := ComCall(15, this, "uint", Proportion, "int64", TimeDelta, "HRESULT")
        return result
    }

    Query(iid) {
        if (IKsPin.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.KsQueryMediums := CallbackCreate(GetMethod(implObj, "KsQueryMediums"), flags, 2)
        this.vtbl.KsQueryInterfaces := CallbackCreate(GetMethod(implObj, "KsQueryInterfaces"), flags, 2)
        this.vtbl.KsCreateSinkPinHandle := CallbackCreate(GetMethod(implObj, "KsCreateSinkPinHandle"), flags, 3)
        this.vtbl.KsGetCurrentCommunication := CallbackCreate(GetMethod(implObj, "KsGetCurrentCommunication"), flags, 4)
        this.vtbl.KsPropagateAcquire := CallbackCreate(GetMethod(implObj, "KsPropagateAcquire"), flags, 1)
        this.vtbl.KsDeliver := CallbackCreate(GetMethod(implObj, "KsDeliver"), flags, 3)
        this.vtbl.KsMediaSamplesCompleted := CallbackCreate(GetMethod(implObj, "KsMediaSamplesCompleted"), flags, 2)
        this.vtbl.KsPeekAllocator := CallbackCreate(GetMethod(implObj, "KsPeekAllocator"), flags, 2)
        this.vtbl.KsReceiveAllocator := CallbackCreate(GetMethod(implObj, "KsReceiveAllocator"), flags, 2)
        this.vtbl.KsRenegotiateAllocator := CallbackCreate(GetMethod(implObj, "KsRenegotiateAllocator"), flags, 1)
        this.vtbl.KsIncrementPendingIoCount := CallbackCreate(GetMethod(implObj, "KsIncrementPendingIoCount"), flags, 1)
        this.vtbl.KsDecrementPendingIoCount := CallbackCreate(GetMethod(implObj, "KsDecrementPendingIoCount"), flags, 1)
        this.vtbl.KsQualityNotify := CallbackCreate(GetMethod(implObj, "KsQualityNotify"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.KsQueryMediums)
        CallbackFree(this.vtbl.KsQueryInterfaces)
        CallbackFree(this.vtbl.KsCreateSinkPinHandle)
        CallbackFree(this.vtbl.KsGetCurrentCommunication)
        CallbackFree(this.vtbl.KsPropagateAcquire)
        CallbackFree(this.vtbl.KsDeliver)
        CallbackFree(this.vtbl.KsMediaSamplesCompleted)
        CallbackFree(this.vtbl.KsPeekAllocator)
        CallbackFree(this.vtbl.KsReceiveAllocator)
        CallbackFree(this.vtbl.KsRenegotiateAllocator)
        CallbackFree(this.vtbl.KsIncrementPendingIoCount)
        CallbackFree(this.vtbl.KsDecrementPendingIoCount)
        CallbackFree(this.vtbl.KsQualityNotify)
    }
}
