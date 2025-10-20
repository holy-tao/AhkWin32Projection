#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITMediaControl interface is a generic interface for media file terminals. The interface exposes methods that allow the application to start, stop, or pause current actions, such as a playback.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itmediacontrol
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITMediaControl extends IDispatch{
    /**
     * The interface identifier for ITMediaControl
     * @type {Guid}
     */
    static IID => Guid("{c445dde8-5199-4bc7-9807-5ffb92e42e09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @returns {HRESULT} 
     */
    Start() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pTerminalMediaState 
     * @returns {HRESULT} 
     */
    get_MediaState(pTerminalMediaState) {
        result := ComCall(10, this, "int*", pTerminalMediaState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
