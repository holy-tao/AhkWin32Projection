#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SpeechAudioFormatType.ahk" { SpeechAudioFormatType }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISpeechWaveFormatEx.ahk" { ISpeechWaveFormatEx }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechAudioFormat extends IDispatch {
    /**
     * The interface identifier for ISpeechAudioFormat
     * @type {Guid}
     */
    static IID := Guid("{e6e9c590-3e18-40e3-8299-061f98bde7c7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechAudioFormat interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Type        : IntPtr
        put_Type        : IntPtr
        get_Guid        : IntPtr
        put_Guid        : IntPtr
        GetWaveFormatEx : IntPtr
        SetWaveFormatEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechAudioFormat.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {SpeechAudioFormatType} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * @type {BSTR} 
     */
    Guid {
        get => this.get_Guid()
        set => this.put_Guid(value)
    }

    /**
     * 
     * @returns {SpeechAudioFormatType} 
     */
    get_Type() {
        result := ComCall(7, this, "int*", &AudioFormat := 0, "HRESULT")
        return AudioFormat
    }

    /**
     * 
     * @param {SpeechAudioFormatType} AudioFormat 
     * @returns {HRESULT} 
     */
    put_Type(AudioFormat) {
        result := ComCall(8, this, SpeechAudioFormatType, AudioFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Guid() {
        Guid := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, Guid, "HRESULT")
        return Guid
    }

    /**
     * 
     * @param {BSTR} Guid 
     * @returns {HRESULT} 
     */
    put_Guid(Guid) {
        Guid := Guid is String ? BSTR.Alloc(Guid).Value : Guid

        result := ComCall(10, this, BSTR, Guid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISpeechWaveFormatEx} 
     */
    GetWaveFormatEx() {
        result := ComCall(11, this, "ptr*", &SpeechWaveFormatEx := 0, "HRESULT")
        return ISpeechWaveFormatEx(SpeechWaveFormatEx)
    }

    /**
     * 
     * @param {ISpeechWaveFormatEx} SpeechWaveFormatEx 
     * @returns {HRESULT} 
     */
    SetWaveFormatEx(SpeechWaveFormatEx) {
        result := ComCall(12, this, "ptr", SpeechWaveFormatEx, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISpeechAudioFormat.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Type := CallbackCreate(GetMethod(implObj, "get_Type"), flags, 2)
        this.vtbl.put_Type := CallbackCreate(GetMethod(implObj, "put_Type"), flags, 2)
        this.vtbl.get_Guid := CallbackCreate(GetMethod(implObj, "get_Guid"), flags, 2)
        this.vtbl.put_Guid := CallbackCreate(GetMethod(implObj, "put_Guid"), flags, 2)
        this.vtbl.GetWaveFormatEx := CallbackCreate(GetMethod(implObj, "GetWaveFormatEx"), flags, 2)
        this.vtbl.SetWaveFormatEx := CallbackCreate(GetMethod(implObj, "SetWaveFormatEx"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Type)
        CallbackFree(this.vtbl.put_Type)
        CallbackFree(this.vtbl.get_Guid)
        CallbackFree(this.vtbl.put_Guid)
        CallbackFree(this.vtbl.GetWaveFormatEx)
        CallbackFree(this.vtbl.SetWaveFormatEx)
    }
}
