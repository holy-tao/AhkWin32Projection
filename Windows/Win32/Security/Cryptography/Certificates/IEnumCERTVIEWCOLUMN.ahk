#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IEnumCERTVIEWCOLUMN.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents a column-enumeration sequence that contains the column data for the current row of the enumeration sequence.
 * @see https://docs.microsoft.com/windows/win32/api//certview/nn-certview-ienumcertviewcolumn
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IEnumCERTVIEWCOLUMN extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumCERTVIEWCOLUMN
     * @type {Guid}
     */
    static IID => Guid("{9c735be2-57a5-11d1-9bdb-00c04fb683fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "GetName", "GetDisplayName", "GetType", "IsIndexed", "GetMaxLength", "GetValue", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Pointer<Integer>} pIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewcolumn-next
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
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewcolumn-getname
     */
    GetName(pstrOut) {
        result := ComCall(8, this, "ptr", pstrOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstrOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewcolumn-getdisplayname
     */
    GetDisplayName(pstrOut) {
        result := ComCall(9, this, "ptr", pstrOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewcolumn-gettype
     */
    GetType(pType) {
        pTypeMarshal := pType is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pTypeMarshal, pType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pIndexed 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewcolumn-isindexed
     */
    IsIndexed(pIndexed) {
        pIndexedMarshal := pIndexed is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pIndexedMarshal, pIndexed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMaxLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewcolumn-getmaxlength
     */
    GetMaxLength(pMaxLength) {
        pMaxLengthMarshal := pMaxLength is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, pMaxLengthMarshal, pMaxLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewcolumn-getvalue
     */
    GetValue(Flags, pvarValue) {
        result := ComCall(13, this, "int", Flags, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewcolumn-skip
     */
    Skip(celt) {
        result := ComCall(14, this, "int", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewcolumn-reset
     */
    Reset() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumCERTVIEWCOLUMN} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewcolumn-clone
     */
    Clone() {
        result := ComCall(16, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumCERTVIEWCOLUMN(ppenum)
    }
}
