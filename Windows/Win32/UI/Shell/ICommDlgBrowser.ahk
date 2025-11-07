#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposed by the common file dialog boxes to be used when they host a Shell browser.
 * @remarks
 * 
 * <div class="alert"><b>Note</b>  In Windows XP and earlier, this interface was defined in Shlobj.h.
 *       </div>
 * <div> </div>
 * This interface is implemented only by the common file dialog boxes.
 * 
 * Use <b>ICommDlgBrowser</b> when you need to provide special behavior while hosted inside the common dialog boxes.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-icommdlgbrowser
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICommDlgBrowser extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommDlgBrowser
     * @type {Guid}
     */
    static IID => Guid("{000214f1-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnDefaultCommand", "OnStateChange", "IncludeObject"]

    /**
     * 
     * @param {IShellView} ppshv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icommdlgbrowser-ondefaultcommand
     */
    OnDefaultCommand(ppshv) {
        result := ComCall(3, this, "ptr", ppshv, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellView} ppshv 
     * @param {Integer} uChange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icommdlgbrowser-onstatechange
     */
    OnStateChange(ppshv, uChange) {
        result := ComCall(4, this, "ptr", ppshv, "uint", uChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IShellView} ppshv 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icommdlgbrowser-includeobject
     */
    IncludeObject(ppshv, pidl) {
        result := ComCall(5, this, "ptr", ppshv, "ptr", pidl, "HRESULT")
        return result
    }
}
