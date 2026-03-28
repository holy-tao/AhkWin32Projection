#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for annotating accessible elements and for manipulating identity strings.
 * @see https://learn.microsoft.com/windows/win32/api/oleacc/nn-oleacc-iaccpropservices
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
     * @remarks
     * See the support section for a list of supported properties and their expected types. Note that currently some properties are supported only when a callback is used and cannot be specified directly using this method.
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * Returns E_INVALIDARG if <i>idProp</i> is not a supported property, if <i>var</i> is not a supported type for that property, or if the identity string is not valid.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-setpropvalue
     */
    SetPropValue(pIDString, dwIDStringLen, idProp, var) {
        pIDStringMarshal := pIDString is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pIDStringMarshal, pIDString, "uint", dwIDStringLen, "ptr", idProp, "ptr", var, "HRESULT")
        return result
    }

    /**
     * Servers use SetPropServer to specify a callback object to be used to annotate an array of properties for the accessible element.
     * @remarks
     * See the support section for a list of supported properties and their expected types.
     * 
     * The annotation run time will use <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> to increment the reference counter for the <i>pServer</i> callback object appropriately. The caller is free to <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> it after calling this method. The annotation run time will automatically release the callback object after the accessible element being annotated is no longer being used.
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
     * @param {Integer} _annoScope 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * Returns E_INVALIDARG if any of the properties in the <i>paProps</i> array are not supported properties, if the identity string is not valid, or if <i>annoScope</i> is not one of ANNO_THIS or ANNO_CONTAINER.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-setpropserver
     */
    SetPropServer(pIDString, dwIDStringLen, paProps, cProps, pServer, _annoScope) {
        pIDStringMarshal := pIDString is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pIDStringMarshal, pIDString, "uint", dwIDStringLen, "ptr", paProps, "int", cProps, "ptr", pServer, "int", _annoScope, "HRESULT")
        return result
    }

    /**
     * Servers use ClearProps to restore default values to properties of accessible elements that they had previously annotated.
     * @remarks
     * See the support section for a list of supported properties and their expected types.
     * 
     * Clearing the annotation for a property will cause any associated resources to be released. If a callback property server was used (see <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-iaccpropservices-setpropserver">SetPropServer</a>), it will be released.
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK, even if the specified properties were never annotated on the accessible object; clearing already cleared properties is considered a success.
     * 
     * Returns E_INVALIDARG if any of the properties in the <i>paProps</i> array are not supported.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-clearprops
     */
    ClearProps(pIDString, dwIDStringLen, paProps, cProps) {
        pIDStringMarshal := pIDString is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pIDStringMarshal, pIDString, "uint", dwIDStringLen, "ptr", paProps, "int", cProps, "HRESULT")
        return result
    }

    /**
     * This method wraps SetPropValue, providing a convenient entry point for callers who are annotating HWND-based accessible elements. If the new value is a string, you can use IAccPropServices::SetHwndPropStr instead.
     * @remarks
     * By using this method, the caller does not have to obtain an identity string; it can specify the <i>hwnd</i>, <i>idObject</i>, and <i>idChild</i> parameters directly.
     * @param {HWND} _hwnd 
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * Returns E_INVALIDARG if the <i>idProp</i> property is not supported.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-sethwndprop
     */
    SetHwndProp(_hwnd, idObject, idChild, idProp, var) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd

        result := ComCall(6, this, "ptr", _hwnd, "uint", idObject, "uint", idChild, "ptr", idProp, "ptr", var, "HRESULT")
        return result
    }

    /**
     * This method wraps SetPropValue, providing a more convenient entry point for callers who are annotating HWND-based accessible elements.
     * @remarks
     * By using this method, the caller does not have to obtain an identity string; it can specify the <i>hwnd</i>, <i>idObject</i>, and <i>idChild</i> parameters directly.
     * @param {HWND} _hwnd 
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-sethwndpropstr
     */
    SetHwndPropStr(_hwnd, idObject, idChild, idProp, str) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd
        str := str is String ? StrPtr(str) : str

        result := ComCall(7, this, "ptr", _hwnd, "uint", idObject, "uint", idChild, "ptr", idProp, "ptr", str, "HRESULT")
        return result
    }

    /**
     * This method wraps SetPropServer, providing a convenient entry point for callers who are annotating HWND-based accessible elements.
     * @remarks
     * By using this method, the caller does not have to obtain an identity string; it can specify the <i>hwnd</i>, <i>idObject</i>, and <i>idChild</i> parameters directly.
     * @param {HWND} _hwnd 
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
     * @param {Integer} _annoScope 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * Returns E_INVALIDARG if any of the properties in the <i>paProps</i> array are not supported properties, if the identity string is not valid, or if <i>annoScope</i> is not one of ANNO_THIS or ANNO_CONTAINER.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-sethwndpropserver
     */
    SetHwndPropServer(_hwnd, idObject, idChild, paProps, cProps, pServer, _annoScope) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd

        result := ComCall(8, this, "ptr", _hwnd, "uint", idObject, "uint", idChild, "ptr", paProps, "int", cProps, "ptr", pServer, "int", _annoScope, "HRESULT")
        return result
    }

    /**
     * This method wraps SetPropValue, SetPropServer, and ClearProps, and provides a convenient entry point for callers who are annotating HWND-based accessible elements.
     * @remarks
     * By using this method, the caller does not have to obtain an identity string; it can specify the <i>hwnd</i>, <i>idObject</i>, and <i>idChild</i> parameters directly.
     * 
     * Additionally, <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-iaccpropservices-sethwndpropstr">SetHwndPropStr</a> takes a regular Unicode string as a parameter; the caller does not need to specially allocate a <b>BSTR</b>.
     * @param {HWND} _hwnd 
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK, even if the specified properties were never annotated on the accessible object; clearing already-cleared properties is considered a success.
     * 
     * Returns E_INVALIDARG if any of the properties in the <i>paProps</i> array are not supported.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * 
     * For descriptions of return values, see the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-iaccpropservices-setpropvalue">SetPropValue</a>, <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-iaccpropservices-setpropserver">SetPropServer</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-iaccpropservices-clearprops">ClearProps</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-clearhwndprops
     */
    ClearHwndProps(_hwnd, idObject, idChild, paProps, cProps) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd

        result := ComCall(9, this, "ptr", _hwnd, "uint", idObject, "uint", idChild, "ptr", paProps, "int", cProps, "HRESULT")
        return result
    }

    /**
     * Callers use ComposeHwndIdentityString to retrieve an identity string.
     * @param {HWND} _hwnd 
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * Returns E_INVALIDARG if <i>hwnd</i>, <i>idObject</i>, or <i>idChild</i> is not valid.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-composehwndidentitystring
     */
    ComposeHwndIdentityString(_hwnd, idObject, idChild, ppIDString, pdwIDStringLen) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd

        ppIDStringMarshal := ppIDString is VarRef ? "ptr*" : "ptr"
        pdwIDStringLenMarshal := pdwIDStringLen is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, "ptr", _hwnd, "uint", idObject, "uint", idChild, ppIDStringMarshal, ppIDString, pdwIDStringLenMarshal, pdwIDStringLen, "HRESULT")
        return result
    }

    /**
     * Use this method to determine the HWND, object ID, and child ID for the accessible element identified by the identity string.
     * @remarks
     * This method succeeds only if the provided identity string is a <b>HWND</b>-based identity string. This method is useful when used in an <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccpropserver">IAccPropServer</a> callback server that was registered with ANNO_CONTAINER scope because it allows the server to determine, from the given identity string, the child element (<i>idChild</i>) for which the client is calling the server.
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * Returns E_INVALIDARG if <i>phwnd</i>, <i>pidObject</i>, or <i>pidChild</i> are not valid, or if the given identity string is not a <b>HWND</b>-based identity string.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-decomposehwndidentitystring
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
     * @param {HMENU} _hmenu 
     * @param {Integer} idChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the child ID of the accessible element.
     * @param {Guid} idProp Type: <b>MSAAPROPID</b>
     * 
     * Specifies which property of the accessible element is to be annotated.
     * @param {VARIANT} var Type: <b>VARIANT</b>
     * 
     * Specifies a new value for the <i>idProp</i> property.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-sethmenuprop
     */
    SetHmenuProp(_hmenu, idChild, idProp, var) {
        _hmenu := _hmenu is Win32Handle ? NumGet(_hmenu, "ptr") : _hmenu

        result := ComCall(12, this, "ptr", _hmenu, "uint", idChild, "ptr", idProp, "ptr", var, "HRESULT")
        return result
    }

    /**
     * This method wraps SetPropValue, providing a more convenient entry point for callers who are annotating HMENU-based accessible elements.
     * @remarks
     * By using this method, the caller does not have to obtain an identity string; it can specify the <i>hmenu</i>, <i>idObject</i>, and <i>idChild</i> parameters directly.
     * @param {HMENU} _hmenu 
     * @param {Integer} idChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the child ID of the accessible element.
     * @param {Guid} idProp Type: <b>MSAAPROPID</b>
     * 
     * Specifies which property of the accessible element is to be annotated.
     * @param {PWSTR} str Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * Specifies a new value for the <i>idProp</i> property.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-sethmenupropstr
     */
    SetHmenuPropStr(_hmenu, idChild, idProp, str) {
        _hmenu := _hmenu is Win32Handle ? NumGet(_hmenu, "ptr") : _hmenu
        str := str is String ? StrPtr(str) : str

        result := ComCall(13, this, "ptr", _hmenu, "uint", idChild, "ptr", idProp, "ptr", str, "HRESULT")
        return result
    }

    /**
     * This method wraps SetPropServer, providing a convenient entry point for callers who are annotating HMENU-based accessible elements.
     * @remarks
     * By using this method, the caller does not have to obtain an identity string; it can specify the <i>hmenu</i> and <i>idChild</i> parameters directly.
     * @param {HMENU} _hmenu 
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
     * @param {Integer} _annoScope 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * Returns E_INVALIDARG if any of the properties in the <i>paProps</i> array are not supported properties, if the identity string is not valid, or if <i>annoScope</i> is not one of ANNO_THIS or ANNO_CONTAINER.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-sethmenupropserver
     */
    SetHmenuPropServer(_hmenu, idChild, paProps, cProps, pServer, _annoScope) {
        _hmenu := _hmenu is Win32Handle ? NumGet(_hmenu, "ptr") : _hmenu

        result := ComCall(14, this, "ptr", _hmenu, "uint", idChild, "ptr", paProps, "int", cProps, "ptr", pServer, "int", _annoScope, "HRESULT")
        return result
    }

    /**
     * This method wraps ClearProps, and provides a convenient entry point for callers who are annotating HMENU-based accessible elements.
     * @remarks
     * By using this method, the caller does not have to obtain an identity string; it can specify the <i>hmenu</i> and <i>idChild</i> parameters directly.
     * @param {HMENU} _hmenu 
     * @param {Integer} idChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the child ID of the accessible element.
     * @param {Pointer<Guid>} paProps Type: <b>const MSAAPROPID*</b>
     * 
     * Specifies an array of properties to be reset. These properties will revert to the default behavior that they displayed before they were annotated.
     * @param {Integer} cProps Type: <b>int</b>
     * 
     * Specifies the number of properties in the <i>paProps</i> array.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK, even if the specified properties were never annotated on the accessible object; clearing already-cleared properties is considered a success.
     * 
     * Returns E_INVALIDARG if any of the properties in the <i>paProps</i> array are not supported.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * 
     * For descriptions of other parameters and return values, see the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nf-oleacc-iaccpropservices-clearprops">ClearProps</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-clearhmenuprops
     */
    ClearHmenuProps(_hmenu, idChild, paProps, cProps) {
        _hmenu := _hmenu is Win32Handle ? NumGet(_hmenu, "ptr") : _hmenu

        result := ComCall(15, this, "ptr", _hmenu, "uint", idChild, "ptr", paProps, "int", cProps, "HRESULT")
        return result
    }

    /**
     * Callers use ComposeHmenuIdentityString to retrieve an identity string for an HMENU-based accessible element.
     * @param {HMENU} _hmenu 
     * @param {Integer} idChild Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the child ID of the accessible element.
     * @param {Pointer<Pointer<Integer>>} ppIDString Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a>**</b>
     * 
     * Pointer to a buffer that receives the identity string. The callee allocates this buffer using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a>. When finished, the caller must free the buffer by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @param {Pointer<Integer>} pdwIDStringLen Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a>*</b>
     * 
     * Pointer to a buffer that receives the length of the identity string.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * Returns E_INVALIDARG if <i>hmenu</i> or <i>idChild</i> is not valid.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-composehmenuidentitystring
     */
    ComposeHmenuIdentityString(_hmenu, idChild, ppIDString, pdwIDStringLen) {
        _hmenu := _hmenu is Win32Handle ? NumGet(_hmenu, "ptr") : _hmenu

        ppIDStringMarshal := ppIDString is VarRef ? "ptr*" : "ptr"
        pdwIDStringLenMarshal := pdwIDStringLen is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, "ptr", _hmenu, "uint", idChild, ppIDStringMarshal, ppIDString, pdwIDStringLenMarshal, pdwIDStringLen, "HRESULT")
        return result
    }

    /**
     * Use this method to determine the HMENU, object ID, and child ID for the accessible element identified by the identity string.
     * @remarks
     * This method succeeds only if the provided identity string is an <b>HMENU</b>-based identity string. This method is useful in an <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccpropserver">IAccPropServer</a> callback server that was registered with ANNO_CONTAINER scope because it allows the server to determine, from the given identity string, the child element (<i>idChild</i>) for which the client is calling the server.
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If successful, returns S_OK.
     * 
     * Returns E_INVALIDARG if <i>phmenu</i> or <i>pidChild</i> are not valid, or if the given identity string is not a <b>HMENU</b>-based identity string.
     * 
     * May return other error codes under exceptional error conditions such as low memory.
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropservices-decomposehmenuidentitystring
     */
    DecomposeHmenuIdentityString(pIDString, dwIDStringLen, phmenu, pidChild) {
        pIDStringMarshal := pIDString is VarRef ? "char*" : "ptr"
        pidChildMarshal := pidChild is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, pIDStringMarshal, pIDString, "uint", dwIDStringLen, "ptr", phmenu, pidChildMarshal, pidChild, "HRESULT")
        return result
    }
}
