#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables an object to remain inactive most of the time, yet still participate in interaction with the mouse, including drag and drop.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/nn-ocidl-ipointerinactive
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IPointerInactive extends IUnknown{
    /**
     * The interface identifier for IPointerInactive
     * @type {Guid}
     */
    static IID => Guid("{55980ba0-35aa-11cf-b671-00aa004cd6d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} pdwPolicy 
     * @returns {HRESULT} 
     */
    GetActivationPolicy(pdwPolicy) {
        result := ComCall(3, this, "int*", pdwPolicy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pRectBounds 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} grfKeyState 
     * @returns {HRESULT} 
     */
    OnInactiveMouseMove(pRectBounds, x, y, grfKeyState) {
        result := ComCall(4, this, "ptr", pRectBounds, "int", x, "int", y, "uint", grfKeyState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pRectBounds 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} dwMouseMsg 
     * @param {BOOL} fSetAlways 
     * @returns {HRESULT} 
     */
    OnInactiveSetCursor(pRectBounds, x, y, dwMouseMsg, fSetAlways) {
        result := ComCall(5, this, "ptr", pRectBounds, "int", x, "int", y, "uint", dwMouseMsg, "int", fSetAlways, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
