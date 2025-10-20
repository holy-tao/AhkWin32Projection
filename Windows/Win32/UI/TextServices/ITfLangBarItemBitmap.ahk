#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfLangBarItem.ahk

/**
 * The ITfLangBarItemBitmap interface is implemented by an application or text service and used by the language bar manager to obtain information specific to a bitmap item on the language bar.
 * @remarks
 * 
  * A language bar bitmap functions as a static item on the language bar that displays a bitmap.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nn-ctfutb-itflangbaritembitmap
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfLangBarItemBitmap extends ITfLangBarItem{
    /**
     * The interface identifier for ITfLangBarItemBitmap
     * @type {Guid}
     */
    static IID => Guid("{73830352-d722-4179-ada5-f045c98df355}")

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
     * @param {Integer} bmWidth 
     * @param {Integer} bmHeight 
     * @param {Integer} dwFlags 
     * @param {Pointer<HBITMAP>} phbmp 
     * @param {Pointer<HBITMAP>} phbmpMask 
     * @returns {HRESULT} 
     */
    DrawBitmap(bmWidth, bmHeight, dwFlags, phbmp, phbmpMask) {
        result := ComCall(9, this, "int", bmWidth, "int", bmHeight, "uint", dwFlags, "ptr", phbmp, "ptr", phbmpMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
