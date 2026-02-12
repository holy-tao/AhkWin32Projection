#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\StorageProviderQueryResultSet.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class IStorageProviderQueryResultSetFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageProviderQueryResultSetFactory
     * @type {Guid}
     */
    static IID => Guid("{301974c2-9b0a-51d1-84b5-32578ee3083d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateInstance"]

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {Integer} results_length 
     * @param {Pointer<IStorageProviderQueryResult>} results 
     * @returns {StorageProviderQueryResultSet} 
     * @see https://learn.microsoft.com/windows/win32/api//content/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(results_length, results) {
        result := ComCall(6, this, "uint", results_length, "ptr*", results, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageProviderQueryResultSet(value)
    }
}
