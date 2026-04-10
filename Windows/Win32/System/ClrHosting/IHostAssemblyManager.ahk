#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk
#Include .\ICLRAssemblyReferenceList.ahk
#Include .\IHostAssemblyStore.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
class IHostAssemblyManager extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostAssemblyManager
     * @type {Guid}
     */
    static IID => Guid("{613dabd7-62b2-493e-9e65-c1e32a1e0c5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNonHostStoreAssemblies", "GetAssemblyStore"]

    /**
     * 
     * @returns {ICLRAssemblyReferenceList} 
     */
    GetNonHostStoreAssemblies() {
        result := ComCall(3, this, "ptr*", &ppReferenceList := 0, "HRESULT")
        return ICLRAssemblyReferenceList(ppReferenceList)
    }

    /**
     * 
     * @returns {IHostAssemblyStore} 
     */
    GetAssemblyStore() {
        result := ComCall(4, this, "ptr*", &ppAssemblyStore := 0, "HRESULT")
        return IHostAssemblyStore(ppAssemblyStore)
    }
}
