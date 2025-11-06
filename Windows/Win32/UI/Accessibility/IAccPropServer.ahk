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
     * 
     * @param {Pointer<Integer>} pIDString 
     * @param {Integer} dwIDStringLen 
     * @param {Guid} idProp 
     * @param {Pointer<VARIANT>} pvarValue 
     * @param {Pointer<BOOL>} pfHasProp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccpropserver-getpropvalue
     */
    GetPropValue(pIDString, dwIDStringLen, idProp, pvarValue, pfHasProp) {
        pIDStringMarshal := pIDString is VarRef ? "char*" : "ptr"
        pfHasPropMarshal := pfHasProp is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pIDStringMarshal, pIDString, "uint", dwIDStringLen, "ptr", idProp, "ptr", pvarValue, pfHasPropMarshal, pfHasProp, "HRESULT")
        return result
    }
}
