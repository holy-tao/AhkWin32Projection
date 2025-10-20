#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by the default folder view created using SHCreateShellFolderView.
 * @remarks
 * 
  * The IID for this interface is <b>IID_IContextMenuSite</b>.
  * 
  * To acquire a context menu site pointer code that exists in the site chain of the folder view, use <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/cc678966(v=vs.85)">QueryService</a> using <b>SID_SFolderView</b> to get to the folder view.
  * 
  * 
  * ```
  * CComPtr<IContextMenuSite> spcms;
  * hr = IUnknown_QueryService(_punkSite, SID_SFolderView, IID_PPV_ARGS(&spcms));
  * 
  * if (SUCCEEDED(hr))
  * {
  *     ...
  * }
  * ```
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-icontextmenusite
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IContextMenuSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContextMenuSite
     * @type {Guid}
     */
    static IID => Guid("{0811aebe-0b87-4c54-9e72-548cf649016b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DoContextMenuPopup"]

    /**
     * 
     * @param {IUnknown} punkContextMenu 
     * @param {Integer} fFlags 
     * @param {POINT} pt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icontextmenusite-docontextmenupopup
     */
    DoContextMenuPopup(punkContextMenu, fFlags, pt) {
        result := ComCall(3, this, "ptr", punkContextMenu, "uint", fFlags, "ptr", pt, "HRESULT")
        return result
    }
}
