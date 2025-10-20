#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IDebugProperty extends IUnknown{
    /**
     * The interface identifier for IDebugProperty
     * @type {Guid}
     */
    static IID => Guid("{51973c50-cb0c-11d0-b5c9-00a0244a0e7a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwFieldSpec 
     * @param {Integer} nRadix 
     * @param {Pointer<DebugPropertyInfo>} pPropertyInfo 
     * @returns {HRESULT} 
     */
    GetPropertyInfo(dwFieldSpec, nRadix, pPropertyInfo) {
        result := ComCall(3, this, "uint", dwFieldSpec, "uint", nRadix, "ptr", pPropertyInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cInfos 
     * @param {Pointer<Guid>} rgguidExtendedInfo 
     * @param {Pointer<VARIANT>} rgvar 
     * @returns {HRESULT} 
     */
    GetExtendedInfo(cInfos, rgguidExtendedInfo, rgvar) {
        result := ComCall(4, this, "uint", cInfos, "ptr", rgguidExtendedInfo, "ptr", rgvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszValue 
     * @param {Integer} nRadix 
     * @returns {HRESULT} 
     */
    SetValueAsString(pszValue, nRadix) {
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue

        result := ComCall(5, this, "ptr", pszValue, "uint", nRadix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFieldSpec 
     * @param {Integer} nRadix 
     * @param {Pointer<Guid>} refiid 
     * @param {Pointer<IEnumDebugPropertyInfo>} ppepi 
     * @returns {HRESULT} 
     */
    EnumMembers(dwFieldSpec, nRadix, refiid, ppepi) {
        result := ComCall(6, this, "uint", dwFieldSpec, "uint", nRadix, "ptr", refiid, "ptr", ppepi, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves a handle to the specified window's parent or owner.
     * @param {Pointer<IDebugProperty>} ppDebugProp 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * If the window is a child window, the return value is a handle to the parent window. If the window is a top-level window with the <b>WS_POPUP</b> style, the return value is a handle to the owner window. 
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * This function typically fails for one of the following reasons:
     * 
     * 
     * <ul>
     * <li>The window is a top-level window that is unowned or does not have the <b>WS_POPUP</b> style. </li>
     * <li>The owner window has <b>WS_POPUP</b> style.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getparent
     */
    GetParent(ppDebugProp) {
        result := ComCall(7, this, "ptr", ppDebugProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
