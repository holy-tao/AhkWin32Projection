#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXFeed.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IXFeed2 extends IXFeed{
    /**
     * The interface identifier for IXFeed2
     * @type {Guid}
     */
    static IID => Guid("{ce528e77-3716-4eb7-956d-f5e37502e12a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 47

    /**
     * 
     * @param {Integer} uiEffectiveId 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetItemByEffectiveId(uiEffectiveId, riid, ppv) {
        result := ComCall(47, this, "uint", uiEffectiveId, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} pstLastItemDownloadTime 
     * @returns {HRESULT} 
     */
    LastItemDownloadTime(pstLastItemDownloadTime) {
        result := ComCall(48, this, "ptr", pstLastItemDownloadTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszUsername 
     * @returns {HRESULT} 
     */
    Username(ppszUsername) {
        result := ComCall(49, this, "ptr", ppszUsername, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszPassword 
     * @returns {HRESULT} 
     */
    Password(ppszPassword) {
        result := ComCall(50, this, "ptr", ppszPassword, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszUsername 
     * @param {PWSTR} pszPassword 
     * @returns {HRESULT} 
     */
    SetCredentials(pszUsername, pszPassword) {
        pszUsername := pszUsername is String ? StrPtr(pszUsername) : pszUsername
        pszPassword := pszPassword is String ? StrPtr(pszPassword) : pszPassword

        result := ComCall(51, this, "ptr", pszUsername, "ptr", pszPassword, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearCredentials() {
        result := ComCall(52, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
