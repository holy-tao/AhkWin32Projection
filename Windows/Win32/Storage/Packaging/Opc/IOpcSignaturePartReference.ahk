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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPartName", "GetContentType", "GetDigestMethod", "GetDigestValue", "GetTransformMethod"]

    /**
     * 
     * @param {Pointer<IOpcPartUri>} partName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturepartreference-getpartname
     */
    GetPartName(partName) {
        result := ComCall(3, this, "ptr*", partName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} contentType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturepartreference-getcontenttype
     */
    GetContentType(contentType) {
        result := ComCall(4, this, "ptr", contentType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} digestMethod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturepartreference-getdigestmethod
     */
    GetDigestMethod(digestMethod) {
        result := ComCall(5, this, "ptr", digestMethod, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} digestValue 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturepartreference-getdigestvalue
     */
    GetDigestValue(digestValue, count) {
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr*", digestValue, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} transformMethod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturepartreference-gettransformmethod
     */
    GetTransformMethod(transformMethod) {
        transformMethodMarshal := transformMethod is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, transformMethodMarshal, transformMethod, "HRESULT")
        return result
    }
}
