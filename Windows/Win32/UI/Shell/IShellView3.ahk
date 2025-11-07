#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\IShellView2.ahk

/**
 * Extends the capabilities of IShellView2 by providing a method to replace IShellView2::CreateViewWindow2.
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview2">IShellView2</a> interfaces, from which it inherits.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/nn-shobjidl-ishellview3
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellView3 extends IShellView2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellView3
     * @type {Guid}
     */
    static IID => Guid("{ec39fa88-f8af-41c5-8421-38bed28f4673}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateViewWindow3"]

    /**
     * 
     * @param {IShellBrowser} psbOwner 
     * @param {IShellView} psvPrev 
     * @param {Integer} dwViewFlags 
     * @param {Integer} dwMask 
     * @param {Integer} dwFlags 
     * @param {Integer} fvMode 
     * @param {Pointer<Guid>} pvid 
     * @param {Pointer<RECT>} prcView 
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl/nf-shobjidl-ishellview3-createviewwindow3
     */
    CreateViewWindow3(psbOwner, psvPrev, dwViewFlags, dwMask, dwFlags, fvMode, pvid, prcView) {
        phwndView := HWND()
        result := ComCall(20, this, "ptr", psbOwner, "ptr", psvPrev, "uint", dwViewFlags, "int", dwMask, "int", dwFlags, "int", fvMode, "ptr", pvid, "ptr", prcView, "ptr", phwndView, "HRESULT")
        return phwndView
    }
}
