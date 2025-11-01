#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Allows properly authorized clients to create a customized or complete view of the Certificate Services database.
 * @see https://docs.microsoft.com/windows/win32/api//certview/nn-certview-icertview
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertView extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertView
     * @type {Guid}
     */
    static IID => Guid("{c3fac344-1e84-11d1-9bd6-00c04fb683fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenConnection", "EnumCertViewColumn", "GetColumnCount", "GetColumnIndex", "SetResultColumnCount", "SetResultColumn", "SetRestriction", "OpenView"]

    /**
     * 
     * @param {BSTR} strConfig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-icertview-openconnection
     */
    OpenConnection(strConfig) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(7, this, "ptr", strConfig, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fResultColumn 
     * @param {Pointer<IEnumCERTVIEWCOLUMN>} ppenum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-icertview-enumcertviewcolumn
     */
    EnumCertViewColumn(fResultColumn, ppenum) {
        result := ComCall(8, this, "int", fResultColumn, "ptr*", ppenum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fResultColumn 
     * @param {Pointer<Integer>} pcColumn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-icertview-getcolumncount
     */
    GetColumnCount(fResultColumn, pcColumn) {
        result := ComCall(9, this, "int", fResultColumn, "int*", pcColumn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} fResultColumn 
     * @param {BSTR} strColumnName 
     * @param {Pointer<Integer>} pColumnIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-icertview-getcolumnindex
     */
    GetColumnIndex(fResultColumn, strColumnName, pColumnIndex) {
        strColumnName := strColumnName is String ? BSTR.Alloc(strColumnName).Value : strColumnName

        result := ComCall(10, this, "int", fResultColumn, "ptr", strColumnName, "int*", pColumnIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cResultColumn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-icertview-setresultcolumncount
     */
    SetResultColumnCount(cResultColumn) {
        result := ComCall(11, this, "int", cResultColumn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ColumnIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-icertview-setresultcolumn
     */
    SetResultColumn(ColumnIndex) {
        result := ComCall(12, this, "int", ColumnIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ColumnIndex 
     * @param {Integer} SeekOperator 
     * @param {Integer} SortOrder 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-icertview-setrestriction
     */
    SetRestriction(ColumnIndex, SeekOperator, SortOrder, pvarValue) {
        result := ComCall(13, this, "int", ColumnIndex, "int", SeekOperator, "int", SortOrder, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumCERTVIEWROW>} ppenum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-icertview-openview
     */
    OpenView(ppenum) {
        result := ComCall(14, this, "ptr*", ppenum, "HRESULT")
        return result
    }
}
