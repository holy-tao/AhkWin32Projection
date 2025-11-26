#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITMediaPlayback interface provides playback-specific methods that allow an application to set and get the list of files to play. This interface is created by calling QueryInterface on ITTerminal.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itmediaplayback
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITMediaPlayback extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITMediaPlayback
     * @type {Guid}
     */
    static IID => Guid("{627e8ae6-ae4c-4a69-bb63-2ad625404b77}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_PlayList", "get_PlayList"]

    /**
     * @type {VARIANT} 
     */
    PlayList {
        get => this.get_PlayList()
        set => this.put_PlayList(value)
    }

    /**
     * 
     * @param {VARIANT} PlayListVariant 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmediaplayback-put_playlist
     */
    put_PlayList(PlayListVariant) {
        result := ComCall(7, this, "ptr", PlayListVariant, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itmediaplayback-get_playlist
     */
    get_PlayList() {
        pPlayListVariant := VARIANT()
        result := ComCall(8, this, "ptr", pPlayListVariant, "HRESULT")
        return pPlayListVariant
    }
}
