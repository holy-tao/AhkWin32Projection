#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\SpeechAudioState.ahk" { SpeechAudioState }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechAudioStatus extends IDispatch {
    /**
     * The interface identifier for ISpeechAudioStatus
     * @type {Guid}
     */
    static IID := Guid("{c62d9c91-7458-47f6-862d-1ef86fb0b278}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechAudioStatus interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_FreeBufferSpace       : IntPtr
        get_NonBlockingIO         : IntPtr
        get_State                 : IntPtr
        get_CurrentSeekPosition   : IntPtr
        get_CurrentDevicePosition : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechAudioStatus.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    FreeBufferSpace {
        get => this.get_FreeBufferSpace()
    }

    /**
     * @type {Integer} 
     */
    NonBlockingIO {
        get => this.get_NonBlockingIO()
    }

    /**
     * @type {SpeechAudioState} 
     */
    State {
        get => this.get_State()
    }

    /**
     * @type {VARIANT} 
     */
    CurrentSeekPosition {
        get => this.get_CurrentSeekPosition()
    }

    /**
     * @type {VARIANT} 
     */
    CurrentDevicePosition {
        get => this.get_CurrentDevicePosition()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FreeBufferSpace() {
        result := ComCall(7, this, "int*", &FreeBufferSpace := 0, "HRESULT")
        return FreeBufferSpace
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NonBlockingIO() {
        result := ComCall(8, this, "int*", &NonBlockingIO := 0, "HRESULT")
        return NonBlockingIO
    }

    /**
     * 
     * @returns {SpeechAudioState} 
     */
    get_State() {
        result := ComCall(9, this, "int*", &State := 0, "HRESULT")
        return State
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_CurrentSeekPosition() {
        CurrentSeekPosition := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, CurrentSeekPosition, "HRESULT")
        return CurrentSeekPosition
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_CurrentDevicePosition() {
        CurrentDevicePosition := VARIANT()
        result := ComCall(11, this, VARIANT.Ptr, CurrentDevicePosition, "HRESULT")
        return CurrentDevicePosition
    }

    Query(iid) {
        if (ISpeechAudioStatus.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_FreeBufferSpace := CallbackCreate(GetMethod(implObj, "get_FreeBufferSpace"), flags, 2)
        this.vtbl.get_NonBlockingIO := CallbackCreate(GetMethod(implObj, "get_NonBlockingIO"), flags, 2)
        this.vtbl.get_State := CallbackCreate(GetMethod(implObj, "get_State"), flags, 2)
        this.vtbl.get_CurrentSeekPosition := CallbackCreate(GetMethod(implObj, "get_CurrentSeekPosition"), flags, 2)
        this.vtbl.get_CurrentDevicePosition := CallbackCreate(GetMethod(implObj, "get_CurrentDevicePosition"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_FreeBufferSpace)
        CallbackFree(this.vtbl.get_NonBlockingIO)
        CallbackFree(this.vtbl.get_State)
        CallbackFree(this.vtbl.get_CurrentSeekPosition)
        CallbackFree(this.vtbl.get_CurrentDevicePosition)
    }
}
