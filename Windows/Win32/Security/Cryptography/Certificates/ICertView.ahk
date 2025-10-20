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
     * 
     * @param {BSTR} strConfig 
     * @returns {HRESULT} 
     */
    OpenConnection(strConfig) {
        strConfig := strConfig is String ? BSTR.Alloc(strConfig).Value : strConfig

        result := ComCall(7, this, "ptr", strConfig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fResultColumn 
     * @param {Pointer<IEnumCERTVIEWCOLUMN>} ppenum 
     * @returns {HRESULT} 
     */
    EnumCertViewColumn(fResultColumn, ppenum) {
        result := ComCall(8, this, "int", fResultColumn, "ptr", ppenum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fResultColumn 
     * @param {Pointer<Int32>} pcColumn 
     * @returns {HRESULT} 
     */
    GetColumnCount(fResultColumn, pcColumn) {
        result := ComCall(9, this, "int", fResultColumn, "int*", pcColumn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} fResultColumn 
     * @param {BSTR} strColumnName 
     * @param {Pointer<Int32>} pColumnIndex 
     * @returns {HRESULT} 
     */
    GetColumnIndex(fResultColumn, strColumnName, pColumnIndex) {
        strColumnName := strColumnName is String ? BSTR.Alloc(strColumnName).Value : strColumnName

        result := ComCall(10, this, "int", fResultColumn, "ptr", strColumnName, "int*", pColumnIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cResultColumn 
     * @returns {HRESULT} 
     */
    SetResultColumnCount(cResultColumn) {
        result := ComCall(11, this, "int", cResultColumn, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ColumnIndex 
     * @returns {HRESULT} 
     */
    SetResultColumn(ColumnIndex) {
        result := ComCall(12, this, "int", ColumnIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ColumnIndex 
     * @param {Integer} SeekOperator 
     * @param {Integer} SortOrder 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     */
    SetRestriction(ColumnIndex, SeekOperator, SortOrder, pvarValue) {
        result := ComCall(13, this, "int", ColumnIndex, "int", SeekOperator, "int", SortOrder, "ptr", pvarValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumCERTVIEWROW>} ppenum 
     * @returns {HRESULT} 
     */
    OpenView(ppenum) {
        result := ComCall(14, this, "ptr", ppenum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
