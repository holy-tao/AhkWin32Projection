#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBindResource.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IScopedOperations extends IBindResource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IScopedOperations
     * @type {Guid}
     */
    static IID => Guid("{0c733ab0-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Copy", "Move", "Delete", "OpenRowset"]

    /**
     * 
     * @param {Pointer} cRows 
     * @param {Pointer<PWSTR>} rgpwszSourceURLs 
     * @param {Pointer<PWSTR>} rgpwszDestURLs 
     * @param {Integer} dwCopyFlags 
     * @param {IAuthenticate} pAuthenticate 
     * @param {Pointer<Integer>} rgdwStatus 
     * @param {Pointer<PWSTR>} rgpwszNewURLs 
     * @param {Pointer<Pointer<Integer>>} ppStringsBuffer 
     * @returns {HRESULT} 
     */
    Copy(cRows, rgpwszSourceURLs, rgpwszDestURLs, dwCopyFlags, pAuthenticate, rgdwStatus, rgpwszNewURLs, ppStringsBuffer) {
        rgdwStatusMarshal := rgdwStatus is VarRef ? "uint*" : "ptr"
        ppStringsBufferMarshal := ppStringsBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", cRows, "ptr", rgpwszSourceURLs, "ptr", rgpwszDestURLs, "uint", dwCopyFlags, "ptr", pAuthenticate, rgdwStatusMarshal, rgdwStatus, "ptr", rgpwszNewURLs, ppStringsBufferMarshal, ppStringsBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} cRows 
     * @param {Pointer<PWSTR>} rgpwszSourceURLs 
     * @param {Pointer<PWSTR>} rgpwszDestURLs 
     * @param {Integer} dwMoveFlags 
     * @param {IAuthenticate} pAuthenticate 
     * @param {Pointer<Integer>} rgdwStatus 
     * @param {Pointer<PWSTR>} rgpwszNewURLs 
     * @param {Pointer<Pointer<Integer>>} ppStringsBuffer 
     * @returns {HRESULT} 
     */
    Move(cRows, rgpwszSourceURLs, rgpwszDestURLs, dwMoveFlags, pAuthenticate, rgdwStatus, rgpwszNewURLs, ppStringsBuffer) {
        rgdwStatusMarshal := rgdwStatus is VarRef ? "uint*" : "ptr"
        ppStringsBufferMarshal := ppStringsBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", cRows, "ptr", rgpwszSourceURLs, "ptr", rgpwszDestURLs, "uint", dwMoveFlags, "ptr", pAuthenticate, rgdwStatusMarshal, rgdwStatus, "ptr", rgpwszNewURLs, ppStringsBufferMarshal, ppStringsBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} cRows 
     * @param {Pointer<PWSTR>} rgpwszURLs 
     * @param {Integer} dwDeleteFlags 
     * @param {Pointer<Integer>} rgdwStatus 
     * @returns {HRESULT} 
     */
    Delete(cRows, rgpwszURLs, dwDeleteFlags, rgdwStatus) {
        rgdwStatusMarshal := rgdwStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", cRows, "ptr", rgpwszURLs, "uint", dwDeleteFlags, rgdwStatusMarshal, rgdwStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Pointer<DBID>} pTableID 
     * @param {Pointer<DBID>} pIndexID 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @param {Pointer<IUnknown>} ppRowset 
     * @returns {HRESULT} 
     */
    OpenRowset(pUnkOuter, pTableID, pIndexID, riid, cPropertySets, rgPropertySets, ppRowset) {
        result := ComCall(7, this, "ptr", pUnkOuter, "ptr", pTableID, "ptr", pIndexID, "ptr", riid, "uint", cPropertySets, "ptr", rgPropertySets, "ptr*", ppRowset, "HRESULT")
        return result
    }
}
