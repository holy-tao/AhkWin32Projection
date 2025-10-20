#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides a method for retrieving a key/value pair of strings from an IEntity, IRelationship or ISchemaProvider object.
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/nn-structuredquery-imetadata
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IMetaData extends IUnknown{
    /**
     * The interface identifier for IMetaData
     * @type {Guid}
     */
    static IID => Guid("{780102b0-c43b-4876-bc7b-5e9ba5c88794}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} ppszKey 
     * @param {Pointer<PWSTR>} ppszValue 
     * @returns {HRESULT} 
     */
    GetData(ppszKey, ppszValue) {
        result := ComCall(3, this, "ptr", ppszKey, "ptr", ppszValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
