#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEntity.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods for retrieving information about a schema property.
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nn-structuredquery-irelationship
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRelationship extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRelationship
     * @type {Guid}
     */
    static IID => Guid("{2769280b-5108-498c-9c7f-a51239b63147}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Name", "IsReal", "Destination", "MetaData", "DefaultPhrase"]

    /**
     * Retrieves the name of the relationship.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to the name of the relationship as a Unicode string. The calling application must free the returned string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-irelationship-name
     */
    Name() {
        result := ComCall(3, this, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * Reports whether a relationship is real.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Receives <b>TRUE</b> for a real relationship; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-irelationship-isreal
     */
    IsReal() {
        result := ComCall(4, this, "int*", &pIsReal := 0, "HRESULT")
        return pIsReal
    }

    /**
     * Retrieves the destination IEntity object of the relationship. The destination of a relationshipo corresponds to the type of a property.
     * @returns {IEntity} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ientity">IEntity</a>**</b>
     * 
     * Receives the address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-ientity">IEntity</a> object, or <b>NULL</b> if the relationship is not real. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nf-structuredquery-irelationship-isreal">IRelationship::IsReal</a>.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-irelationship-destination
     */
    Destination() {
        result := ComCall(5, this, "ptr*", &pDestinationEntity := 0, "HRESULT")
        return IEntity(pDestinationEntity)
    }

    /**
     * Retrieves an enumeration of IMetaData objects for this relationship.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The desired IID of the result, either IID_IEnumUnknown or IID_IEnumVARIANT.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * Receives a pointer to the enumeration of <a href="https://docs.microsoft.com/windows/desktop/api/structuredquery/nn-structuredquery-imetadata">IMetaData</a> objects. There may be multiple pairs with the same key (or the same value).
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-irelationship-metadata
     */
    MetaData(riid) {
        result := ComCall(6, this, "ptr", riid, "ptr*", &pMetaData := 0, "HRESULT")
        return pMetaData
    }

    /**
     * Retrieves the default phrase to use for this relationship in restatements.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives the default phrase as a Unicode string. The calling application must free the string by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nf-structuredquery-irelationship-defaultphrase
     */
    DefaultPhrase() {
        result := ComCall(7, this, "ptr*", &ppszPhrase := 0, "HRESULT")
        return ppszPhrase
    }
}
