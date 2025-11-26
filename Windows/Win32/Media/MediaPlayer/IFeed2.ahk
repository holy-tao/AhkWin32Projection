#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include .\IFeed.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IFeed2 extends IFeed{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFeed2
     * @type {Guid}
     */
    static IID => Guid("{33f2ea09-1398-4ab9-b6a4-f94b49d0a42e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 51

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemByEffectiveId", "get_LastItemDownloadTime", "get_Username", "get_Password", "SetCredentials", "ClearCredentials"]

    /**
     * @type {Float} 
     */
    LastItemDownloadTime {
        get => this.get_LastItemDownloadTime()
    }

    /**
     * @type {BSTR} 
     */
    Username {
        get => this.get_Username()
    }

    /**
     * @type {BSTR} 
     */
    Password {
        get => this.get_Password()
    }

    /**
     * 
     * @param {Integer} itemEffectiveId 
     * @returns {IDispatch} 
     */
    GetItemByEffectiveId(itemEffectiveId) {
        result := ComCall(51, this, "int", itemEffectiveId, "ptr*", &disp := 0, "HRESULT")
        return IDispatch(disp)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LastItemDownloadTime() {
        result := ComCall(52, this, "double*", &lastItemDownloadTime := 0, "HRESULT")
        return lastItemDownloadTime
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Username() {
        username := BSTR()
        result := ComCall(53, this, "ptr", username, "HRESULT")
        return username
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Password() {
        password := BSTR()
        result := ComCall(54, this, "ptr", password, "HRESULT")
        return password
    }

    /**
     * 
     * @param {BSTR} username 
     * @param {BSTR} password 
     * @returns {HRESULT} 
     */
    SetCredentials(username, password) {
        username := username is String ? BSTR.Alloc(username).Value : username
        password := password is String ? BSTR.Alloc(password).Value : password

        result := ComCall(55, this, "ptr", username, "ptr", password, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearCredentials() {
        result := ComCall(56, this, "HRESULT")
        return result
    }
}
