#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfLangBarItem.ahk

/**
 * The ITfLangBarItemBalloon interface is implemented by an application or text service and is used by the language bar manager to obtain information specific to a balloon item on the language bar.
 * @remarks
 * 
  * A language bar balloon acts as a pop-up notification on the language bar.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nn-ctfutb-itflangbaritemballoon
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfLangBarItemBalloon extends ITfLangBarItem{
    /**
     * The interface identifier for ITfLangBarItemBalloon
     * @type {Guid}
     */
    static IID => Guid("{01c2d285-d3c7-4b7b-b5b5-d97411d0c283}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} click 
     * @param {POINT} pt 
     * @param {Pointer<RECT>} prcArea 
     * @returns {HRESULT} 
     */
    OnClick(click, pt, prcArea) {
        result := ComCall(7, this, "int", click, "ptr", pt, "ptr", prcArea, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} pszDefault 
     * @param {Pointer<SIZE>} psz 
     * @returns {HRESULT} 
     */
    GetPreferredSize(pszDefault, psz) {
        result := ComCall(8, this, "ptr", pszDefault, "ptr", psz, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TF_LBBALLOONINFO>} pInfo 
     * @returns {HRESULT} 
     */
    GetBalloonInfo(pInfo) {
        result := ComCall(9, this, "ptr", pInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
