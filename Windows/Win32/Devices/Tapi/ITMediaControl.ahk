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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Start", "Stop", "Pause", "get_MediaState"]

    /**
     * @type {Integer} 
     */
    MediaState {
        get => this.get_MediaState()
    }

    /**
     * The Start method starts the action at the current location.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itmediacontrol-start
     */
    Start() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The Stop method stops the current action and sets the current location to the beginning of the file.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itmediacontrol-stop
     */
    Stop() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * The Pause method pauses the action, remaining at the current location in the file.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itmediacontrol-pause
     */
    Pause() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * The get_MediaState method gets the current state of media on the file terminal.
     * @returns {Integer} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-terminal_media_state">TERMINAL_MEDIA_STATE</a> descriptor of the current state of the file terminal.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itmediacontrol-get_mediastate
     */
    get_MediaState() {
        result := ComCall(10, this, "int*", &pTerminalMediaState := 0, "HRESULT")
        return pTerminalMediaState
    }
}
