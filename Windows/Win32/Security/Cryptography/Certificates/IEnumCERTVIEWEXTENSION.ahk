#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents an extension-enumeration sequence that contains the certificate extension data for the current row of the row-enumeration sequence.
 * @see https://docs.microsoft.com/windows/win32/api//certview/nn-certview-ienumcertviewextension
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IEnumCERTVIEWEXTENSION extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumCERTVIEWEXTENSION
     * @type {Guid}
     */
    static IID => Guid("{e7dd1466-7653-11d1-9bde-00c04fb683fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "GetName", "GetFlags", "GetValue", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Pointer<Integer>} pIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewextension-next
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
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewextension-getname
     */
    GetName(pstrOut) {
        result := ComCall(8, this, "ptr", pstrOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewextension-getflags
     */
    GetFlags(pFlags) {
        pFlagsMarshal := pFlags is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pFlagsMarshal, pFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Integer} Flags 
     * @param {Pointer<VARIANT>} pvarValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewextension-getvalue
     */
    GetValue(Type, Flags, pvarValue) {
        result := ComCall(10, this, "int", Type, "int", Flags, "ptr", pvarValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewextension-skip
     */
    Skip(celt) {
        result := ComCall(11, this, "int", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewextension-reset
     */
    Reset() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumCERTVIEWEXTENSION>} ppenum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certview/nf-certview-ienumcertviewextension-clone
     */
    Clone(ppenum) {
        result := ComCall(13, this, "ptr*", ppenum, "HRESULT")
        return result
    }
}
