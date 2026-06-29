#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISpeechAudioBufferInfo.ahk" { ISpeechAudioBufferInfo }
#Import ".\ISpeechBaseStream.ahk" { ISpeechBaseStream }
#Import ".\ISpeechAudioFormat.ahk" { ISpeechAudioFormat }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpeechAudioStatus.ahk" { ISpeechAudioStatus }
#Import ".\SpeechAudioState.ahk" { SpeechAudioState }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechAudio extends ISpeechBaseStream {
    /**
     * The interface identifier for ISpeechAudio
     * @type {Guid}
     */
    static IID := Guid("{cff8e175-019e-11d3-a08e-00c04f8ef9b5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechAudio interfaces
    */
    struct Vtbl extends ISpeechBaseStream.Vtbl {
        get_Status           : IntPtr
        get_BufferInfo       : IntPtr
        get_DefaultFormat    : IntPtr
        get_Volume           : IntPtr
        put_Volume           : IntPtr
        get_BufferNotifySize : IntPtr
        put_BufferNotifySize : IntPtr
        get_EventHandle      : IntPtr
        SetState             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechAudio.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {ISpeechAudioStatus} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {ISpeechAudioBufferInfo} 
     */
    BufferInfo {
        get => this.get_BufferInfo()
    }

    /**
     * @type {ISpeechAudioFormat} 
     */
    DefaultFormat {
        get => this.get_DefaultFormat()
    }

    /**
     * @type {Integer} 
     */
    Volume {
        get => this.get_Volume()
        set => this.put_Volume(value)
    }

    /**
     * @type {Integer} 
     */
    BufferNotifySize {
        get => this.get_BufferNotifySize()
        set => this.put_BufferNotifySize(value)
    }

    /**
     * @type {Integer} 
     */
    EventHandle {
        get => this.get_EventHandle()
    }

    /**
     * 
     * @returns {ISpeechAudioStatus} 
     */
    get_Status() {
        result := ComCall(12, this, "ptr*", &_Status := 0, "HRESULT")
        return ISpeechAudioStatus(_Status)
    }

    /**
     * 
     * @returns {ISpeechAudioBufferInfo} 
     */
    get_BufferInfo() {
        result := ComCall(13, this, "ptr*", &BufferInfo := 0, "HRESULT")
        return ISpeechAudioBufferInfo(BufferInfo)
    }

    /**
     * 
     * @returns {ISpeechAudioFormat} 
     */
    get_DefaultFormat() {
        result := ComCall(14, this, "ptr*", &StreamFormat := 0, "HRESULT")
        return ISpeechAudioFormat(StreamFormat)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Volume() {
        result := ComCall(15, this, "int*", &Volume := 0, "HRESULT")
        return Volume
    }

    /**
     * 
     * @param {Integer} Volume 
     * @returns {HRESULT} 
     */
    put_Volume(Volume) {
        result := ComCall(16, this, "int", Volume, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BufferNotifySize() {
        result := ComCall(17, this, "int*", &BufferNotifySize := 0, "HRESULT")
        return BufferNotifySize
    }

    /**
     * 
     * @param {Integer} BufferNotifySize 
     * @returns {HRESULT} 
     */
    put_BufferNotifySize(BufferNotifySize) {
        result := ComCall(18, this, "int", BufferNotifySize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EventHandle() {
        result := ComCall(19, this, "int*", &EventHandle := 0, "HRESULT")
        return EventHandle
    }

    /**
     * 
     * @param {SpeechAudioState} State 
     * @returns {HRESULT} 
     */
    SetState(State) {
        result := ComCall(20, this, SpeechAudioState, State, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpeechAudio.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Status := CallbackCreate(GetMethod(implObj, "get_Status"), flags, 2)
        this.vtbl.get_BufferInfo := CallbackCreate(GetMethod(implObj, "get_BufferInfo"), flags, 2)
        this.vtbl.get_DefaultFormat := CallbackCreate(GetMethod(implObj, "get_DefaultFormat"), flags, 2)
        this.vtbl.get_Volume := CallbackCreate(GetMethod(implObj, "get_Volume"), flags, 2)
        this.vtbl.put_Volume := CallbackCreate(GetMethod(implObj, "put_Volume"), flags, 2)
        this.vtbl.get_BufferNotifySize := CallbackCreate(GetMethod(implObj, "get_BufferNotifySize"), flags, 2)
        this.vtbl.put_BufferNotifySize := CallbackCreate(GetMethod(implObj, "put_BufferNotifySize"), flags, 2)
        this.vtbl.get_EventHandle := CallbackCreate(GetMethod(implObj, "get_EventHandle"), flags, 2)
        this.vtbl.SetState := CallbackCreate(GetMethod(implObj, "SetState"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Status)
        CallbackFree(this.vtbl.get_BufferInfo)
        CallbackFree(this.vtbl.get_DefaultFormat)
        CallbackFree(this.vtbl.get_Volume)
        CallbackFree(this.vtbl.put_Volume)
        CallbackFree(this.vtbl.get_BufferNotifySize)
        CallbackFree(this.vtbl.put_BufferNotifySize)
        CallbackFree(this.vtbl.get_EventHandle)
        CallbackFree(this.vtbl.SetState)
    }
}
