#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPPlayerServices interface provides methods used by the host of a remoted Windows Media Player control to manipulate the full mode of the Player. These methods can only be used with C++.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpplayerservices
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPPlayerServices extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPPlayerServices
     * @type {Guid}
     */
    static IID => Guid("{1d01fbdb-ade2-4c8d-9842-c190b95c3306}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["activateUIPlugin", "setTaskPane", "setTaskPaneURL"]

    /**
     * 
     * @param {BSTR} bstrPlugin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayerservices-activateuiplugin
     */
    activateUIPlugin(bstrPlugin) {
        bstrPlugin := bstrPlugin is String ? BSTR.Alloc(bstrPlugin).Value : bstrPlugin

        result := ComCall(3, this, "ptr", bstrPlugin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrTaskPane 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayerservices-settaskpane
     */
    setTaskPane(bstrTaskPane) {
        bstrTaskPane := bstrTaskPane is String ? BSTR.Alloc(bstrTaskPane).Value : bstrTaskPane

        result := ComCall(4, this, "ptr", bstrTaskPane, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrTaskPane 
     * @param {BSTR} bstrURL 
     * @param {BSTR} bstrFriendlyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayerservices-settaskpaneurl
     */
    setTaskPaneURL(bstrTaskPane, bstrURL, bstrFriendlyName) {
        bstrTaskPane := bstrTaskPane is String ? BSTR.Alloc(bstrTaskPane).Value : bstrTaskPane
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL
        bstrFriendlyName := bstrFriendlyName is String ? BSTR.Alloc(bstrFriendlyName).Value : bstrFriendlyName

        result := ComCall(5, this, "ptr", bstrTaskPane, "ptr", bstrURL, "ptr", bstrFriendlyName, "HRESULT")
        return result
    }
}
