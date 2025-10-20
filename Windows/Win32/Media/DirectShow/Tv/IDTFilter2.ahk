#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDTFilter.ahk

/**
 * The IDTFilter2 interface extends the IDTFilter interface and is exposed by the Decrypter/Detagger filter.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDTFilter2)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//encdec/nn-encdec-idtfilter2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDTFilter2 extends IDTFilter{
    /**
     * The interface identifier for IDTFilter2
     * @type {Guid}
     */
    static IID => Guid("{c4c4c4b4-0049-4e2b-98fb-9537f6ce516d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * 
     * @param {Pointer<BSTR>} pbstrChallengeUrl 
     * @returns {HRESULT} 
     */
    get_ChallengeUrl(pbstrChallengeUrl) {
        result := ComCall(11, this, "ptr", pbstrChallengeUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} protType 
     * @param {Pointer<Int32>} lpDateTime 
     * @returns {HRESULT} 
     */
    GetCurrLicenseExpDate(protType, lpDateTime) {
        result := ComCall(12, this, "int*", protType, "int*", lpDateTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GetLastErrorCode() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
