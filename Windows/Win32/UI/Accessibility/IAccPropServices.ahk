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
     * 
     * @param {Pointer<Byte>} pIDString 
     * @param {Integer} dwIDStringLen 
     * @param {Pointer<Guid>} idProp 
     * @param {VARIANT} var 
     * @returns {HRESULT} 
     */
    SetPropValue(pIDString, dwIDStringLen, idProp, var) {
        result := ComCall(3, this, "char*", pIDString, "uint", dwIDStringLen, "ptr", idProp, "ptr", var, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pIDString 
     * @param {Integer} dwIDStringLen 
     * @param {Pointer<Guid>} paProps 
     * @param {Integer} cProps 
     * @param {Pointer<IAccPropServer>} pServer 
     * @param {Integer} annoScope 
     * @returns {HRESULT} 
     */
    SetPropServer(pIDString, dwIDStringLen, paProps, cProps, pServer, annoScope) {
        result := ComCall(4, this, "char*", pIDString, "uint", dwIDStringLen, "ptr", paProps, "int", cProps, "ptr", pServer, "int", annoScope, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pIDString 
     * @param {Integer} dwIDStringLen 
     * @param {Pointer<Guid>} paProps 
     * @param {Integer} cProps 
     * @returns {HRESULT} 
     */
    ClearProps(pIDString, dwIDStringLen, paProps, cProps) {
        result := ComCall(5, this, "char*", pIDString, "uint", dwIDStringLen, "ptr", paProps, "int", cProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Integer} idObject 
     * @param {Integer} idChild 
     * @param {Pointer<Guid>} idProp 
     * @param {VARIANT} var 
     * @returns {HRESULT} 
     */
    SetHwndProp(hwnd, idObject, idChild, idProp, var) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "uint", idObject, "uint", idChild, "ptr", idProp, "ptr", var, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Integer} idObject 
     * @param {Integer} idChild 
     * @param {Pointer<Guid>} idProp 
     * @param {PWSTR} str 
     * @returns {HRESULT} 
     */
    SetHwndPropStr(hwnd, idObject, idChild, idProp, str) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        str := str is String ? StrPtr(str) : str

        result := ComCall(7, this, "ptr", hwnd, "uint", idObject, "uint", idChild, "ptr", idProp, "ptr", str, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Integer} idObject 
     * @param {Integer} idChild 
     * @param {Pointer<Guid>} paProps 
     * @param {Integer} cProps 
     * @param {Pointer<IAccPropServer>} pServer 
     * @param {Integer} annoScope 
     * @returns {HRESULT} 
     */
    SetHwndPropServer(hwnd, idObject, idChild, paProps, cProps, pServer, annoScope) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(8, this, "ptr", hwnd, "uint", idObject, "uint", idChild, "ptr", paProps, "int", cProps, "ptr", pServer, "int", annoScope, "int")
        if(result != 0)
            throw OSError(result)

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
     */
    ClearHwndProps(hwnd, idObject, idChild, paProps, cProps) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(9, this, "ptr", hwnd, "uint", idObject, "uint", idChild, "ptr", paProps, "int", cProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Integer} idObject 
     * @param {Integer} idChild 
     * @param {Pointer<Byte>} ppIDString 
     * @param {Pointer<UInt32>} pdwIDStringLen 
     * @returns {HRESULT} 
     */
    ComposeHwndIdentityString(hwnd, idObject, idChild, ppIDString, pdwIDStringLen) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(10, this, "ptr", hwnd, "uint", idObject, "uint", idChild, "char*", ppIDString, "uint*", pdwIDStringLen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pIDString 
     * @param {Integer} dwIDStringLen 
     * @param {Pointer<HWND>} phwnd 
     * @param {Pointer<UInt32>} pidObject 
     * @param {Pointer<UInt32>} pidChild 
     * @returns {HRESULT} 
     */
    DecomposeHwndIdentityString(pIDString, dwIDStringLen, phwnd, pidObject, pidChild) {
        result := ComCall(11, this, "char*", pIDString, "uint", dwIDStringLen, "ptr", phwnd, "uint*", pidObject, "uint*", pidChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HMENU} hmenu 
     * @param {Integer} idChild 
     * @param {Pointer<Guid>} idProp 
     * @param {VARIANT} var 
     * @returns {HRESULT} 
     */
    SetHmenuProp(hmenu, idChild, idProp, var) {
        hmenu := hmenu is Win32Handle ? NumGet(hmenu, "ptr") : hmenu

        result := ComCall(12, this, "ptr", hmenu, "uint", idChild, "ptr", idProp, "ptr", var, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HMENU} hmenu 
     * @param {Integer} idChild 
     * @param {Pointer<Guid>} idProp 
     * @param {PWSTR} str 
     * @returns {HRESULT} 
     */
    SetHmenuPropStr(hmenu, idChild, idProp, str) {
        hmenu := hmenu is Win32Handle ? NumGet(hmenu, "ptr") : hmenu
        str := str is String ? StrPtr(str) : str

        result := ComCall(13, this, "ptr", hmenu, "uint", idChild, "ptr", idProp, "ptr", str, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HMENU} hmenu 
     * @param {Integer} idChild 
     * @param {Pointer<Guid>} paProps 
     * @param {Integer} cProps 
     * @param {Pointer<IAccPropServer>} pServer 
     * @param {Integer} annoScope 
     * @returns {HRESULT} 
     */
    SetHmenuPropServer(hmenu, idChild, paProps, cProps, pServer, annoScope) {
        hmenu := hmenu is Win32Handle ? NumGet(hmenu, "ptr") : hmenu

        result := ComCall(14, this, "ptr", hmenu, "uint", idChild, "ptr", paProps, "int", cProps, "ptr", pServer, "int", annoScope, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HMENU} hmenu 
     * @param {Integer} idChild 
     * @param {Pointer<Guid>} paProps 
     * @param {Integer} cProps 
     * @returns {HRESULT} 
     */
    ClearHmenuProps(hmenu, idChild, paProps, cProps) {
        hmenu := hmenu is Win32Handle ? NumGet(hmenu, "ptr") : hmenu

        result := ComCall(15, this, "ptr", hmenu, "uint", idChild, "ptr", paProps, "int", cProps, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HMENU} hmenu 
     * @param {Integer} idChild 
     * @param {Pointer<Byte>} ppIDString 
     * @param {Pointer<UInt32>} pdwIDStringLen 
     * @returns {HRESULT} 
     */
    ComposeHmenuIdentityString(hmenu, idChild, ppIDString, pdwIDStringLen) {
        hmenu := hmenu is Win32Handle ? NumGet(hmenu, "ptr") : hmenu

        result := ComCall(16, this, "ptr", hmenu, "uint", idChild, "char*", ppIDString, "uint*", pdwIDStringLen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pIDString 
     * @param {Integer} dwIDStringLen 
     * @param {Pointer<HMENU>} phmenu 
     * @param {Pointer<UInt32>} pidChild 
     * @returns {HRESULT} 
     */
    DecomposeHmenuIdentityString(pIDString, dwIDStringLen, phmenu, pidChild) {
        result := ComCall(17, this, "char*", pIDString, "uint", dwIDStringLen, "ptr", phmenu, "uint*", pidChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
