#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITMediaPlayback interface provides playback-specific methods that allow an application to set and get the list of files to play. This interface is created by calling QueryInterface on ITTerminal.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itmediaplayback
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITMediaPlayback extends IDispatch{
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
     * 
     * @param {VARIANT} PlayListVariant 
     * @returns {HRESULT} 
     */
    put_PlayList(PlayListVariant) {
        result := ComCall(7, this, "ptr", PlayListVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pPlayListVariant 
     * @returns {HRESULT} 
     */
    get_PlayList(pPlayListVariant) {
        result := ComCall(8, this, "ptr", pPlayListVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
