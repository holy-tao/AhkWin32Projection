#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMPPlayerServices interface provides methods used by the host of a remoted Windows Media Player control to manipulate the full mode of the Player. These methods can only be used with C++.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpplayerservices
 * @namespace Windows.Win32.Media.MediaPlayer
 */
export default struct IWMPPlayerServices extends IUnknown {
    /**
     * The interface identifier for IWMPPlayerServices
     * @type {Guid}
     */
    static IID := Guid("{1d01fbdb-ade2-4c8d-9842-c190b95c3306}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMPPlayerServices interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        activateUIPlugin : IntPtr
        setTaskPane      : IntPtr
        setTaskPaneURL   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMPPlayerServices.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The activateUIPlugin method activates the specified UI plug-in in the full mode of Windows Media Player.
     * @remarks
     * This method is used only when remoting the Windows Media Player control.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayerservices-activateuiplugin
     */
    activateUIPlugin(bstrPlugin) {
        bstrPlugin := bstrPlugin is String ? BSTR.Alloc(bstrPlugin).Value : bstrPlugin

        result := ComCall(3, this, BSTR, bstrPlugin, "HRESULT")
        return result
    }

    /**
     * The setTaskPane method displays the specified task pane in the full mode of Windows Media Player.
     * @remarks
     * This method is used only when remoting the Windows Media Player control.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayerservices-settaskpane
     */
    setTaskPane(bstrTaskPane) {
        bstrTaskPane := bstrTaskPane is String ? BSTR.Alloc(bstrTaskPane).Value : bstrTaskPane

        result := ComCall(4, this, BSTR, bstrTaskPane, "HRESULT")
        return result
    }

    /**
     * This page documents a feature of the Windows Media Player 9 Series SDK and the Windows Media Player 10 SDK. It may be unavailable in subsequent versions.
     * @remarks
     * This method is used only when remoting the Windows Media Player control. This method must be called when the control is in the docked state. Once set, the specified task pane is opened the next time the remoted control transitions to Windows Media Player.
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpplayerservices-settaskpaneurl
     */
    setTaskPaneURL(bstrTaskPane, bstrURL, bstrFriendlyName) {
        bstrTaskPane := bstrTaskPane is String ? BSTR.Alloc(bstrTaskPane).Value : bstrTaskPane
        bstrURL := bstrURL is String ? BSTR.Alloc(bstrURL).Value : bstrURL
        bstrFriendlyName := bstrFriendlyName is String ? BSTR.Alloc(bstrFriendlyName).Value : bstrFriendlyName

        result := ComCall(5, this, BSTR, bstrTaskPane, BSTR, bstrURL, BSTR, bstrFriendlyName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMPPlayerServices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.activateUIPlugin := CallbackCreate(GetMethod(implObj, "activateUIPlugin"), flags, 2)
        this.vtbl.setTaskPane := CallbackCreate(GetMethod(implObj, "setTaskPane"), flags, 2)
        this.vtbl.setTaskPaneURL := CallbackCreate(GetMethod(implObj, "setTaskPaneURL"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.activateUIPlugin)
        CallbackFree(this.vtbl.setTaskPane)
        CallbackFree(this.vtbl.setTaskPaneURL)
    }
}
