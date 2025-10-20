#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Exposes methods and properties that make a user interface element and its children accessible to client applications.
 * @see https://docs.microsoft.com/windows/win32/api//oleacc/nn-oleacc-iaccessible
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IAccessible extends IDispatch{
    /**
     * The interface identifier for IAccessible
     * @type {Guid}
     */
    static IID => Guid("{618736e0-3c3d-11cf-810c-00aa00389b71}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IDispatch>} ppdispParent 
     * @returns {HRESULT} 
     */
    get_accParent(ppdispParent) {
        result := ComCall(7, this, "ptr", ppdispParent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pcountChildren 
     * @returns {HRESULT} 
     */
    get_accChildCount(pcountChildren) {
        result := ComCall(8, this, "int*", pcountChildren, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @param {Pointer<IDispatch>} ppdispChild 
     * @returns {HRESULT} 
     */
    get_accChild(varChild, ppdispChild) {
        result := ComCall(9, this, "ptr", varChild, "ptr", ppdispChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @param {Pointer<BSTR>} pszName 
     * @returns {HRESULT} 
     */
    get_accName(varChild, pszName) {
        result := ComCall(10, this, "ptr", varChild, "ptr", pszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @param {Pointer<BSTR>} pszValue 
     * @returns {HRESULT} 
     */
    get_accValue(varChild, pszValue) {
        result := ComCall(11, this, "ptr", varChild, "ptr", pszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @param {Pointer<BSTR>} pszDescription 
     * @returns {HRESULT} 
     */
    get_accDescription(varChild, pszDescription) {
        result := ComCall(12, this, "ptr", varChild, "ptr", pszDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @param {Pointer<VARIANT>} pvarRole 
     * @returns {HRESULT} 
     */
    get_accRole(varChild, pvarRole) {
        result := ComCall(13, this, "ptr", varChild, "ptr", pvarRole, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @param {Pointer<VARIANT>} pvarState 
     * @returns {HRESULT} 
     */
    get_accState(varChild, pvarState) {
        result := ComCall(14, this, "ptr", varChild, "ptr", pvarState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @param {Pointer<BSTR>} pszHelp 
     * @returns {HRESULT} 
     */
    get_accHelp(varChild, pszHelp) {
        result := ComCall(15, this, "ptr", varChild, "ptr", pszHelp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszHelpFile 
     * @param {VARIANT} varChild 
     * @param {Pointer<Int32>} pidTopic 
     * @returns {HRESULT} 
     */
    get_accHelpTopic(pszHelpFile, varChild, pidTopic) {
        result := ComCall(16, this, "ptr", pszHelpFile, "ptr", varChild, "int*", pidTopic, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @param {Pointer<BSTR>} pszKeyboardShortcut 
     * @returns {HRESULT} 
     */
    get_accKeyboardShortcut(varChild, pszKeyboardShortcut) {
        result := ComCall(17, this, "ptr", varChild, "ptr", pszKeyboardShortcut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarChild 
     * @returns {HRESULT} 
     */
    get_accFocus(pvarChild) {
        result := ComCall(18, this, "ptr", pvarChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarChildren 
     * @returns {HRESULT} 
     */
    get_accSelection(pvarChildren) {
        result := ComCall(19, this, "ptr", pvarChildren, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @param {Pointer<BSTR>} pszDefaultAction 
     * @returns {HRESULT} 
     */
    get_accDefaultAction(varChild, pszDefaultAction) {
        result := ComCall(20, this, "ptr", varChild, "ptr", pszDefaultAction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} flagsSelect 
     * @param {VARIANT} varChild 
     * @returns {HRESULT} 
     */
    accSelect(flagsSelect, varChild) {
        result := ComCall(21, this, "int", flagsSelect, "ptr", varChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pxLeft 
     * @param {Pointer<Int32>} pyTop 
     * @param {Pointer<Int32>} pcxWidth 
     * @param {Pointer<Int32>} pcyHeight 
     * @param {VARIANT} varChild 
     * @returns {HRESULT} 
     */
    accLocation(pxLeft, pyTop, pcxWidth, pcyHeight, varChild) {
        result := ComCall(22, this, "int*", pxLeft, "int*", pyTop, "int*", pcxWidth, "int*", pcyHeight, "ptr", varChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} navDir 
     * @param {VARIANT} varStart 
     * @param {Pointer<VARIANT>} pvarEndUpAt 
     * @returns {HRESULT} 
     */
    accNavigate(navDir, varStart, pvarEndUpAt) {
        result := ComCall(23, this, "int", navDir, "ptr", varStart, "ptr", pvarEndUpAt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} xLeft 
     * @param {Integer} yTop 
     * @param {Pointer<VARIANT>} pvarChild 
     * @returns {HRESULT} 
     */
    accHitTest(xLeft, yTop, pvarChild) {
        result := ComCall(24, this, "int", xLeft, "int", yTop, "ptr", pvarChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @returns {HRESULT} 
     */
    accDoDefaultAction(varChild) {
        result := ComCall(25, this, "ptr", varChild, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @param {BSTR} szName 
     * @returns {HRESULT} 
     */
    put_accName(varChild, szName) {
        szName := szName is String ? BSTR.Alloc(szName).Value : szName

        result := ComCall(26, this, "ptr", varChild, "ptr", szName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @param {BSTR} szValue 
     * @returns {HRESULT} 
     */
    put_accValue(varChild, szValue) {
        szValue := szValue is String ? BSTR.Alloc(szValue).Value : szValue

        result := ComCall(27, this, "ptr", varChild, "ptr", szValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
