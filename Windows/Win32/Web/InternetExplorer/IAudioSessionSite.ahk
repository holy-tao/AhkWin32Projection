#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IAudioSessionSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioSessionSite
     * @type {Guid}
     */
    static IID => Guid("{d7d8b684-d02d-4517-b6b7-19e3dfe29c45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAudioSessionGuid", "OnAudioStreamCreated", "OnAudioStreamDestroyed"]

    /**
     * 
     * @param {Pointer<Guid>} audioSessionGuid 
     * @returns {HRESULT} 
     */
    GetAudioSessionGuid(audioSessionGuid) {
        result := ComCall(3, this, "ptr", audioSessionGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} endpointID 
     * @returns {HRESULT} 
     */
    OnAudioStreamCreated(endpointID) {
        endpointID := endpointID is String ? StrPtr(endpointID) : endpointID

        result := ComCall(4, this, "ptr", endpointID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} endpointID 
     * @returns {HRESULT} 
     */
    OnAudioStreamDestroyed(endpointID) {
        endpointID := endpointID is String ? StrPtr(endpointID) : endpointID

        result := ComCall(5, this, "ptr", endpointID, "HRESULT")
        return result
    }
}
