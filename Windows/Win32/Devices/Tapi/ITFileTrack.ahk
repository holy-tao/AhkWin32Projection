#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITTerminal.ahk
#Include .\ITScriptableAudioFormat.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITFileTrack interface exposes methods that allow an application to get and set information concerning file terminal tracks. The ITFileTerminalEvent::get_Track method creates the ITFileTrack interface.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itfiletrack
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITFileTrack extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITFileTrack
     * @type {Guid}
     */
    static IID => Guid("{31ca6ea9-c08a-4bea-8811-8e9c1ba3ea3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Format", "put_Format", "get_ControllingTerminal", "get_AudioFormatForScripting", "put_AudioFormatForScripting", "get_EmptyAudioFormatForScripting"]

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
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itfiletrack-get_format
     */
    get_Format() {
        result := ComCall(7, this, "ptr*", &ppmt := 0, "HRESULT")
        return ppmt
    }

    /**
     * The put_Format method sets the format type of the track.
     * @param {Pointer<AM_MEDIA_TYPE>} pmt The
     * <b>AM_MEDIA_TYPE</b> descriptor of the file track format. For more information about <b>AM_MEDIA_TYPE</b>, see the DirectX documentation. The <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itfiletrack">ITFileTrack</a> only supports the <b>FORMAT_WaveFormatEx</b> format type  in the <b>AM_MEDIA_TYPE</b> structure.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itfiletrack-put_format
     */
    put_Format(pmt) {
        result := ComCall(8, this, "ptr", pmt, "HRESULT")
        return result
    }

    /**
     * The get_ControllingTerminal method returns the multitrack terminal that controls the current track.
     * @returns {ITTerminal} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itfiletrack-get_controllingterminal
     */
    get_ControllingTerminal() {
        result := ComCall(9, this, "ptr*", &ppControllingTerminal := 0, "HRESULT")
        return ITTerminal(ppControllingTerminal)
    }

    /**
     * The get_AudioFormatForScripting method gets the audio scripting format.
     * @returns {ITScriptableAudioFormat} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itscriptableaudioformat">ITScriptableAudioFormat</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itfiletrack-get_audioformatforscripting
     */
    get_AudioFormatForScripting() {
        result := ComCall(10, this, "ptr*", &ppAudioFormat := 0, "HRESULT")
        return ITScriptableAudioFormat(ppAudioFormat)
    }

    /**
     * The put_AudioFormatForScripting method sets the audio scripting format.
     * @param {ITScriptableAudioFormat} pAudioFormat Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itscriptableaudioformat">ITScriptableAudioFormat</a> interface.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itfiletrack-put_audioformatforscripting
     */
    put_AudioFormatForScripting(pAudioFormat) {
        result := ComCall(11, this, "ptr", pAudioFormat, "HRESULT")
        return result
    }

    /**
     * The get_EmptyAudioFormatForScripting method is used to get an ITScriptableAudioFormat interface with all fields set to 0.
     * @returns {ITScriptableAudioFormat} Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itscriptableaudioformat">ITScriptableAudioFormat</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itfiletrack-get_emptyaudioformatforscripting
     */
    get_EmptyAudioFormatForScripting() {
        result := ComCall(12, this, "ptr*", &ppAudioFormat := 0, "HRESULT")
        return ITScriptableAudioFormat(ppAudioFormat)
    }
}
