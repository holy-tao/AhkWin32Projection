#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents a row-enumeration sequence that contains the data in the rows of the Certificate Services view, allowing further access to the columns, attributes, and extensions associated with each row.
 * @see https://docs.microsoft.com/windows/win32/api//certview/nn-certview-ienumcertviewrow
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IEnumCERTVIEWROW extends IDispatch{
    /**
     * The interface identifier for IEnumCERTVIEWROW
     * @type {Guid}
     */
    static IID => Guid("{d1157f4c-5af2-11d1-9bdc-00c04fb683fa}")

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
     * @param {Pointer<IEnumCERTVIEWCOLUMN>} ppenum 
     * @returns {HRESULT} 
     */
    EnumCertViewColumn(ppenum) {
        result := ComCall(8, this, "ptr", ppenum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<IEnumCERTVIEWATTRIBUTE>} ppenum 
     * @returns {HRESULT} 
     */
    EnumCertViewAttribute(Flags, ppenum) {
        result := ComCall(9, this, "int", Flags, "ptr", ppenum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<IEnumCERTVIEWEXTENSION>} ppenum 
     * @returns {HRESULT} 
     */
    EnumCertViewExtension(Flags, ppenum) {
        result := ComCall(10, this, "int", Flags, "ptr", ppenum, "int")
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
        result := ComCall(11, this, "int", celt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumCERTVIEWROW>} ppenum 
     * @returns {HRESULT} 
     */
    Clone(ppenum) {
        result := ComCall(13, this, "ptr", ppenum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pIndex 
     * @returns {HRESULT} 
     */
    GetMaxIndex(pIndex) {
        result := ComCall(14, this, "int*", pIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
