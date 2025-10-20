#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Integer} itemEffectiveId 
     * @param {Pointer<IDispatch>} disp 
     * @returns {HRESULT} 
     */
    GetItemByEffectiveId(itemEffectiveId, disp) {
        result := ComCall(51, this, "int", itemEffectiveId, "ptr*", disp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} lastItemDownloadTime 
     * @returns {HRESULT} 
     */
    get_LastItemDownloadTime(lastItemDownloadTime) {
        result := ComCall(52, this, "double*", lastItemDownloadTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} username 
     * @returns {HRESULT} 
     */
    get_Username(username) {
        result := ComCall(53, this, "ptr", username, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} password 
     * @returns {HRESULT} 
     */
    get_Password(password) {
        result := ComCall(54, this, "ptr", password, "HRESULT")
        return result
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
