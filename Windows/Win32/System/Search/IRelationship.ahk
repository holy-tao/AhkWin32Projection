#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods for retrieving information about a schema property.
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nn-structuredquery-irelationship
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRelationship extends IUnknown{
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
     * 
     * @param {Pointer<PWSTR>} ppszName 
     * @returns {HRESULT} 
     */
    Name(ppszName) {
        result := ComCall(3, this, "ptr", ppszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsReal 
     * @returns {HRESULT} 
     */
    IsReal(pIsReal) {
        result := ComCall(4, this, "ptr", pIsReal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEntity>} pDestinationEntity 
     * @returns {HRESULT} 
     */
    Destination(pDestinationEntity) {
        result := ComCall(5, this, "ptr", pDestinationEntity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} pMetaData 
     * @returns {HRESULT} 
     */
    MetaData(riid, pMetaData) {
        result := ComCall(6, this, "ptr", riid, "ptr", pMetaData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszPhrase 
     * @returns {HRESULT} 
     */
    DefaultPhrase(ppszPhrase) {
        result := ComCall(7, this, "ptr", ppszPhrase, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
