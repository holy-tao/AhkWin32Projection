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
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-irelationship-name
     */
    Name() {
        result := ComCall(3, this, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-irelationship-isreal
     */
    IsReal() {
        result := ComCall(4, this, "int*", &pIsReal := 0, "HRESULT")
        return pIsReal
    }

    /**
     * 
     * @returns {IEntity} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-irelationship-destination
     */
    Destination() {
        result := ComCall(5, this, "ptr*", &pDestinationEntity := 0, "HRESULT")
        return IEntity(pDestinationEntity)
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-irelationship-metadata
     */
    MetaData(riid) {
        result := ComCall(6, this, "ptr", riid, "ptr*", &pMetaData := 0, "HRESULT")
        return pMetaData
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/structuredquery/nf-structuredquery-irelationship-defaultphrase
     */
    DefaultPhrase() {
        result := ComCall(7, this, "ptr*", &ppszPhrase := 0, "HRESULT")
        return ppszPhrase
    }
}
