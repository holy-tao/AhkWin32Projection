#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineAudioEndpointId extends IUnknown{
    /**
     * The interface identifier for IMFMediaEngineAudioEndpointId
     * @type {Guid}
     */
    static IID => Guid("{7a3bac98-0e76-49fb-8c20-8a86fd98eaf2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pszEndpointId 
     * @returns {HRESULT} 
     */
    SetAudioEndpointId(pszEndpointId) {
        pszEndpointId := pszEndpointId is String ? StrPtr(pszEndpointId) : pszEndpointId

        result := ComCall(3, this, "ptr", pszEndpointId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszEndpointId 
     * @returns {HRESULT} 
     */
    GetAudioEndpointId(ppszEndpointId) {
        result := ComCall(4, this, "ptr", ppszEndpointId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
