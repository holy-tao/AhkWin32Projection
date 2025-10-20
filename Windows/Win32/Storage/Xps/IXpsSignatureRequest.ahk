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
     * 
     * @param {Pointer<PWSTR>} intent 
     * @returns {HRESULT} 
     */
    GetIntent(intent) {
        result := ComCall(3, this, "ptr", intent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} intent 
     * @returns {HRESULT} 
     */
    SetIntent(intent) {
        intent := intent is String ? StrPtr(intent) : intent

        result := ComCall(4, this, "ptr", intent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} signerName 
     * @returns {HRESULT} 
     */
    GetRequestedSigner(signerName) {
        result := ComCall(5, this, "ptr", signerName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} signerName 
     * @returns {HRESULT} 
     */
    SetRequestedSigner(signerName) {
        signerName := signerName is String ? StrPtr(signerName) : signerName

        result := ComCall(6, this, "ptr", signerName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} dateString 
     * @returns {HRESULT} 
     */
    GetRequestSignByDate(dateString) {
        result := ComCall(7, this, "ptr", dateString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} dateString 
     * @returns {HRESULT} 
     */
    SetRequestSignByDate(dateString) {
        dateString := dateString is String ? StrPtr(dateString) : dateString

        result := ComCall(8, this, "ptr", dateString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} place 
     * @returns {HRESULT} 
     */
    GetSigningLocale(place) {
        result := ComCall(9, this, "ptr", place, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} place 
     * @returns {HRESULT} 
     */
    SetSigningLocale(place) {
        place := place is String ? StrPtr(place) : place

        result := ComCall(10, this, "ptr", place, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pageIndex 
     * @param {Pointer<IOpcPartUri>} pagePartName 
     * @param {Pointer<Single>} x 
     * @param {Pointer<Single>} y 
     * @returns {HRESULT} 
     */
    GetSpotLocation(pageIndex, pagePartName, x, y) {
        result := ComCall(11, this, "int*", pageIndex, "ptr", pagePartName, "float*", x, "float*", y, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pageIndex 
     * @param {Float} x 
     * @param {Float} y 
     * @returns {HRESULT} 
     */
    SetSpotLocation(pageIndex, x, y) {
        result := ComCall(12, this, "int", pageIndex, "float", x, "float", y, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} requestId 
     * @returns {HRESULT} 
     */
    GetRequestId(requestId) {
        result := ComCall(13, this, "ptr", requestId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IXpsSignature>} signature 
     * @returns {HRESULT} 
     */
    GetSignature(signature) {
        result := ComCall(14, this, "ptr", signature, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
