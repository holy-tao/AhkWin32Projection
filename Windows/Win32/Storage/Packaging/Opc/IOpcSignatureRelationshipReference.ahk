#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents a reference to a Relationships part that contains relationships that have been or will be signed.
 * @remarks
 * 
  *  To create an  <b>IOpcSignatureRelationshipReference</b> interface pointer that represents a reference to a Relationships part, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceset-create">Create</a> method. This reference will indicate whether  all or a subset of the  relationships in the Relationships part will be signed when the signature is generated.
  * 
  * To access an <b>IOpcSignatureRelationshipReference</b> interface pointer, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturerelationshipreferenceenumerator-getcurrent">IOpcSignatureRelationshipReferenceEnumerator::GetCurrent</a> method.
  * 
  *  Relationships that are not selected for signing can be removed, modified or added to  the package without invalidating the signature. If a subset of relationships has been selected for signing and the subset is altered, the signature will be invalidated.<div class="alert"><b>Important</b>  A selected subset could be altered if the relationship type of a relationship that is added to or modified in a referenced Relationships part matches a relationship type that was used to select one or more relationships in the subset.</div>
  * <div> </div>
  * 
  * 
  * The interface provides methods to access information about the referenced Relationships part, the selected relationships that have been or will be signed,  and the reference itself. When a signature is generated, this reference information is serialized in the XML markup of the signature (signature markup).  In signature markup, the information is represented by a  <b>Reference</b> element that has a <b>URI</b> attribute value that identifies a Relationships part.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcsignaturerelationshipreference
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcSignatureRelationshipReference extends IUnknown{
    /**
     * The interface identifier for IOpcSignatureRelationshipReference
     * @type {Guid}
     */
    static IID => Guid("{57babac6-9d4a-4e50-8b86-e5d4051eae7c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IOpcUri>} sourceUri 
     * @returns {HRESULT} 
     */
    GetSourceUri(sourceUri) {
        result := ComCall(3, this, "ptr", sourceUri, "int")
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
        result := ComCall(4, this, "ptr", digestMethod, "int")
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
        result := ComCall(5, this, "char*", digestValue, "uint*", count, "int")
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
        result := ComCall(6, this, "int*", transformMethod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} relationshipSigningOption 
     * @returns {HRESULT} 
     */
    GetRelationshipSigningOption(relationshipSigningOption) {
        result := ComCall(7, this, "int*", relationshipSigningOption, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcRelationshipSelectorEnumerator>} selectorEnumerator 
     * @returns {HRESULT} 
     */
    GetRelationshipSelectorEnumerator(selectorEnumerator) {
        result := ComCall(8, this, "ptr", selectorEnumerator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
