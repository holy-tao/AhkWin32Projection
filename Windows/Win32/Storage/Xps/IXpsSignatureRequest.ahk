#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Accesses the components of a signature request.
 * @remarks
 * 
  * The <b>IXpsSignatureRequest</b> interface corresponds to a single <b>SignatureDefinition</b> element in the markup of the SignatureDefinitons part.
  * 
  * This <b>SignatureDefinition</b> element markup is described in section 10.2.2 of the <a href="https://www.ecma-international.org/activities/XML%20Paper%20Specification/XPS%20Standard%20WD%201.6.pdf">XML Paper Specification</a>. 
  * 
  * All signature requests are 
  * stored in a request collection of a signature block. They cannot exist independently from the <a href="https://docs.microsoft.com/windows/desktop/api/xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignatureblock">IXpsSignatureBlock</a> interface from which they were instantiated.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//xpsdigitalsignature/nn-xpsdigitalsignature-ixpssignaturerequest
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class IXpsSignatureRequest extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXpsSignatureRequest
     * @type {Guid}
     */
    static IID => Guid("{ac58950b-7208-4b2d-b2c4-951083d3b8eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIntent", "SetIntent", "GetRequestedSigner", "SetRequestedSigner", "GetRequestSignByDate", "SetRequestSignByDate", "GetSigningLocale", "SetSigningLocale", "GetSpotLocation", "SetSpotLocation", "GetRequestId", "GetSignature"]

    /**
     * 
     * @param {Pointer<PWSTR>} intent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-getintent
     */
    GetIntent(intent) {
        result := ComCall(3, this, "ptr", intent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} intent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-setintent
     */
    SetIntent(intent) {
        intent := intent is String ? StrPtr(intent) : intent

        result := ComCall(4, this, "ptr", intent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} signerName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-getrequestedsigner
     */
    GetRequestedSigner(signerName) {
        result := ComCall(5, this, "ptr", signerName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} signerName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-setrequestedsigner
     */
    SetRequestedSigner(signerName) {
        signerName := signerName is String ? StrPtr(signerName) : signerName

        result := ComCall(6, this, "ptr", signerName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} dateString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-getrequestsignbydate
     */
    GetRequestSignByDate(dateString) {
        result := ComCall(7, this, "ptr", dateString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} dateString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-setrequestsignbydate
     */
    SetRequestSignByDate(dateString) {
        dateString := dateString is String ? StrPtr(dateString) : dateString

        result := ComCall(8, this, "ptr", dateString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} place 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-getsigninglocale
     */
    GetSigningLocale(place) {
        result := ComCall(9, this, "ptr", place, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} place 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-setsigninglocale
     */
    SetSigningLocale(place) {
        place := place is String ? StrPtr(place) : place

        result := ComCall(10, this, "ptr", place, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pageIndex 
     * @param {Pointer<IOpcPartUri>} pagePartName 
     * @param {Pointer<Float>} x 
     * @param {Pointer<Float>} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-getspotlocation
     */
    GetSpotLocation(pageIndex, pagePartName, x, y) {
        result := ComCall(11, this, "int*", pageIndex, "ptr*", pagePartName, "float*", x, "float*", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pageIndex 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-setspotlocation
     */
    SetSpotLocation(pageIndex, x, y) {
        result := ComCall(12, this, "int", pageIndex, "float", x, "float", y, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} requestId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-getrequestid
     */
    GetRequestId(requestId) {
        result := ComCall(13, this, "ptr", requestId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IXpsSignature>} signature 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/xpsdigitalsignature/nf-xpsdigitalsignature-ixpssignaturerequest-getsignature
     */
    GetSignature(signature) {
        result := ComCall(14, this, "ptr*", signature, "HRESULT")
        return result
    }
}
