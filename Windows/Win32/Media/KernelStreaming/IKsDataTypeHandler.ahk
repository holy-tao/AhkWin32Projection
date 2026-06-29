#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\KSIOOPERATION.ahk" { KSIOOPERATION }
#Import "..\MediaFoundation\AM_MEDIA_TYPE.ahk" { AM_MEDIA_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\DirectShow\IMediaSample.ahk" { IMediaSample }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct IKsDataTypeHandler extends IUnknown {
    /**
     * The interface identifier for IKsDataTypeHandler
     * @type {Guid}
     */
    static IID := Guid("{5ffbaa02-49a3-11d0-9f36-00aa00a216a1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKsDataTypeHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        KsCompleteIoOperation : IntPtr
        KsIsMediaTypeInRanges : IntPtr
        KsPrepareIoOperation  : IntPtr
        KsQueryExtendedSize   : IntPtr
        KsSetMediaType        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKsDataTypeHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IMediaSample} Sample 
     * @param {Pointer<Void>} StreamHeader 
     * @param {KSIOOPERATION} IoOperation 
     * @param {BOOL} Cancelled 
     * @returns {HRESULT} 
     */
    KsCompleteIoOperation(Sample, StreamHeader, IoOperation, Cancelled) {
        StreamHeaderMarshal := StreamHeader is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", Sample, StreamHeaderMarshal, StreamHeader, KSIOOPERATION, IoOperation, BOOL, Cancelled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} DataRanges 
     * @returns {HRESULT} 
     */
    KsIsMediaTypeInRanges(DataRanges) {
        DataRangesMarshal := DataRanges is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, DataRangesMarshal, DataRanges, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMediaSample} Sample 
     * @param {Pointer<Void>} StreamHeader 
     * @param {KSIOOPERATION} IoOperation 
     * @returns {HRESULT} 
     */
    KsPrepareIoOperation(Sample, StreamHeader, IoOperation) {
        StreamHeaderMarshal := StreamHeader is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "ptr", Sample, StreamHeaderMarshal, StreamHeader, KSIOOPERATION, IoOperation, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    KsQueryExtendedSize() {
        result := ComCall(6, this, "uint*", &ExtendedSize := 0, "HRESULT")
        return ExtendedSize
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} AmMediaType 
     * @returns {HRESULT} 
     */
    KsSetMediaType(AmMediaType) {
        result := ComCall(7, this, AM_MEDIA_TYPE.Ptr, AmMediaType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IKsDataTypeHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.KsCompleteIoOperation := CallbackCreate(GetMethod(implObj, "KsCompleteIoOperation"), flags, 5)
        this.vtbl.KsIsMediaTypeInRanges := CallbackCreate(GetMethod(implObj, "KsIsMediaTypeInRanges"), flags, 2)
        this.vtbl.KsPrepareIoOperation := CallbackCreate(GetMethod(implObj, "KsPrepareIoOperation"), flags, 4)
        this.vtbl.KsQueryExtendedSize := CallbackCreate(GetMethod(implObj, "KsQueryExtendedSize"), flags, 2)
        this.vtbl.KsSetMediaType := CallbackCreate(GetMethod(implObj, "KsSetMediaType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.KsCompleteIoOperation)
        CallbackFree(this.vtbl.KsIsMediaTypeInRanges)
        CallbackFree(this.vtbl.KsPrepareIoOperation)
        CallbackFree(this.vtbl.KsQueryExtendedSize)
        CallbackFree(this.vtbl.KsSetMediaType)
    }
}
