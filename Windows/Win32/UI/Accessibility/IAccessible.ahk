#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Variant\VARIANT.ahk

/**
 * Exposes methods and properties that make a user interface element and its children accessible to client applications.
 * @see https://docs.microsoft.com/windows/win32/api//oleacc/nn-oleacc-iaccessible
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IAccessible extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_accParent", "get_accChildCount", "get_accChild", "get_accName", "get_accValue", "get_accDescription", "get_accRole", "get_accState", "get_accHelp", "get_accHelpTopic", "get_accKeyboardShortcut", "get_accFocus", "get_accSelection", "get_accDefaultAction", "accSelect", "accLocation", "accNavigate", "accHitTest", "accDoDefaultAction", "put_accName", "put_accValue"]

    /**
     * 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessible-get_accparent
     */
    get_accParent() {
        result := ComCall(7, this, "ptr*", &ppdispParent := 0, "HRESULT")
        return IDispatch(ppdispParent)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessible-get_accchildcount
     */
    get_accChildCount() {
        result := ComCall(8, this, "int*", &pcountChildren := 0, "HRESULT")
        return pcountChildren
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @returns {IDispatch} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessible-get_accchild
     */
    get_accChild(varChild) {
        result := ComCall(9, this, "ptr", varChild, "ptr*", &ppdispChild := 0, "HRESULT")
        return IDispatch(ppdispChild)
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessible-get_accname
     */
    get_accName(varChild) {
        pszName := BSTR()
        result := ComCall(10, this, "ptr", varChild, "ptr", pszName, "HRESULT")
        return pszName
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessible-get_accvalue
     */
    get_accValue(varChild) {
        pszValue := BSTR()
        result := ComCall(11, this, "ptr", varChild, "ptr", pszValue, "HRESULT")
        return pszValue
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessible-get_accdescription
     */
    get_accDescription(varChild) {
        pszDescription := BSTR()
        result := ComCall(12, this, "ptr", varChild, "ptr", pszDescription, "HRESULT")
        return pszDescription
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessible-get_accrole
     */
    get_accRole(varChild) {
        pvarRole := VARIANT()
        result := ComCall(13, this, "ptr", varChild, "ptr", pvarRole, "HRESULT")
        return pvarRole
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessible-get_accstate
     */
    get_accState(varChild) {
        pvarState := VARIANT()
        result := ComCall(14, this, "ptr", varChild, "ptr", pvarState, "HRESULT")
        return pvarState
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessible-get_acchelp
     */
    get_accHelp(varChild) {
        pszHelp := BSTR()
        result := ComCall(15, this, "ptr", varChild, "ptr", pszHelp, "HRESULT")
        return pszHelp
    }

    /**
     * 
     * @param {Pointer<BSTR>} pszHelpFile 
     * @param {VARIANT} varChild 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessible-get_acchelptopic
     */
    get_accHelpTopic(pszHelpFile, varChild) {
        result := ComCall(16, this, "ptr", pszHelpFile, "ptr", varChild, "int*", &pidTopic := 0, "HRESULT")
        return pidTopic
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessible-get_acckeyboardshortcut
     */
    get_accKeyboardShortcut(varChild) {
        pszKeyboardShortcut := BSTR()
        result := ComCall(17, this, "ptr", varChild, "ptr", pszKeyboardShortcut, "HRESULT")
        return pszKeyboardShortcut
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessible-get_accfocus
     */
    get_accFocus() {
        pvarChild := VARIANT()
        result := ComCall(18, this, "ptr", pvarChild, "HRESULT")
        return pvarChild
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessible-get_accselection
     */
    get_accSelection() {
        pvarChildren := VARIANT()
        result := ComCall(19, this, "ptr", pvarChildren, "HRESULT")
        return pvarChildren
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessible-get_accdefaultaction
     */
    get_accDefaultAction(varChild) {
        pszDefaultAction := BSTR()
        result := ComCall(20, this, "ptr", varChild, "ptr", pszDefaultAction, "HRESULT")
        return pszDefaultAction
    }

    /**
     * 
     * @param {Integer} flagsSelect 
     * @param {VARIANT} varChild 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessible-accselect
     */
    accSelect(flagsSelect, varChild) {
        result := ComCall(21, this, "int", flagsSelect, "ptr", varChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pxLeft 
     * @param {Pointer<Integer>} pyTop 
     * @param {Pointer<Integer>} pcxWidth 
     * @param {Pointer<Integer>} pcyHeight 
     * @param {VARIANT} varChild 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessible-acclocation
     */
    accLocation(pxLeft, pyTop, pcxWidth, pcyHeight, varChild) {
        pxLeftMarshal := pxLeft is VarRef ? "int*" : "ptr"
        pyTopMarshal := pyTop is VarRef ? "int*" : "ptr"
        pcxWidthMarshal := pcxWidth is VarRef ? "int*" : "ptr"
        pcyHeightMarshal := pcyHeight is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, pxLeftMarshal, pxLeft, pyTopMarshal, pyTop, pcxWidthMarshal, pcxWidth, pcyHeightMarshal, pcyHeight, "ptr", varChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} navDir 
     * @param {VARIANT} varStart 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessible-accnavigate
     */
    accNavigate(navDir, varStart) {
        pvarEndUpAt := VARIANT()
        result := ComCall(23, this, "int", navDir, "ptr", varStart, "ptr", pvarEndUpAt, "HRESULT")
        return pvarEndUpAt
    }

    /**
     * 
     * @param {Integer} xLeft 
     * @param {Integer} yTop 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessible-acchittest
     */
    accHitTest(xLeft, yTop) {
        pvarChild := VARIANT()
        result := ComCall(24, this, "int", xLeft, "int", yTop, "ptr", pvarChild, "HRESULT")
        return pvarChild
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessible-accdodefaultaction
     */
    accDoDefaultAction(varChild) {
        result := ComCall(25, this, "ptr", varChild, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @param {BSTR} szName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessible-put_accname
     */
    put_accName(varChild, szName) {
        szName := szName is String ? BSTR.Alloc(szName).Value : szName

        result := ComCall(26, this, "ptr", varChild, "ptr", szName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varChild 
     * @param {BSTR} szValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccessible-put_accvalue
     */
    put_accValue(varChild, szValue) {
        szValue := szValue is String ? BSTR.Alloc(szValue).Value : szValue

        result := ComCall(27, this, "ptr", varChild, "ptr", szValue, "HRESULT")
        return result
    }
}
