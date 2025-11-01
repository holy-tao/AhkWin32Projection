#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for annotating accessible elements and for manipulating identity strings.
 * @see https://docs.microsoft.com/windows/win32/api//oleacc/nn-oleacc-iaccpropservices
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IAccPropServices extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccPropServices
     * @type {Guid}
     */
    static IID => Guid("{6e26e776-04f0-495d-80e4-3330352e3169}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPropValue", "SetPropServer", "ClearProps", "SetHwndProp", "SetHwndPropStr", "SetHwndPropServer", "ClearHwndProps", "ComposeHwndIdentityString", "DecomposeHwndIdentityString", "SetHmenuProp", "SetHmenuPropStr", "SetHmenuPropServer", "ClearHmenuProps", "ComposeHmenuIdentityString", "DecomposeHmenuIdentityString"]

    /**
     * 
     * @param {Pointer<Integer>} pIDString 
     * @param {Integer} dwIDStringLen 
     * @param {Guid} idProp 
     * @param {VARIANT} var 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-setpropvalue
     */
    SetPropValue(pIDString, dwIDStringLen, idProp, var) {
        result := ComCall(3, this, "char*", pIDString, "uint", dwIDStringLen, "ptr", idProp, "ptr", var, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pIDString 
     * @param {Integer} dwIDStringLen 
     * @param {Pointer<Guid>} paProps 
     * @param {Integer} cProps 
     * @param {IAccPropServer} pServer 
     * @param {Integer} annoScope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-setpropserver
     */
    SetPropServer(pIDString, dwIDStringLen, paProps, cProps, pServer, annoScope) {
        result := ComCall(4, this, "char*", pIDString, "uint", dwIDStringLen, "ptr", paProps, "int", cProps, "ptr", pServer, "int", annoScope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pIDString 
     * @param {Integer} dwIDStringLen 
     * @param {Pointer<Guid>} paProps 
     * @param {Integer} cProps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-clearprops
     */
    ClearProps(pIDString, dwIDStringLen, paProps, cProps) {
        result := ComCall(5, this, "char*", pIDString, "uint", dwIDStringLen, "ptr", paProps, "int", cProps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Integer} idObject 
     * @param {Integer} idChild 
     * @param {Guid} idProp 
     * @param {VARIANT} var 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-sethwndprop
     */
    SetHwndProp(hwnd, idObject, idChild, idProp, var) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "uint", idObject, "uint", idChild, "ptr", idProp, "ptr", var, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Integer} idObject 
     * @param {Integer} idChild 
     * @param {Guid} idProp 
     * @param {PWSTR} str 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-sethwndpropstr
     */
    SetHwndPropStr(hwnd, idObject, idChild, idProp, str) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        str := str is String ? StrPtr(str) : str

        result := ComCall(7, this, "ptr", hwnd, "uint", idObject, "uint", idChild, "ptr", idProp, "ptr", str, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Integer} idObject 
     * @param {Integer} idChild 
     * @param {Pointer<Guid>} paProps 
     * @param {Integer} cProps 
     * @param {IAccPropServer} pServer 
     * @param {Integer} annoScope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-sethwndpropserver
     */
    SetHwndPropServer(hwnd, idObject, idChild, paProps, cProps, pServer, annoScope) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(8, this, "ptr", hwnd, "uint", idObject, "uint", idChild, "ptr", paProps, "int", cProps, "ptr", pServer, "int", annoScope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Integer} idObject 
     * @param {Integer} idChild 
     * @param {Pointer<Guid>} paProps 
     * @param {Integer} cProps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-clearhwndprops
     */
    ClearHwndProps(hwnd, idObject, idChild, paProps, cProps) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(9, this, "ptr", hwnd, "uint", idObject, "uint", idChild, "ptr", paProps, "int", cProps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Integer} idObject 
     * @param {Integer} idChild 
     * @param {Pointer<Pointer<Integer>>} ppIDString 
     * @param {Pointer<Integer>} pdwIDStringLen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-composehwndidentitystring
     */
    ComposeHwndIdentityString(hwnd, idObject, idChild, ppIDString, pdwIDStringLen) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(10, this, "ptr", hwnd, "uint", idObject, "uint", idChild, "ptr*", ppIDString, "uint*", pdwIDStringLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pIDString 
     * @param {Integer} dwIDStringLen 
     * @param {Pointer<HWND>} phwnd 
     * @param {Pointer<Integer>} pidObject 
     * @param {Pointer<Integer>} pidChild 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-decomposehwndidentitystring
     */
    DecomposeHwndIdentityString(pIDString, dwIDStringLen, phwnd, pidObject, pidChild) {
        result := ComCall(11, this, "char*", pIDString, "uint", dwIDStringLen, "ptr", phwnd, "uint*", pidObject, "uint*", pidChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HMENU} hmenu 
     * @param {Integer} idChild 
     * @param {Guid} idProp 
     * @param {VARIANT} var 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-sethmenuprop
     */
    SetHmenuProp(hmenu, idChild, idProp, var) {
        hmenu := hmenu is Win32Handle ? NumGet(hmenu, "ptr") : hmenu

        result := ComCall(12, this, "ptr", hmenu, "uint", idChild, "ptr", idProp, "ptr", var, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HMENU} hmenu 
     * @param {Integer} idChild 
     * @param {Guid} idProp 
     * @param {PWSTR} str 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-sethmenupropstr
     */
    SetHmenuPropStr(hmenu, idChild, idProp, str) {
        hmenu := hmenu is Win32Handle ? NumGet(hmenu, "ptr") : hmenu
        str := str is String ? StrPtr(str) : str

        result := ComCall(13, this, "ptr", hmenu, "uint", idChild, "ptr", idProp, "ptr", str, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HMENU} hmenu 
     * @param {Integer} idChild 
     * @param {Pointer<Guid>} paProps 
     * @param {Integer} cProps 
     * @param {IAccPropServer} pServer 
     * @param {Integer} annoScope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-sethmenupropserver
     */
    SetHmenuPropServer(hmenu, idChild, paProps, cProps, pServer, annoScope) {
        hmenu := hmenu is Win32Handle ? NumGet(hmenu, "ptr") : hmenu

        result := ComCall(14, this, "ptr", hmenu, "uint", idChild, "ptr", paProps, "int", cProps, "ptr", pServer, "int", annoScope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HMENU} hmenu 
     * @param {Integer} idChild 
     * @param {Pointer<Guid>} paProps 
     * @param {Integer} cProps 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-clearhmenuprops
     */
    ClearHmenuProps(hmenu, idChild, paProps, cProps) {
        hmenu := hmenu is Win32Handle ? NumGet(hmenu, "ptr") : hmenu

        result := ComCall(15, this, "ptr", hmenu, "uint", idChild, "ptr", paProps, "int", cProps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HMENU} hmenu 
     * @param {Integer} idChild 
     * @param {Pointer<Pointer<Integer>>} ppIDString 
     * @param {Pointer<Integer>} pdwIDStringLen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-composehmenuidentitystring
     */
    ComposeHmenuIdentityString(hmenu, idChild, ppIDString, pdwIDStringLen) {
        hmenu := hmenu is Win32Handle ? NumGet(hmenu, "ptr") : hmenu

        result := ComCall(16, this, "ptr", hmenu, "uint", idChild, "ptr*", ppIDString, "uint*", pdwIDStringLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pIDString 
     * @param {Integer} dwIDStringLen 
     * @param {Pointer<HMENU>} phmenu 
     * @param {Pointer<Integer>} pidChild 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-decomposehmenuidentitystring
     */
    DecomposeHmenuIdentityString(pIDString, dwIDStringLen, phmenu, pidChild) {
        result := ComCall(17, this, "char*", pIDString, "uint", dwIDStringLen, "ptr", phmenu, "uint*", pidChild, "HRESULT")
        return result
    }
}
