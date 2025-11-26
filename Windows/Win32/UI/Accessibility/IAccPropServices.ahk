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
     * Use SetPropValue to identify the accessible element to be annotated, specify the property to be annotated, and provide a new value for that property.
     * @param {Pointer<Integer>} pIDString Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a>*</b>
     * 
     * Identifies the accessible element that is to be annotated.
     * @param {Integer} dwIDStringLen Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the length of the string identified by the <i>pIDString</i> parameter.
     * @param {Guid} idProp Type: <b>MSAAPROPID</b>
     * 
     * Specifies the property of the accessible element to be annotated.
     * @param {VARIANT} var Type: <b>VARIANT</b>
     * 
     * Specifies a new value for the property.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * Returns E_INVALIDARG if <i>idProp</i> is not a supported property, if <i>var</i> is not a supported type for that property, or if the identity string is not valid.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccpropservices-setpropvalue
     */
    SetPropValue(pIDString, dwIDStringLen, idProp, var) {
        pIDStringMarshal := pIDString is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pIDStringMarshal, pIDString, "uint", dwIDStringLen, "ptr", idProp, "ptr", var, "HRESULT")
        return result
    }

    /**
     * Servers use SetPropServer to specify a callback object to be used to annotate an array of properties for the accessible element.
     * @param {Pointer<Integer>} pIDString Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a>*</b>
     * 
     * Identifies the accessible element that is to be annotated.
     * @param {Integer} dwIDStringLen Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the length of the string identified by the <i>pIDString</i> parameter.
     * @param {Pointer<Guid>} paProps Type: <b>const MSAAPROPID*</b>
     * 
     * Specifies an array of properties to be handled by the specified callback object.
     * @param {Integer} cProps Type: <b>int</b>
     * 
     * Specifies an array of properties to be handled by the specified callback object.
     * @param {IAccPropServer} pServer Type: <b>IAccPropServer*</b>
     * 
     * Specifies the callback object that will be invoked when a client requests one of the overridden properties.
     * @param {Integer} annoScope Type: <b>AnnoScope</b>
     * 
     * May be ANNO_THIS, indicating that the annotation affects the indicated accessible element only; or ANNO_CONTAINER, indicating that it applies to the element and its immediate element children.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * Returns E_INVALIDARG if any of the properties in the <i>paProps</i> array are not supported properties, if the identity string is not valid, or if <i>annoScope</i> is not one of ANNO_THIS or ANNO_CONTAINER.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccpropservices-setpropserver
     */
    SetPropServer(pIDString, dwIDStringLen, paProps, cProps, pServer, annoScope) {
        pIDStringMarshal := pIDString is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pIDStringMarshal, pIDString, "uint", dwIDStringLen, "ptr", paProps, "int", cProps, "ptr", pServer, "int", annoScope, "HRESULT")
        return result
    }

    /**
     * Servers use ClearProps to restore default values to properties of accessible elements that they had previously annotated.
     * @param {Pointer<Integer>} pIDString Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a>*</b>
     * 
     * Identify the accessible element that is to be un-annotated.
     * @param {Integer} dwIDStringLen Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Length of <i>pIDString</i>.
     * @param {Pointer<Guid>} paProps Type: <b>const MSAAPROPID*</b>
     * 
     * Specify an array of properties that is to be reset. These properties will revert to the default behavior they displayed before they were annotated.
     * @param {Integer} cProps Type: <b>int</b>
     * 
     * Size of <i>paProps</i> array.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK, even if the specified properties were never annotated on the accessible object; clearing already cleared properties is considered a success.
     * 
     * Returns E_INVALIDARG if any of the properties in the <i>paProps</i> array are not supported.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccpropservices-clearprops
     */
    ClearProps(pIDString, dwIDStringLen, paProps, cProps) {
        pIDStringMarshal := pIDString is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pIDStringMarshal, pIDString, "uint", dwIDStringLen, "ptr", paProps, "int", cProps, "HRESULT")
        return result
    }

    /**
     * This method wraps SetPropValue, providing a convenient entry point for callers who are annotating HWND-based accessible elements. If the new value is a string, you can use IAccPropServices::SetHwndPropStr instead.
     * @param {HWND} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * Identifies the accessible element that is to be annotated. This replaces the identity string.
     * @param {Integer} idObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Identifies the accessible element that is to be annotated. This replaces the identity string.
     * @param {Integer} idChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Identifies the accessible element that is to be annotated. This replaces the identity string.
     * @param {Guid} idProp Type: <b>MSAAPROPID</b>
     * 
     * Specifies which property of that element is to be annotated.
     * @param {VARIANT} var Type: <b>VARIANT</b>
     * 
     * Specifies a new value for that property.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * Returns E_INVALIDARG if the <i>idProp</i> property is not supported.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccpropservices-sethwndprop
     */
    SetHwndProp(hwnd, idObject, idChild, idProp, var) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(6, this, "ptr", hwnd, "uint", idObject, "uint", idChild, "ptr", idProp, "ptr", var, "HRESULT")
        return result
    }

    /**
     * This method wraps SetPropValue, providing a more convenient entry point for callers who are annotating HWND-based accessible elements.
     * @param {HWND} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * Identifies the accessible element that is to be annotated. This replaces the identity string.
     * @param {Integer} idObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Identifies the accessible element that is to be annotated. This replaces the identity string.
     * @param {Integer} idChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Identifies the accessible element that is to be annotated. This replaces the identity string.
     * @param {Guid} idProp Type: <b>MSAAPROPID</b>
     * 
     * Specifies which property of that element is to be annotated.
     * @param {PWSTR} str Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * Specifies a new value for that property.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccpropservices-sethwndpropstr
     */
    SetHwndPropStr(hwnd, idObject, idChild, idProp, str) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        str := str is String ? StrPtr(str) : str

        result := ComCall(7, this, "ptr", hwnd, "uint", idObject, "uint", idChild, "ptr", idProp, "ptr", str, "HRESULT")
        return result
    }

    /**
     * This method wraps SetPropServer, providing a convenient entry point for callers who are annotating HWND-based accessible elements.
     * @param {HWND} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * Identifies the accessible element that is to be annotated. This replaces the identity string.
     * @param {Integer} idObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Identifies the accessible element that is to be annotated. This replaces the identity string.
     * @param {Integer} idChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Identifies the accessible element that is to be annotated. This replaces the identity string.
     * @param {Pointer<Guid>} paProps Type: <b>const MSAAPROPID*</b>
     * 
     * Specifies an array of properties that is to be handled by the specified callback object.
     * @param {Integer} cProps Type: <b>int</b>
     * 
     * Specifies the number of properties in the <i>paProps</i> array.
     * @param {IAccPropServer} pServer Type: <b>IAccPropServer*</b>
     * 
     * Specifies the callback object, which will be invoked when a client requests one of the overridden properties.
     * @param {Integer} annoScope Type: <b>AnnoScope</b>
     * 
     * May be ANNO_THIS, indicating that the annotation affects the indicated accessible element only; or ANNO_CONTAINER, indicating that it applies to the element and its immediate element children.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * Returns E_INVALIDARG if any of the properties in the <i>paProps</i> array are not supported properties, if the identity string is not valid, or if <i>annoScope</i> is not one of ANNO_THIS or ANNO_CONTAINER.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccpropservices-sethwndpropserver
     */
    SetHwndPropServer(hwnd, idObject, idChild, paProps, cProps, pServer, annoScope) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(8, this, "ptr", hwnd, "uint", idObject, "uint", idChild, "ptr", paProps, "int", cProps, "ptr", pServer, "int", annoScope, "HRESULT")
        return result
    }

    /**
     * This method wraps SetPropValue, SetPropServer, and ClearProps, and provides a convenient entry point for callers who are annotating HWND-based accessible elements.
     * @param {HWND} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * Identifies the accessible element that is to be annotated. This replaces the identity string.
     * @param {Integer} idObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Identifies the accessible element that is to be annotated. This replaces the identity string.
     * @param {Integer} idChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Identifies the accessible element that is to be annotated. This replaces the identity string.
     * @param {Pointer<Guid>} paProps Type: <b>const MSAAPROPID*</b>
     * 
     * Specifies an array of properties that is to be reset. These properties will revert to the default behavior that they displayed before they were annotated.
     * @param {Integer} cProps Type: <b>int</b>
     * 
     * Specifies the number of properties in the <i>paProps</i> array.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK, even if the specified properties were never annotated on the accessible object; clearing already-cleared properties is considered a success.
     * 
     * Returns E_INVALIDARG if any of the properties in the <i>paProps</i> array are not supported.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * 
     * For descriptions of return values, see the corresponding <a href="/windows/desktop/api/oleacc/nf-oleacc-iaccpropservices-setpropvalue">SetPropValue</a>, <a href="/windows/desktop/api/oleacc/nf-oleacc-iaccpropservices-setpropserver">SetPropServer</a>, or <a href="/windows/desktop/api/oleacc/nf-oleacc-iaccpropservices-clearprops">ClearProps</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccpropservices-clearhwndprops
     */
    ClearHwndProps(hwnd, idObject, idChild, paProps, cProps) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(9, this, "ptr", hwnd, "uint", idObject, "uint", idChild, "ptr", paProps, "int", cProps, "HRESULT")
        return result
    }

    /**
     * Callers use ComposeHwndIdentityString to retrieve an identity string.
     * @param {HWND} hwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * Specifies the <b>HWND</b> of the accessible element that the caller wants to identify.
     * @param {Integer} idObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the object ID of the accessible element.
     * @param {Integer} idChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the child ID of the accessible element.
     * @param {Pointer<Pointer<Integer>>} ppIDString Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a>**</b>
     * 
     * Pointer to a buffer that receives the identity string. The callee allocates this buffer using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. When finished, the caller must free the buffer by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<Integer>} pdwIDStringLen Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Pointer to a buffer that receives the length of the identity string.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * Returns E_INVALIDARG if <i>hwnd</i>, <i>idObject</i>, or <i>idChild</i> is not valid.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccpropservices-composehwndidentitystring
     */
    ComposeHwndIdentityString(hwnd, idObject, idChild, ppIDString, pdwIDStringLen) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        ppIDStringMarshal := ppIDString is VarRef ? "ptr*" : "ptr"
        pdwIDStringLenMarshal := pdwIDStringLen is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "ptr", hwnd, "uint", idObject, "uint", idChild, ppIDStringMarshal, ppIDString, pdwIDStringLenMarshal, pdwIDStringLen, "HRESULT")
        return result
    }

    /**
     * Use this method to determine the HWND, object ID, and child ID for the accessible element identified by the identity string.
     * @param {Pointer<Integer>} pIDString Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a>*</b>
     * 
     * Pointer to a buffer containing identity string of an <b>HWND</b>-based accessible element.
     * @param {Integer} dwIDStringLen Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the length of the identity string specified by <i>pIDString</i>.
     * @param {Pointer<HWND>} phwnd Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a>*</b>
     * 
     * Pointer to a buffer that receives the <b>HWND</b> of the accessible element.
     * @param {Pointer<Integer>} pidObject Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Pointer to a buffer that receives the object ID of the accessible element.
     * @param {Pointer<Integer>} pidChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Pointer to a buffer that receives the child ID of the accessible element.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * Returns E_INVALIDARG if <i>phwnd</i>, <i>pidObject</i>, or <i>pidChild</i> are not valid, or if the given identity string is not a <b>HWND</b>-based identity string.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccpropservices-decomposehwndidentitystring
     */
    DecomposeHwndIdentityString(pIDString, dwIDStringLen, phwnd, pidObject, pidChild) {
        pIDStringMarshal := pIDString is VarRef ? "char*" : "ptr"
        pidObjectMarshal := pidObject is VarRef ? "uint*" : "ptr"
        pidChildMarshal := pidChild is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pIDStringMarshal, pIDString, "uint", dwIDStringLen, "ptr", phwnd, pidObjectMarshal, pidObject, pidChildMarshal, pidChild, "HRESULT")
        return result
    }

    /**
     * This method wraps SetPropValue, providing a convenient entry point for callers who are annotating HMENU-based accessible elements. If the new value is a string, you can use IAccPropServices::SetHmenuPropStr instead.
     * @param {HMENU} hmenu Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMENU</a></b>
     * 
     * Identifies the <b>HMENU</b>-based accessible element to be annotated.
     * @param {Integer} idChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the child ID of the accessible element.
     * @param {Guid} idProp Type: <b>MSAAPROPID</b>
     * 
     * Specifies which property of the accessible element is to be annotated.
     * @param {VARIANT} var Type: <b>VARIANT</b>
     * 
     * Specifies a new value for the <i>idProp</i> property.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccpropservices-sethmenuprop
     */
    SetHmenuProp(hmenu, idChild, idProp, var) {
        hmenu := hmenu is Win32Handle ? NumGet(hmenu, "ptr") : hmenu

        result := ComCall(12, this, "ptr", hmenu, "uint", idChild, "ptr", idProp, "ptr", var, "HRESULT")
        return result
    }

    /**
     * This method wraps SetPropValue, providing a more convenient entry point for callers who are annotating HMENU-based accessible elements.
     * @param {HMENU} hmenu Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMENU</a></b>
     * 
     * Identifies the <b>HMENU</b>-based accessible element to be annotated.
     * @param {Integer} idChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the child ID of the accessible element.
     * @param {Guid} idProp Type: <b>MSAAPROPID</b>
     * 
     * Specifies which property of the accessible element is to be annotated.
     * @param {PWSTR} str Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * Specifies a new value for the <i>idProp</i> property.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccpropservices-sethmenupropstr
     */
    SetHmenuPropStr(hmenu, idChild, idProp, str) {
        hmenu := hmenu is Win32Handle ? NumGet(hmenu, "ptr") : hmenu
        str := str is String ? StrPtr(str) : str

        result := ComCall(13, this, "ptr", hmenu, "uint", idChild, "ptr", idProp, "ptr", str, "HRESULT")
        return result
    }

    /**
     * This method wraps SetPropServer, providing a convenient entry point for callers who are annotating HMENU-based accessible elements.
     * @param {HMENU} hmenu Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMENU</a></b>
     * 
     * Identifies the <b>HMENU</b>-accessible element to be annotated.
     * @param {Integer} idChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Identifies the accessible element that is to be annotated. This replaces the identity string.
     * @param {Pointer<Guid>} paProps Type: <b>const MSAAPROPID*</b>
     * 
     * Specifies an array of properties that is to be handled by the specified callback object.
     * @param {Integer} cProps Type: <b>int</b>
     * 
     * Specifies the number of properties in the <i>paProps</i> array.
     * @param {IAccPropServer} pServer Type: <b>IAccPropServer*</b>
     * 
     * Specifies the callback object, which will be invoked when a client requests one of the overridden properties.
     * @param {Integer} annoScope Type: <b>AnnoScope</b>
     * 
     * May be ANNO_THIS, indicating that the annotation affects the indicated accessible element only; or ANNO_CONTAINER, indicating that it applies to the element and its immediate element children.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * Returns E_INVALIDARG if any of the properties in the <i>paProps</i> array are not supported properties, if the identity string is not valid, or if <i>annoScope</i> is not one of ANNO_THIS or ANNO_CONTAINER.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccpropservices-sethmenupropserver
     */
    SetHmenuPropServer(hmenu, idChild, paProps, cProps, pServer, annoScope) {
        hmenu := hmenu is Win32Handle ? NumGet(hmenu, "ptr") : hmenu

        result := ComCall(14, this, "ptr", hmenu, "uint", idChild, "ptr", paProps, "int", cProps, "ptr", pServer, "int", annoScope, "HRESULT")
        return result
    }

    /**
     * This method wraps ClearProps, and provides a convenient entry point for callers who are annotating HMENU-based accessible elements.
     * @param {HMENU} hmenu Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMENU</a></b>
     * 
     * Identifies the <b>HMENU</b>-based accessible element to be annotated.
     * @param {Integer} idChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the child ID of the accessible element.
     * @param {Pointer<Guid>} paProps Type: <b>const MSAAPROPID*</b>
     * 
     * Specifies an array of properties to be reset. These properties will revert to the default behavior that they displayed before they were annotated.
     * @param {Integer} cProps Type: <b>int</b>
     * 
     * Specifies the number of properties in the <i>paProps</i> array.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK, even if the specified properties were never annotated on the accessible object; clearing already-cleared properties is considered a success.
     * 
     * Returns E_INVALIDARG if any of the properties in the <i>paProps</i> array are not supported.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * 
     * For descriptions of other parameters and return values, see the <a href="/windows/desktop/api/oleacc/nf-oleacc-iaccpropservices-clearprops">ClearProps</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccpropservices-clearhmenuprops
     */
    ClearHmenuProps(hmenu, idChild, paProps, cProps) {
        hmenu := hmenu is Win32Handle ? NumGet(hmenu, "ptr") : hmenu

        result := ComCall(15, this, "ptr", hmenu, "uint", idChild, "ptr", paProps, "int", cProps, "HRESULT")
        return result
    }

    /**
     * Callers use ComposeHmenuIdentityString to retrieve an identity string for an HMENU-based accessible element.
     * @param {HMENU} hmenu Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMENU</a></b>
     * 
     * Identifies the <b>HMENU</b>-based accessible element.
     * @param {Integer} idChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the child ID of the accessible element.
     * @param {Pointer<Pointer<Integer>>} ppIDString Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a>**</b>
     * 
     * Pointer to a buffer that receives the identity string. The callee allocates this buffer using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. When finished, the caller must free the buffer by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<Integer>} pdwIDStringLen Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Pointer to a buffer that receives the length of the identity string.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * Returns E_INVALIDARG if <i>hmenu</i> or <i>idChild</i> is not valid.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccpropservices-composehmenuidentitystring
     */
    ComposeHmenuIdentityString(hmenu, idChild, ppIDString, pdwIDStringLen) {
        hmenu := hmenu is Win32Handle ? NumGet(hmenu, "ptr") : hmenu

        ppIDStringMarshal := ppIDString is VarRef ? "ptr*" : "ptr"
        pdwIDStringLenMarshal := pdwIDStringLen is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "ptr", hmenu, "uint", idChild, ppIDStringMarshal, ppIDString, pdwIDStringLenMarshal, pdwIDStringLen, "HRESULT")
        return result
    }

    /**
     * Use this method to determine the HMENU, object ID, and child ID for the accessible element identified by the identity string.
     * @param {Pointer<Integer>} pIDString Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a>*</b>
     * 
     * Pointer to a buffer containing identity string of an <b>HMENU</b>-based accessible element.
     * @param {Integer} dwIDStringLen Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the length of the identity string specified by <i>pIDString</i>.
     * @param {Pointer<HMENU>} phmenu Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HMENU</a>*</b>
     * 
     * Pointer to a buffer that receives the <b>HMENU</b> of the accessible element.
     * @param {Pointer<Integer>} pidChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Pointer to a buffer that receives the child ID of the accessible element.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * Returns E_INVALIDARG if <i>phmenu</i> or <i>pidChild</i> are not valid, or if the given identity string is not a <b>HMENU</b>-based identity string.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccpropservices-decomposehmenuidentitystring
     */
    DecomposeHmenuIdentityString(pIDString, dwIDStringLen, phmenu, pidChild) {
        pIDStringMarshal := pIDString is VarRef ? "char*" : "ptr"
        pidChildMarshal := pidChild is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, pIDStringMarshal, pIDString, "uint", dwIDStringLen, "ptr", phmenu, pidChildMarshal, pidChild, "HRESULT")
        return result
    }
}
