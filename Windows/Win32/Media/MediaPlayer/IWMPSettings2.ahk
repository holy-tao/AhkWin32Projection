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
     * 
     * @param {Pointer<Int32>} plLangID 
     * @returns {HRESULT} 
     */
    get_defaultAudioLanguage(plLangID) {
        result := ComCall(30, this, "int*", plLangID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrRights 
     * @returns {HRESULT} 
     */
    get_mediaAccessRights(pbstrRights) {
        result := ComCall(31, this, "ptr", pbstrRights, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDesiredAccess 
     * @param {Pointer<VARIANT_BOOL>} pvbAccepted 
     * @returns {HRESULT} 
     */
    requestMediaAccessRights(bstrDesiredAccess, pvbAccepted) {
        bstrDesiredAccess := bstrDesiredAccess is String ? BSTR.Alloc(bstrDesiredAccess).Value : bstrDesiredAccess

        result := ComCall(32, this, "ptr", bstrDesiredAccess, "ptr", pvbAccepted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
