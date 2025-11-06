#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk
#Include .\IXFeed.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IXFeed2 extends IXFeed{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemByEffectiveId", "LastItemDownloadTime", "Username", "Password", "SetCredentials", "ClearCredentials"]

    /**
     * 
     * @param {Integer} uiEffectiveId 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    GetItemByEffectiveId(uiEffectiveId, riid) {
        result := ComCall(47, this, "uint", uiEffectiveId, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @returns {SYSTEMTIME} 
     */
    LastItemDownloadTime() {
        pstLastItemDownloadTime := SYSTEMTIME()
        result := ComCall(48, this, "ptr", pstLastItemDownloadTime, "HRESULT")
        return pstLastItemDownloadTime
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    Username() {
        result := ComCall(49, this, "ptr*", &ppszUsername := 0, "HRESULT")
        return ppszUsername
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    Password() {
        result := ComCall(50, this, "ptr*", &ppszPassword := 0, "HRESULT")
        return ppszPassword
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

        result := ComCall(51, this, "ptr", pszUsername, "ptr", pszPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearCredentials() {
        result := ComCall(52, this, "HRESULT")
        return result
    }
}
