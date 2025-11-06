#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\TF_LANGBARITEMINFO.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfLangBarItem interface is implemented by a language bar item provider and used by the language bar manager to obtain detailed information about the language bar item.
 * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nn-ctfutb-itflangbaritem
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfLangBarItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfLangBarItem
     * @type {Guid}
     */
    static IID => Guid("{73540d69-edeb-4ee9-96c9-23aa30b25916}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInfo", "GetStatus", "Show", "GetTooltipString"]

    /**
     * 
     * @returns {TF_LANGBARITEMINFO} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritem-getinfo
     */
    GetInfo() {
        pInfo := TF_LANGBARITEMINFO()
        result := ComCall(3, this, "ptr", pInfo, "HRESULT")
        return pInfo
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritem-getstatus
     */
    GetStatus() {
        result := ComCall(4, this, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * 
     * @param {BOOL} fShow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritem-show
     */
    Show(fShow) {
        result := ComCall(5, this, "int", fShow, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritem-gettooltipstring
     */
    GetTooltipString() {
        pbstrToolTip := BSTR()
        result := ComCall(6, this, "ptr", pbstrToolTip, "HRESULT")
        return pbstrToolTip
    }
}
