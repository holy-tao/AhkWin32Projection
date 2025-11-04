#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes a method that provides a unique identifier for an accessible element.
 * @see https://docs.microsoft.com/windows/win32/api//oleacc/nn-oleacc-iaccidentity
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class IAccIdentity extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccIdentity
     * @type {Guid}
     */
    static IID => Guid("{7852b78d-1cfd-41c1-a615-9c0c85960b5f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIdentityString"]

    /**
     * 
     * @param {Integer} dwIDChild 
     * @param {Pointer<Pointer<Integer>>} ppIDString 
     * @param {Pointer<Integer>} pdwIDStringLen 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleacc/nf-oleacc-iaccidentity-getidentitystring
     */
    GetIdentityString(dwIDChild, ppIDString, pdwIDStringLen) {
        ppIDStringMarshal := ppIDString is VarRef ? "ptr*" : "ptr"
        pdwIDStringLenMarshal := pdwIDStringLen is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", dwIDChild, ppIDStringMarshal, ppIDString, pdwIDStringLenMarshal, pdwIDStringLen, "HRESULT")
        return result
    }
}
