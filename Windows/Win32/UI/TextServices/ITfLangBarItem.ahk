#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfLangBarItem interface is implemented by a language bar item provider and used by the language bar manager to obtain detailed information about the language bar item.
 * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nn-ctfutb-itflangbaritem
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfLangBarItem extends IUnknown{
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
     * 
     * @param {Pointer<TF_LANGBARITEMINFO>} pInfo 
     * @returns {HRESULT} 
     */
    GetInfo(pInfo) {
        result := ComCall(3, this, "ptr", pInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pdwStatus) {
        result := ComCall(4, this, "uint*", pdwStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fShow 
     * @returns {HRESULT} 
     */
    Show(fShow) {
        result := ComCall(5, this, "int", fShow, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrToolTip 
     * @returns {HRESULT} 
     */
    GetTooltipString(pbstrToolTip) {
        result := ComCall(6, this, "ptr", pbstrToolTip, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
