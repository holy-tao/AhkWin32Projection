#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITFileTrack interface exposes methods that allow an application to get and set information concerning file terminal tracks. The ITFileTerminalEvent::get_Track method creates the ITFileTrack interface.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itfiletrack
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITFileTrack extends IDispatch{
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
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} ppmt 
     * @returns {HRESULT} 
     */
    get_Format(ppmt) {
        result := ComCall(7, this, "ptr", ppmt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} pmt 
     * @returns {HRESULT} 
     */
    put_Format(pmt) {
        result := ComCall(8, this, "ptr", pmt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITTerminal>} ppControllingTerminal 
     * @returns {HRESULT} 
     */
    get_ControllingTerminal(ppControllingTerminal) {
        result := ComCall(9, this, "ptr", ppControllingTerminal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITScriptableAudioFormat>} ppAudioFormat 
     * @returns {HRESULT} 
     */
    get_AudioFormatForScripting(ppAudioFormat) {
        result := ComCall(10, this, "ptr", ppAudioFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITScriptableAudioFormat>} pAudioFormat 
     * @returns {HRESULT} 
     */
    put_AudioFormatForScripting(pAudioFormat) {
        result := ComCall(11, this, "ptr", pAudioFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITScriptableAudioFormat>} ppAudioFormat 
     * @returns {HRESULT} 
     */
    get_EmptyAudioFormatForScripting(ppAudioFormat) {
        result := ComCall(12, this, "ptr", ppAudioFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
