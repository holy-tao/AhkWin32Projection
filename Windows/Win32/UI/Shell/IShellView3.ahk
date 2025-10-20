#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IShellBrowser>} psbOwner 
     * @param {Pointer<IShellView>} psvPrev 
     * @param {Integer} dwViewFlags 
     * @param {Integer} dwMask 
     * @param {Integer} dwFlags 
     * @param {Integer} fvMode 
     * @param {Pointer<Guid>} pvid 
     * @param {Pointer<RECT>} prcView 
     * @param {Pointer<HWND>} phwndView 
     * @returns {HRESULT} 
     */
    CreateViewWindow3(psbOwner, psvPrev, dwViewFlags, dwMask, dwFlags, fvMode, pvid, prcView, phwndView) {
        result := ComCall(20, this, "ptr", psbOwner, "ptr", psvPrev, "uint", dwViewFlags, "int", dwMask, "int", dwFlags, "int", fvMode, "ptr", pvid, "ptr", prcView, "ptr", phwndView, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
