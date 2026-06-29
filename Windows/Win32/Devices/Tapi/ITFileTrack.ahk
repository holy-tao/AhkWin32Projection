#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITScriptableAudioFormat.ahk" { ITScriptableAudioFormat }
#Import ".\ITTerminal.ahk" { ITTerminal }
#Import "..\..\Media\MediaFoundation\AM_MEDIA_TYPE.ahk" { AM_MEDIA_TYPE }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITFileTrack interface exposes methods that allow an application to get and set information concerning file terminal tracks. The ITFileTerminalEvent::get_Track method creates the ITFileTrack interface.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itfiletrack
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITFileTrack extends IDispatch {
    /**
     * The interface identifier for ITFileTrack
     * @type {Guid}
     */
    static IID := Guid("{31ca6ea9-c08a-4bea-8811-8e9c1ba3ea3a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITFileTrack interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Format                       : IntPtr
        put_Format                       : IntPtr
        get_ControllingTerminal          : IntPtr
        get_AudioFormatForScripting      : IntPtr
        put_AudioFormatForScripting      : IntPtr
        get_EmptyAudioFormatForScripting : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITFileTrack.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Pointer<AM_MEDIA_TYPE>} 
     */
    Format {
        get => this.get_Format()
        set => this.put_Format(value)
    }

    /**
     * @type {ITTerminal} 
     */
    ControllingTerminal {
        get => this.get_ControllingTerminal()
    }

    /**
     * @type {ITScriptableAudioFormat} 
     */
    AudioFormatForScripting {
        get => this.get_AudioFormatForScripting()
        set => this.put_AudioFormatForScripting(value)
    }

    /**
     * @type {ITScriptableAudioFormat} 
     */
    EmptyAudioFormatForScripting {
        get => this.get_EmptyAudioFormatForScripting()
    }

    /**
     * The get_Format method gets the file terminal's format.
     * @returns {Pointer<AM_MEDIA_TYPE>} Pointer to an 
     * <b>AM_MEDIA_TYPE</b> descriptor of the terminal format. For more information on <b>AM_MEDIA_TYPE</b>, see the DirectX documentation.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfiletrack-get_format
     */
    get_Format() {
        result := ComCall(7, this, "ptr*", &ppmt := 0, "HRESULT")
        return ppmt
    }

    /**
     * The put_Format method sets the format type of the track.
     * @param {Pointer<AM_MEDIA_TYPE>} pmt The
     * <b>AM_MEDIA_TYPE</b> descriptor of the file track format. For more information about <b>AM_MEDIA_TYPE</b>, see the DirectX documentation. The <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itfiletrack">ITFileTrack</a> only supports the <b>FORMAT_WaveFormatEx</b> format type  in the <b>AM_MEDIA_TYPE</b> structure.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfiletrack-put_format
     */
    put_Format(pmt) {
        result := ComCall(8, this, AM_MEDIA_TYPE.Ptr, pmt, "HRESULT")
        return result
    }

    /**
     * The get_ControllingTerminal method returns the multitrack terminal that controls the current track.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface returned by <b>ITFileTrack::get_ControllingTerminal</b>. The application must call <b>Release</b> on 
     * <b>ITTerminal</b> to free resources associated with it.
     * @returns {ITTerminal} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfiletrack-get_controllingterminal
     */
    get_ControllingTerminal() {
        result := ComCall(9, this, "ptr*", &ppControllingTerminal := 0, "HRESULT")
        return ITTerminal(ppControllingTerminal)
    }

    /**
     * The get_AudioFormatForScripting method gets the audio scripting format.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itscriptableaudioformat">ITScriptableAudioFormat</a> interface returned by <b>ITFileTrack::get_AudioFormatForScripting</b>. The application must call <b>Release</b> on 
     * <b>ITScriptableAudioFormat</b> to free resources associated with it.
     * @returns {ITScriptableAudioFormat} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itscriptableaudioformat">ITScriptableAudioFormat</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfiletrack-get_audioformatforscripting
     */
    get_AudioFormatForScripting() {
        result := ComCall(10, this, "ptr*", &ppAudioFormat := 0, "HRESULT")
        return ITScriptableAudioFormat(ppAudioFormat)
    }

    /**
     * The put_AudioFormatForScripting method sets the audio scripting format.
     * @param {ITScriptableAudioFormat} pAudioFormat Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itscriptableaudioformat">ITScriptableAudioFormat</a> interface.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfiletrack-put_audioformatforscripting
     */
    put_AudioFormatForScripting(pAudioFormat) {
        result := ComCall(11, this, "ptr", pAudioFormat, "HRESULT")
        return result
    }

    /**
     * The get_EmptyAudioFormatForScripting method is used to get an ITScriptableAudioFormat interface with all fields set to 0.
     * @remarks
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itscriptableaudioformat">ITScriptableAudioFormat</a> interface returned by <b>ITFileTrack::get_EmptyAudioFormatForScripting</b>. The application must call <b>Release</b> on 
     * <b>ITScriptableAudioFormat</b> to free resources associated with it.
     * @returns {ITScriptableAudioFormat} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itscriptableaudioformat">ITScriptableAudioFormat</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itfiletrack-get_emptyaudioformatforscripting
     */
    get_EmptyAudioFormatForScripting() {
        result := ComCall(12, this, "ptr*", &ppAudioFormat := 0, "HRESULT")
        return ITScriptableAudioFormat(ppAudioFormat)
    }

    Query(iid) {
        if (ITFileTrack.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Format := CallbackCreate(GetMethod(implObj, "get_Format"), flags, 2)
        this.vtbl.put_Format := CallbackCreate(GetMethod(implObj, "put_Format"), flags, 2)
        this.vtbl.get_ControllingTerminal := CallbackCreate(GetMethod(implObj, "get_ControllingTerminal"), flags, 2)
        this.vtbl.get_AudioFormatForScripting := CallbackCreate(GetMethod(implObj, "get_AudioFormatForScripting"), flags, 2)
        this.vtbl.put_AudioFormatForScripting := CallbackCreate(GetMethod(implObj, "put_AudioFormatForScripting"), flags, 2)
        this.vtbl.get_EmptyAudioFormatForScripting := CallbackCreate(GetMethod(implObj, "get_EmptyAudioFormatForScripting"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Format)
        CallbackFree(this.vtbl.put_Format)
        CallbackFree(this.vtbl.get_ControllingTerminal)
        CallbackFree(this.vtbl.get_AudioFormatForScripting)
        CallbackFree(this.vtbl.put_AudioFormatForScripting)
        CallbackFree(this.vtbl.get_EmptyAudioFormatForScripting)
    }
}
