#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IUIContextualUI interface is implemented by the Ribbon framework and provides the core functionality for the Context Popup View.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-contextpopup">Context Popup</a> is composed of two components: the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-contextmenu">ContextMenu</a> and <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-minitoolbar">MiniToolbar</a> elements.
 * 			
 * 				
 * 
 * <div class="alert"><b>Note</b>  The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-contextpopup">Context Popup</a> acts solely as a logical container for the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-contextmenu">ContextMenu</a> and <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-minitoolbar">MiniToolbar</a>. It does not
 * 				support scrolling, moving, or resizing. 
 * 			</div>
 * <div> </div>
 * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-contextpopup">Context Popup</a> is typically displayed by right-clicking the mouse (or through the keyboard shortcut  SHIFT+F10) on an object of interest. The steps required to display the Context Popup are defined by the application.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-contextmenu">ContextMenu</a> is a list of menu items that is contextual and based on  
 * 				the control clicked or the control with focus (when using the keyboard).
 * 			
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-minitoolbar">MiniToolbar</a> is a floating toolbar that incorporates various Commands, galleries, and complex controls such as the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-fontcontrol">Font Control</a> and the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-combobox">Combo Box</a>.
 * 			
 * 
 * The following screen shot shows the <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-controls-contextpopup">Context Popup</a> with a <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-contextmenu">ContextMenu</a> and <a href="https://docs.microsoft.com/windows/desktop/windowsribbon/windowsribbon-element-minitoolbar">MiniToolbar</a>.
 * 
 * <img alt="Screen shot with callouts showing the ContentPopup, ContextMenu, and MiniToolbar." src="./images/IUIContextualUI_Concepts.png"/>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiribbon/nn-uiribbon-iuicontextualui
 * @namespace Windows.Win32.UI.Ribbon
 * @version v4.0.30319
 */
class IUIContextualUI extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIContextualUI
     * @type {Guid}
     */
    static IID => Guid("{eea11f37-7c46-437c-8e55-b52122b29293}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShowAtLocation"]

    /**
     * 
     * @param {Integer} x 
     * @param {Integer} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uiribbon/nf-uiribbon-iuicontextualui-showatlocation
     */
    ShowAtLocation(x, y) {
        result := ComCall(3, this, "int", x, "int", y, "HRESULT")
        return result
    }
}
