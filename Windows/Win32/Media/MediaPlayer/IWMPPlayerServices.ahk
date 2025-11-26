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
     * The activateUIPlugin method activates the specified UI plug-in in the full mode of Windows Media Player.
     * @param {BSTR} bstrPlugin <b>BSTR</b> containing the name of the plug-in to activate.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>The method succeeded.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplayerservices-activateuiplugin
     */
    activateUIPlugin(bstrPlugin) {
        bstrPlugin := bstrPlugin is String ? BSTR.Alloc(bstrPlugin).Value : bstrPlugin

        result := ComCall(3, this, "ptr", bstrPlugin, "HRESULT")
        return result
    }

    /**
     * The setTaskPane method displays the specified task pane in the full mode of Windows Media Player.
     * @param {BSTR} bstrTaskPane 
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>The method succeeded.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplayerservices-settaskpane
     */
    setTaskPane(bstrTaskPane) {
        bstrTaskPane := bstrTaskPane is String ? BSTR.Alloc(bstrTaskPane).Value : bstrTaskPane

        result := ComCall(4, this, "ptr", bstrTaskPane, "HRESULT")
        return result
    }

    /**
     * This page documents a feature of the Windows Media Player 9 Series SDK and the Windows Media Player 10 SDK. It may be unavailable in subsequent versions.
     * @param {BSTR} bstrTaskPane 
     * @param {BSTR} bstrURL <b>BSTR</b> containing the URL to display in the task pane.
     * @param {BSTR} bstrFriendlyName <b>BSTR</b> containing the friendly name of the content at the specified URL.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>The method succeeded.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpplayerservices-settaskpaneurl
     */
    setTaskPaneURL(bstrTaskPane, bstrURL, bstrFriendlyName) {
        bstrTaskPane := bstrTaskPane is String ? BSTR.Alloc(bstrTaskPane).Value : bstrTaskPane
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL
        bstrFriendlyName := bstrFriendlyName is String ? BSTR.Alloc(bstrFriendlyName).Value : bstrFriendlyName

        result := ComCall(5, this, "ptr", bstrTaskPane, "ptr", bstrURL, "ptr", bstrFriendlyName, "HRESULT")
        return result
    }
}
