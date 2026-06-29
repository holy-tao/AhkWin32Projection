#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechRecoResultTimes extends IDispatch {
    /**
     * The interface identifier for ISpeechRecoResultTimes
     * @type {Guid}
     */
    static IID := Guid("{62b3b8fb-f6e7-41be-bdcb-056b1c29efc0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechRecoResultTimes interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_StreamTime      : IntPtr
        get_Length          : IntPtr
        get_TickCount       : IntPtr
        get_OffsetFromStart : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechRecoResultTimes.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    StreamTime {
        get => this.get_StreamTime()
    }

    /**
     * @type {VARIANT} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * @type {Integer} 
     */
    TickCount {
        get => this.get_TickCount()
    }

    /**
     * @type {VARIANT} 
     */
    OffsetFromStart {
        get => this.get_OffsetFromStart()
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_StreamTime() {
        Time := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, Time, "HRESULT")
        return Time
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Length() {
        Length := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, Length, "HRESULT")
        return Length
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TickCount() {
        result := ComCall(9, this, "int*", &TickCount := 0, "HRESULT")
        return TickCount
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_OffsetFromStart() {
        OffsetFromStart := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, OffsetFromStart, "HRESULT")
        return OffsetFromStart
    }

    Query(iid) {
        if (ISpeechRecoResultTimes.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_StreamTime := CallbackCreate(GetMethod(implObj, "get_StreamTime"), flags, 2)
        this.vtbl.get_Length := CallbackCreate(GetMethod(implObj, "get_Length"), flags, 2)
        this.vtbl.get_TickCount := CallbackCreate(GetMethod(implObj, "get_TickCount"), flags, 2)
        this.vtbl.get_OffsetFromStart := CallbackCreate(GetMethod(implObj, "get_OffsetFromStart"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_StreamTime)
        CallbackFree(this.vtbl.get_Length)
        CallbackFree(this.vtbl.get_TickCount)
        CallbackFree(this.vtbl.get_OffsetFromStart)
    }
}
