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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetProtectionType", "LicenseHasExpirationDate", "SetRights"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter3-getprotectiontype
     */
    GetProtectionType() {
        result := ComCall(14, this, "int*", &pProtectionType := 0, "HRESULT")
        return pProtectionType
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter3-licensehasexpirationdate
     */
    LicenseHasExpirationDate() {
        result := ComCall(15, this, "int*", &pfLicenseHasExpirationDate := 0, "HRESULT")
        return pfLicenseHasExpirationDate
    }

    /**
     * 
     * @param {BSTR} bstrRights 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/encdec/nf-encdec-idtfilter3-setrights
     */
    SetRights(bstrRights) {
        bstrRights := bstrRights is String ? BSTR.Alloc(bstrRights).Value : bstrRights

        result := ComCall(16, this, "ptr", bstrRights, "HRESULT")
        return result
    }
}
