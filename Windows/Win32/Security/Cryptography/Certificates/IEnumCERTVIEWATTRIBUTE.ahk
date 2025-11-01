#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents an attribute-enumeration sequence that contains the certificate attributes for the current row of the row-enumeration sequence.
 * @see https://docs.microsoft.com/windows/win32/api//certview/nn-certview-ienumcertviewattribute
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IEnumCERTVIEWATTRIBUTE extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumCERTVIEWATTRIBUTE
     * @type {Guid}
     */
    static IID => Guid("{e77db656-7653-11d1-9bde-00c04fb683fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "GetName", "GetValue", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Pointer<Integer>} pIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewattribute-next
     */
    Next(pIndex) {
        pIndexMarshal := pIndex is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pIndexMarshal, pIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstrOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewattribute-getname
     */
    GetName(pstrOut) {
        result := ComCall(8, this, "ptr", pstrOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstrOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewattribute-getvalue
     */
    GetValue(pstrOut) {
        result := ComCall(9, this, "ptr", pstrOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewattribute-skip
     */
    Skip(celt) {
        result := ComCall(10, this, "int", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewattribute-reset
     */
    Reset() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumCERTVIEWATTRIBUTE>} ppenum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewattribute-clone
     */
    Clone(ppenum) {
        result := ComCall(12, this, "ptr*", ppenum, "HRESULT")
        return result
    }
}
