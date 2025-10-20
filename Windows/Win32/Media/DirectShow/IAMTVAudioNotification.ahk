#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This callback interface has been deprecated, because the TV Audio filter does not implement the callback mechanism. .
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamtvaudionotification
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMTVAudioNotification extends IUnknown{
    /**
     * The interface identifier for IAMTVAudioNotification
     * @type {Guid}
     */
    static IID => Guid("{83ec1c33-23d1-11d1-99e6-00a0c9560266}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} Event 
     * @returns {HRESULT} 
     */
    OnEvent(Event) {
        result := ComCall(3, this, "int", Event, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
