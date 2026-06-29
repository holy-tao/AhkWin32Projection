#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISpeechAudio.ahk" { ISpeechAudio }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechMMSysAudio extends ISpeechAudio {
    /**
     * The interface identifier for ISpeechMMSysAudio
     * @type {Guid}
     */
    static IID := Guid("{3c76af6d-1fd7-4831-81d1-3b71d5a13c44}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechMMSysAudio interfaces
    */
    struct Vtbl extends ISpeechAudio.Vtbl {
        get_DeviceId : IntPtr
        put_DeviceId : IntPtr
        get_LineId   : IntPtr
        put_LineId   : IntPtr
        get_MMHandle : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechMMSysAudio.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    DeviceId {
        get => this.get_DeviceId()
        set => this.put_DeviceId(value)
    }

    /**
     * @type {Integer} 
     */
    LineId {
        get => this.get_LineId()
        set => this.put_LineId(value)
    }

    /**
     * @type {Integer} 
     */
    MMHandle {
        get => this.get_MMHandle()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DeviceId() {
        result := ComCall(21, this, "int*", &DeviceId := 0, "HRESULT")
        return DeviceId
    }

    /**
     * 
     * @param {Integer} DeviceId 
     * @returns {HRESULT} 
     */
    put_DeviceId(DeviceId) {
        result := ComCall(22, this, "int", DeviceId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LineId() {
        result := ComCall(23, this, "int*", &LineId := 0, "HRESULT")
        return LineId
    }

    /**
     * 
     * @param {Integer} LineId 
     * @returns {HRESULT} 
     */
    put_LineId(LineId) {
        result := ComCall(24, this, "int", LineId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MMHandle() {
        result := ComCall(25, this, "int*", &_Handle := 0, "HRESULT")
        return _Handle
    }

    Query(iid) {
        if (ISpeechMMSysAudio.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DeviceId := CallbackCreate(GetMethod(implObj, "get_DeviceId"), flags, 2)
        this.vtbl.put_DeviceId := CallbackCreate(GetMethod(implObj, "put_DeviceId"), flags, 2)
        this.vtbl.get_LineId := CallbackCreate(GetMethod(implObj, "get_LineId"), flags, 2)
        this.vtbl.put_LineId := CallbackCreate(GetMethod(implObj, "put_LineId"), flags, 2)
        this.vtbl.get_MMHandle := CallbackCreate(GetMethod(implObj, "get_MMHandle"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DeviceId)
        CallbackFree(this.vtbl.put_DeviceId)
        CallbackFree(this.vtbl.get_LineId)
        CallbackFree(this.vtbl.put_LineId)
        CallbackFree(this.vtbl.get_MMHandle)
    }
}
