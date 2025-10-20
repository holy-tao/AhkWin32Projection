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
     * 
     * @param {Pointer<IShellView>} ppshv 
     * @returns {HRESULT} 
     */
    OnDefaultCommand(ppshv) {
        result := ComCall(3, this, "ptr", ppshv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellView>} ppshv 
     * @param {Integer} uChange 
     * @returns {HRESULT} 
     */
    OnStateChange(ppshv, uChange) {
        result := ComCall(4, this, "ptr", ppshv, "uint", uChange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellView>} ppshv 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @returns {HRESULT} 
     */
    IncludeObject(ppshv, pidl) {
        result := ComCall(5, this, "ptr", ppshv, "ptr", pidl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
