#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IDTFilter2.ahk

/**
 * The IDTFilter3 interface extends the IDTFilter2 interface and is exposed by the Decrypter/Detagger filter.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDTFilter3)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//encdec/nn-encdec-idtfilter3
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDTFilter3 extends IDTFilter2{
    /**
     * The interface identifier for IDTFilter3
     * @type {Guid}
     */
    static IID => Guid("{513998cc-e929-4cdf-9fbd-bad1e0314866}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * 
     * @param {Pointer<Int32>} pProtectionType 
     * @returns {HRESULT} 
     */
    GetProtectionType(pProtectionType) {
        result := ComCall(14, this, "int*", pProtectionType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfLicenseHasExpirationDate 
     * @returns {HRESULT} 
     */
    LicenseHasExpirationDate(pfLicenseHasExpirationDate) {
        result := ComCall(15, this, "ptr", pfLicenseHasExpirationDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrRights 
     * @returns {HRESULT} 
     */
    SetRights(bstrRights) {
        bstrRights := bstrRights is String ? BSTR.Alloc(bstrRights).Value : bstrRights

        result := ComCall(16, this, "ptr", bstrRights, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
