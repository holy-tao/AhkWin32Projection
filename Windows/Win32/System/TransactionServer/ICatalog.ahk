#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.TransactionServer
 * @version v4.0.30319
 */
class ICatalog extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICatalog
     * @type {Guid}
     */
    static IID => Guid("{6eb22870-8a19-11d0-81b6-00a0c9231c29}")

    /**
     * The class identifier for Catalog
     * @type {Guid}
     */
    static CLSID => Guid("{6eb22881-8a19-11d0-81b6-00a0c9231c29}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCollection", "Connect", "get_MajorVersion", "get_MinorVersion"]

    /**
     * 
     * @param {BSTR} bstrCollName 
     * @returns {IDispatch} 
     */
    GetCollection(bstrCollName) {
        bstrCollName := bstrCollName is String ? BSTR.Alloc(bstrCollName).Value : bstrCollName

        result := ComCall(7, this, "ptr", bstrCollName, "ptr*", &ppCatalogCollection := 0, "HRESULT")
        return IDispatch(ppCatalogCollection)
    }

    /**
     * 
     * @param {BSTR} bstrConnectString 
     * @returns {IDispatch} 
     */
    Connect(bstrConnectString) {
        bstrConnectString := bstrConnectString is String ? BSTR.Alloc(bstrConnectString).Value : bstrConnectString

        result := ComCall(8, this, "ptr", bstrConnectString, "ptr*", &ppCatalogCollection := 0, "HRESULT")
        return IDispatch(ppCatalogCollection)
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_MajorVersion(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     */
    get_MinorVersion(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, retvalMarshal, retval, "HRESULT")
        return result
    }
}
