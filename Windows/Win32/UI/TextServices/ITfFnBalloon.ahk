#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfFnBalloon interface is implemented by a text service and is used by an application or other text service to update the balloon item that the text service adds to the language bar.
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itffnballoon
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfFnBalloon extends IUnknown{
    /**
     * The interface identifier for ITfFnBalloon
     * @type {Guid}
     */
    static IID => Guid("{3bab89e4-5fbe-45f4-a5bc-dca36ad225a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} style 
     * @param {PWSTR} pch 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     */
    UpdateBalloon(style, pch, cch) {
        pch := pch is String ? StrPtr(pch) : pch

        result := ComCall(3, this, "int", style, "ptr", pch, "uint", cch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
