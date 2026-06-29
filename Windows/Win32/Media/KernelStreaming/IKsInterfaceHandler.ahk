#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IKsDataTypeHandler.ahk" { IKsDataTypeHandler }
#Import ".\KSSTREAM_SEGMENT.ahk" { KSSTREAM_SEGMENT }
#Import ".\IKsPin.ahk" { IKsPin }
#Import ".\KSIOOPERATION.ahk" { KSIOOPERATION }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\DirectShow\IMediaSample.ahk" { IMediaSample }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct IKsInterfaceHandler extends IUnknown {
    /**
     * The interface identifier for IKsInterfaceHandler
     * @type {Guid}
     */
    static IID := Guid("{d3abc7e0-9a61-11d0-a40d-00a0c9223196}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKsInterfaceHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        KsSetPin              : IntPtr
        KsProcessMediaSamples : IntPtr
        KsCompleteIo          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKsInterfaceHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IKsPin} KsPin 
     * @returns {HRESULT} 
     */
    KsSetPin(KsPin) {
        result := ComCall(3, this, "ptr", KsPin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IKsDataTypeHandler} KsDataTypeHandler 
     * @param {Pointer<IMediaSample>} SampleList 
     * @param {Pointer<Integer>} SampleCount 
     * @param {KSIOOPERATION} IoOperation 
     * @returns {Pointer<KSSTREAM_SEGMENT>} 
     */
    KsProcessMediaSamples(KsDataTypeHandler, SampleList, SampleCount, IoOperation) {
        SampleCountMarshal := SampleCount is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", KsDataTypeHandler, IMediaSample.Ptr, SampleList, SampleCountMarshal, SampleCount, KSIOOPERATION, IoOperation, "ptr*", &StreamSegment := 0, "HRESULT")
        return StreamSegment
    }

    /**
     * 
     * @param {Pointer<KSSTREAM_SEGMENT>} StreamSegment 
     * @returns {HRESULT} 
     */
    KsCompleteIo(StreamSegment) {
        result := ComCall(5, this, KSSTREAM_SEGMENT.Ptr, StreamSegment, "HRESULT")
        return result
    }

    Query(iid) {
        if (IKsInterfaceHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.KsSetPin := CallbackCreate(GetMethod(implObj, "KsSetPin"), flags, 2)
        this.vtbl.KsProcessMediaSamples := CallbackCreate(GetMethod(implObj, "KsProcessMediaSamples"), flags, 6)
        this.vtbl.KsCompleteIo := CallbackCreate(GetMethod(implObj, "KsCompleteIo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.KsSetPin)
        CallbackFree(this.vtbl.KsProcessMediaSamples)
        CallbackFree(this.vtbl.KsCompleteIo)
    }
}
