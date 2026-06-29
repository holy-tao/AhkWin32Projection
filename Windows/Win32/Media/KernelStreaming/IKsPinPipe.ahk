#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IKsAllocatorEx.ahk" { IKsAllocatorEx }
#Import ".\KSALLOCATOR_FRAMING_EX.ahk" { KSALLOCATOR_FRAMING_EX }
#Import "..\DirectShow\IPin.ahk" { IPin }
#Import ".\FRAMING_PROP.ahk" { FRAMING_PROP }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FRAMING_CACHE_OPS.ahk" { FRAMING_CACHE_OPS }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\KSPEEKOPERATION.ahk" { KSPEEKOPERATION }

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct IKsPinPipe extends IUnknown {
    /**
     * The interface identifier for IKsPinPipe
     * @type {Guid}
     */
    static IID := Guid("{e539cd90-a8b4-11d1-8189-00a0c9062802}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IKsPinPipe interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        KsGetPinFramingCache   : IntPtr
        KsSetPinFramingCache   : IntPtr
        KsGetConnectedPin      : IntPtr
        KsGetPipe              : IntPtr
        KsSetPipe              : IntPtr
        KsGetPipeAllocatorFlag : IntPtr
        KsSetPipeAllocatorFlag : IntPtr
        KsGetPinBusCache       : IntPtr
        KsSetPinBusCache       : IntPtr
        KsGetPinName           : IntPtr
        KsGetFilterName        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IKsPinPipe.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<Pointer<KSALLOCATOR_FRAMING_EX>>} FramingEx 
     * @param {Pointer<FRAMING_PROP>} FramingProp 
     * @param {FRAMING_CACHE_OPS} Option 
     * @returns {HRESULT} 
     */
    KsGetPinFramingCache(FramingEx, FramingProp, Option) {
        FramingExMarshal := FramingEx is VarRef ? "ptr*" : "ptr"
        FramingPropMarshal := FramingProp is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, FramingExMarshal, FramingEx, FramingPropMarshal, FramingProp, FRAMING_CACHE_OPS, Option, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<KSALLOCATOR_FRAMING_EX>} FramingEx 
     * @param {Pointer<FRAMING_PROP>} FramingProp 
     * @param {FRAMING_CACHE_OPS} Option 
     * @returns {HRESULT} 
     */
    KsSetPinFramingCache(FramingEx, FramingProp, Option) {
        FramingPropMarshal := FramingProp is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, KSALLOCATOR_FRAMING_EX.Ptr, FramingEx, FramingPropMarshal, FramingProp, FRAMING_CACHE_OPS, Option, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IPin} 
     */
    KsGetConnectedPin() {
        result := ComCall(5, this, IPin)
        return result
    }

    /**
     * 
     * @param {KSPEEKOPERATION} Operation 
     * @returns {IKsAllocatorEx} 
     */
    KsGetPipe(Operation) {
        result := ComCall(6, this, KSPEEKOPERATION, Operation, IKsAllocatorEx)
        return result
    }

    /**
     * 
     * @param {IKsAllocatorEx} KsAllocator 
     * @returns {HRESULT} 
     */
    KsSetPipe(KsAllocator) {
        result := ComCall(7, this, "ptr", KsAllocator, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    KsGetPipeAllocatorFlag() {
        result := ComCall(8, this, UInt32)
        return result
    }

    /**
     * 
     * @param {Integer} Flag 
     * @returns {HRESULT} 
     */
    KsSetPipeAllocatorFlag(Flag) {
        result := ComCall(9, this, "uint", Flag, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Guid} 
     */
    KsGetPinBusCache() {
        result := ComCall(10, this, Guid)
        return result
    }

    /**
     * 
     * @param {Guid} Bus 
     * @returns {HRESULT} 
     */
    KsSetPinBusCache(Bus) {
        result := ComCall(11, this, Guid, Bus, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    KsGetPinName() {
        result := ComCall(12, this, PWSTR)
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    KsGetFilterName() {
        result := ComCall(13, this, PWSTR)
        return result
    }

    Query(iid) {
        if (IKsPinPipe.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.KsGetPinFramingCache := CallbackCreate(GetMethod(implObj, "KsGetPinFramingCache"), flags, 4)
        this.vtbl.KsSetPinFramingCache := CallbackCreate(GetMethod(implObj, "KsSetPinFramingCache"), flags, 4)
        this.vtbl.KsGetConnectedPin := CallbackCreate(GetMethod(implObj, "KsGetConnectedPin"), flags, 1)
        this.vtbl.KsGetPipe := CallbackCreate(GetMethod(implObj, "KsGetPipe"), flags, 2)
        this.vtbl.KsSetPipe := CallbackCreate(GetMethod(implObj, "KsSetPipe"), flags, 2)
        this.vtbl.KsGetPipeAllocatorFlag := CallbackCreate(GetMethod(implObj, "KsGetPipeAllocatorFlag"), flags, 1)
        this.vtbl.KsSetPipeAllocatorFlag := CallbackCreate(GetMethod(implObj, "KsSetPipeAllocatorFlag"), flags, 2)
        this.vtbl.KsGetPinBusCache := CallbackCreate(GetMethod(implObj, "KsGetPinBusCache"), flags, 1)
        this.vtbl.KsSetPinBusCache := CallbackCreate(GetMethod(implObj, "KsSetPinBusCache"), flags, 2)
        this.vtbl.KsGetPinName := CallbackCreate(GetMethod(implObj, "KsGetPinName"), flags, 1)
        this.vtbl.KsGetFilterName := CallbackCreate(GetMethod(implObj, "KsGetFilterName"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.KsGetPinFramingCache)
        CallbackFree(this.vtbl.KsSetPinFramingCache)
        CallbackFree(this.vtbl.KsGetConnectedPin)
        CallbackFree(this.vtbl.KsGetPipe)
        CallbackFree(this.vtbl.KsSetPipe)
        CallbackFree(this.vtbl.KsGetPipeAllocatorFlag)
        CallbackFree(this.vtbl.KsSetPipeAllocatorFlag)
        CallbackFree(this.vtbl.KsGetPinBusCache)
        CallbackFree(this.vtbl.KsSetPinBusCache)
        CallbackFree(this.vtbl.KsGetPinName)
        CallbackFree(this.vtbl.KsGetFilterName)
    }
}
