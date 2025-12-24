#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that retrieves a property value for an accessible element.
 * @see https://docs.microsoft.com/windows/win32/api//oleacc/nn-oleacc-iaccpropserver
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IAccPropServer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccPropServer
     * @type {Guid}
     */
    static IID => Guid("{76c0dbbb-15e0-4e7b-b61b-20eeea2001e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropValue"]

    /**
     * Retrieves a property value for an accessible element.
     * @param {Pointer<Integer>} pIDString Type: <b>const  BYTE*</b>
     * 
     * Contains a string that identifies the property  being requested.
     * @param {Integer} dwIDStringLen Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Specifies the length of the identity string specified by the <i>pIDString</i> parameter.
     * @param {Guid} idProp Type: <b>MSAAPROPID</b>
     * 
     * Specifies a GUID indicating the desired property.
     * @param {Pointer<VARIANT>} pvarValue Type: <b>VARIANT*</b>
     * 
     * Specifies the value of the overridden property. This parameter is valid only if <i>pfHasProp</i> is <b>TRUE</b>. The server must set this to VT_EMPTY if <i>pfHasProp</i> is set to <b>FALSE</b>.
     * @param {Pointer<BOOL>} pfHasProp Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * Indicates whether the server is supplying a value for the requested property. The server should set this to <b>TRUE</b> if it is returning an overriding property or to <b>FALSE</b> if it is not returning a property (in which case it should also set <i>pvarValue</i> to VT_EMPTY).
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Return S_OK, except under exceptional error conditions such as low memory. If the specified property is not overridden, then <i>pfHasProp</i> should be set to <b>FALSE</b> and <i>pvarValue</i> should be set to VT_EMPTY by the server.
     * @see https://docs.microsoft.com/windows/win32/api//oleacc/nf-oleacc-iaccpropserver-getpropvalue
     */
    GetPropValue(pIDString, dwIDStringLen, idProp, pvarValue, pfHasProp) {
        pIDStringMarshal := pIDString is VarRef ? "char*" : "ptr"
        pfHasPropMarshal := pfHasProp is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pIDStringMarshal, pIDString, "uint", dwIDStringLen, "ptr", idProp, "ptr", pvarValue, pfHasPropMarshal, pfHasProp, "HRESULT")
        return result
    }
}
