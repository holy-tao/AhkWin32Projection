#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechAudioBufferInfo extends IDispatch {
    /**
     * The interface identifier for ISpeechAudioBufferInfo
     * @type {Guid}
     */
    static IID := Guid("{11b103d8-1142-4edf-a093-82fb3915f8cc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechAudioBufferInfo interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_MinNotification : IntPtr
        put_MinNotification : IntPtr
        get_BufferSize      : IntPtr
        put_BufferSize      : IntPtr
        get_EventBias       : IntPtr
        put_EventBias       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechAudioBufferInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    MinNotification {
        get => this.get_MinNotification()
        set => this.put_MinNotification(value)
    }

    /**
     * @type {Integer} 
     */
    BufferSize {
        get => this.get_BufferSize()
        set => this.put_BufferSize(value)
    }

    /**
     * @type {Integer} 
     */
    EventBias {
        get => this.get_EventBias()
        set => this.put_EventBias(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinNotification() {
        result := ComCall(7, this, "int*", &MinNotification := 0, "HRESULT")
        return MinNotification
    }

    /**
     * 
     * @param {Integer} MinNotification 
     * @returns {HRESULT} 
     */
    put_MinNotification(MinNotification) {
        result := ComCall(8, this, "int", MinNotification, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BufferSize() {
        result := ComCall(9, this, "int*", &BufferSize := 0, "HRESULT")
        return BufferSize
    }

    /**
     * 
     * @param {Integer} BufferSize 
     * @returns {HRESULT} 
     */
    put_BufferSize(BufferSize) {
        result := ComCall(10, this, "int", BufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EventBias() {
        result := ComCall(11, this, "int*", &EventBias := 0, "HRESULT")
        return EventBias
    }

    /**
     * 
     * @param {Integer} EventBias 
     * @returns {HRESULT} 
     */
    put_EventBias(EventBias) {
        result := ComCall(12, this, "int", EventBias, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpeechAudioBufferInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_MinNotification := CallbackCreate(GetMethod(implObj, "get_MinNotification"), flags, 2)
        this.vtbl.put_MinNotification := CallbackCreate(GetMethod(implObj, "put_MinNotification"), flags, 2)
        this.vtbl.get_BufferSize := CallbackCreate(GetMethod(implObj, "get_BufferSize"), flags, 2)
        this.vtbl.put_BufferSize := CallbackCreate(GetMethod(implObj, "put_BufferSize"), flags, 2)
        this.vtbl.get_EventBias := CallbackCreate(GetMethod(implObj, "get_EventBias"), flags, 2)
        this.vtbl.put_EventBias := CallbackCreate(GetMethod(implObj, "put_EventBias"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_MinNotification)
        CallbackFree(this.vtbl.put_MinNotification)
        CallbackFree(this.vtbl.get_BufferSize)
        CallbackFree(this.vtbl.put_BufferSize)
        CallbackFree(this.vtbl.get_EventBias)
        CallbackFree(this.vtbl.put_EventBias)
    }
}
