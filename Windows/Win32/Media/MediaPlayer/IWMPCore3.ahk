#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPCore2.ahk

/**
 * The IWMPCore3 interface provides methods that supplement the IWMPCore2 interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpcore3
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPCore3 extends IWMPCore2{
    /**
     * The interface identifier for IWMPCore3
     * @type {Guid}
     */
    static IID => Guid("{7587c667-628f-499f-88e7-6a6f4e888464}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 29

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrURL 
     * @param {Pointer<IWMPPlaylist>} ppPlaylist 
     * @returns {HRESULT} 
     */
    newPlaylist(bstrName, bstrURL, ppPlaylist) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(29, this, "ptr", bstrName, "ptr", bstrURL, "ptr", ppPlaylist, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrURL 
     * @param {Pointer<IWMPMedia>} ppMedia 
     * @returns {HRESULT} 
     */
    newMedia(bstrURL, ppMedia) {
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL

        result := ComCall(30, this, "ptr", bstrURL, "ptr", ppMedia, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
