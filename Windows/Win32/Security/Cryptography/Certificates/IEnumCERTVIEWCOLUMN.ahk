#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents a column-enumeration sequence that contains the column data for the current row of the enumeration sequence.
 * @see https://docs.microsoft.com/windows/win32/api//certview/nn-certview-ienumcertviewcolumn
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IEnumCERTVIEWCOLUMN extends IDispatch{
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
     * 
     * @param {Pointer<Int32>} pIndex 
     * @returns {HRESULT} 
     */
    Next(pIndex) {
        result := ComCall(7, this, "int*", pIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstrOut 
     * @returns {HRESULT} 
     */
    GetName(pstrOut) {
        result := ComCall(8, this, "ptr", pstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstrOut 
     * @returns {HRESULT} 
     */
    GetDisplayName(pstrOut) {
        result := ComCall(9, this, "ptr", pstrOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pType 
     * @returns {HRESULT} 
     */
    GetType(pType) {
        result := ComCall(10, this, "int*", pType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pIndexed 
     * @returns {HRESULT} 
     */
    IsIndexed(pIndexed) {
        result := ComCall(11, this, "int*", pIndexed, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pMaxLength 
     * @returns {HRESULT} 
     */
    GetMaxLength(pMaxLength) {
        result := ComCall(12, this, "int*", pMaxLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     */
    GetValue(Flags, pvarValue) {
        result := ComCall(13, this, "int", Flags, "ptr", pvarValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     */
    Skip(celt) {
        result := ComCall(14, this, "int", celt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumCERTVIEWCOLUMN>} ppenum 
     * @returns {HRESULT} 
     */
    Clone(ppenum) {
        result := ComCall(16, this, "ptr", ppenum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
