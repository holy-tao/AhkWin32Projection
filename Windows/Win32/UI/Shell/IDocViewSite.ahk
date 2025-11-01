#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used as a site object by the IShellView interface.
 * @remarks
 * 
  * You can call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method on <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> to get a pointer to the <b>IDocViewSite</b> interface.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shlobj/nn-shlobj-idocviewsite
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDocViewSite extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDocViewSite
     * @type {Guid}
     */
    static IID => Guid("{87d605e0-c511-11cf-89a9-00a0c9054129}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnSetTitle"]

    /**
     * 
     * @param {Pointer<VARIANT>} pvTitle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shlobj/nf-shlobj-idocviewsite-onsettitle
     */
    OnSetTitle(pvTitle) {
        result := ComCall(3, this, "ptr", pvTitle, "HRESULT")
        return result
    }
}
