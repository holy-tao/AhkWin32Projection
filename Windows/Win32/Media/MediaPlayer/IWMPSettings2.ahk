#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPSettings.ahk

/**
 * The IWMPSettings2 interface provides methods that supplement the IWMPSettings interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpsettings2
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPSettings2 extends IWMPSettings{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPSettings2
     * @type {Guid}
     */
    static IID => Guid("{fda937a4-eece-4da5-a0b6-39bf89ade2c2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 30

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_defaultAudioLanguage", "get_mediaAccessRights", "requestMediaAccessRights"]

    /**
     * 
     * @param {Pointer<Integer>} plLangID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings2-get_defaultaudiolanguage
     */
    get_defaultAudioLanguage(plLangID) {
        result := ComCall(30, this, "int*", plLangID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrRights 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings2-get_mediaaccessrights
     */
    get_mediaAccessRights(pbstrRights) {
        result := ComCall(31, this, "ptr", pbstrRights, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDesiredAccess 
     * @param {Pointer<VARIANT_BOOL>} pvbAccepted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsettings2-requestmediaaccessrights
     */
    requestMediaAccessRights(bstrDesiredAccess, pvbAccepted) {
        bstrDesiredAccess := bstrDesiredAccess is String ? BSTR.Alloc(bstrDesiredAccess).Value : bstrDesiredAccess

        result := ComCall(32, this, "ptr", bstrDesiredAccess, "ptr", pvbAccepted, "HRESULT")
        return result
    }
}
