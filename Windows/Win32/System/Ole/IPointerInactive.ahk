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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetActivationPolicy", "OnInactiveMouseMove", "OnInactiveSetCursor"]

    /**
     * 
     * @param {Pointer<Integer>} pdwPolicy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipointerinactive-getactivationpolicy
     */
    GetActivationPolicy(pdwPolicy) {
        pdwPolicyMarshal := pdwPolicy is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pdwPolicyMarshal, pdwPolicy, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} pRectBounds 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} grfKeyState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipointerinactive-oninactivemousemove
     */
    OnInactiveMouseMove(pRectBounds, x, y, grfKeyState) {
        result := ComCall(4, this, "ptr", pRectBounds, "int", x, "int", y, "uint", grfKeyState, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/ocidl/nf-ocidl-ipointerinactive-oninactivesetcursor
     */
    OnInactiveSetCursor(pRectBounds, x, y, dwMouseMsg, fSetAlways) {
        result := ComCall(5, this, "ptr", pRectBounds, "int", x, "int", y, "uint", dwMouseMsg, "int", fSetAlways, "HRESULT")
        return result
    }
}
