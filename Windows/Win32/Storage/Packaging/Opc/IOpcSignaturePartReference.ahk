#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents a reference to a part that has been or will be signed.
 * @remarks
 * 
  * Only parts that can be represented by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcpart">IOpcPart</a> interface can be referenced by an <b>IOpcSignaturePartReference</b> interface pointer. Relationships parts are referenced for signing  by a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nn-msopc-iopcsignaturerelationshipreference">IOpcSignatureRelationshipReference</a> interface. To create an <b>IOpcSignatureRelationshipReference</b> interface pointer, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceset-create">IOpcSignatureRelationshipReferenceSet::Create</a> method.
  * 
  * To create 
  * 				an <b>IOpcSignaturePartReference</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturepartreferenceset-create">IOpcSignaturePartReferenceSet::Create</a> method.
  * 
  * To access an <b>IOpcSignaturePartReference</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturepartreferenceenumerator-getcurrent">IOpcSignaturePartReferenceEnumerator::GetCurrent</a> method.
  * 
  * The interface provides methods to access information about the referenced part and the reference itself. When a signature is generated, this reference information is serialized in the XML markup of the signature (signature markup).  In signature markup, the information is represented by a  <b>Reference</b> element that has its <b>URI</b> attribute value set to the part name of the referenced part.
  * 
  * The following markup shows that these <b>Reference</b> elements are children of the <b>Manifest</b> element in signature markup.
  * 
  * 
  * ```xml
  * // Signature XML markup
  * <Signature>
  * 	[...]
  * 	// Package-specific <Object>
  * 	<Object Id="idPackageObject">
  * 		// This <Manifest> element contains only one signed part. 
  * 		<Manifest>
  * 			// A reference to a signed part.
  * 			<Reference URI="aPartName">
  * 				[...]
  * 			</Reference>
  * 		</Manifest>
  * 		[...]
  * 	</Object>
  * 	[...]
  * </Signature>
  * ```
  * 
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcsignaturepartreference
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcSignaturePartReference extends IUnknown{
    /**
     * The interface identifier for IOpcSignaturePartReference
     * @type {Guid}
     */
    static IID => Guid("{e24231ca-59f4-484e-b64b-36eeda36072c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IOpcPartUri>} partName 
     * @returns {HRESULT} 
     */
    GetPartName(partName) {
        result := ComCall(3, this, "ptr", partName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} contentType 
     * @returns {HRESULT} 
     */
    GetContentType(contentType) {
        result := ComCall(4, this, "ptr", contentType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} digestMethod 
     * @returns {HRESULT} 
     */
    GetDigestMethod(digestMethod) {
        result := ComCall(5, this, "ptr", digestMethod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} digestValue 
     * @param {Pointer<UInt32>} count 
     * @returns {HRESULT} 
     */
    GetDigestValue(digestValue, count) {
        result := ComCall(6, this, "char*", digestValue, "uint*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} transformMethod 
     * @returns {HRESULT} 
     */
    GetTransformMethod(transformMethod) {
        result := ComCall(7, this, "int*", transformMethod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
