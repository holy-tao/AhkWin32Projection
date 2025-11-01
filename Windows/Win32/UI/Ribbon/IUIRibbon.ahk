#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IUIRibbon interface is implemented by the Windows Ribbon framework and provides the ability to specify settings and properties for a ribbon.
 * @remarks
 * 
  * A Ribbon is composed of several components that can include an <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-applicationmenu">Application Menu</a>, the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-quickaccesstoolbar">Quick Access Toolbar (QAT)</a>, 
  * 				<a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-tab">Tabs</a> (core and contextual), <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-group">Groups</a> (containers for controls), and a rich context menu  system (<a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-contextpopup">Context Popup</a>).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nn-uiribbon-iuiribbon
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class IUIRibbon extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIRibbon
     * @type {Guid}
     */
    static IID => Guid("{803982ab-370a-4f7e-a9e7-8784036a6e26}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHeight", "LoadSettingsFromStream", "SaveSettingsToStream"]

    /**
     * 
     * @param {Pointer<Integer>} cy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiribbon-getheight
     */
    GetHeight(cy) {
        result := ComCall(3, this, "uint*", cy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiribbon-loadsettingsfromstream
     */
    LoadSettingsFromStream(pStream) {
        result := ComCall(4, this, "ptr", pStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuiribbon-savesettingstostream
     */
    SaveSettingsToStream(pStream) {
        result := ComCall(5, this, "ptr", pStream, "HRESULT")
        return result
    }
}
