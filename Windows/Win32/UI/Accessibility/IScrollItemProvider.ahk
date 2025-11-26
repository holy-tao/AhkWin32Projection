#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to individual child controls of containers that implement IScrollProvider.
 * @remarks
 * 
 * Implemented on a Microsoft UI Automation provider that must 
 *             support the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/uiauto-implementingscrollitem">ScrollItem</a> control pattern.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nn-uiautomationcore-iscrollitemprovider
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IScrollItemProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScrollItemProvider
     * @type {Guid}
     */
    static IID => Guid("{2360c714-4bf1-4b26-ba65-9b21316127eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ScrollIntoView"]

    /**
     * Scrolls the content area of a container object in order to display the control within the visible region (viewport) of the container.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/nf-uiautomationcore-iscrollitemprovider-scrollintoview
     */
    ScrollIntoView() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
