#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVssEnumObject.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVssAdmin interface manages providers registered with VSS.
 * @see https://docs.microsoft.com/windows/win32/api//vsadmin/nn-vsadmin-ivssadmin
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssAdmin extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVssAdmin
     * @type {Guid}
     */
    static IID => Guid("{77ed5996-2f63-11d3-8a39-00c04f72d8e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterProvider", "UnregisterProvider", "QueryProviders", "AbortAllSnapshotsInProgress"]

    /**
     * 
     * @param {Guid} pProviderId 
     * @param {Guid} ClassId 
     * @param {Pointer<Integer>} pwszProviderName 
     * @param {Integer} eProviderType 
     * @param {Pointer<Integer>} pwszProviderVersion 
     * @param {Guid} ProviderVersionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsadmin/nf-vsadmin-ivssadmin-registerprovider
     */
    RegisterProvider(pProviderId, ClassId, pwszProviderName, eProviderType, pwszProviderVersion, ProviderVersionId) {
        pwszProviderNameMarshal := pwszProviderName is VarRef ? "ushort*" : "ptr"
        pwszProviderVersionMarshal := pwszProviderVersion is VarRef ? "ushort*" : "ptr"

        result := ComCall(3, this, "ptr", pProviderId, "ptr", ClassId, pwszProviderNameMarshal, pwszProviderName, "int", eProviderType, pwszProviderVersionMarshal, pwszProviderVersion, "ptr", ProviderVersionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} ProviderId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsadmin/nf-vsadmin-ivssadmin-unregisterprovider
     */
    UnregisterProvider(ProviderId) {
        result := ComCall(4, this, "ptr", ProviderId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IVssEnumObject} 
     * @see https://learn.microsoft.com/windows/win32/api/vsadmin/nf-vsadmin-ivssadmin-queryproviders
     */
    QueryProviders() {
        result := ComCall(5, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IVssEnumObject(ppEnum)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vsadmin/nf-vsadmin-ivssadmin-abortallsnapshotsinprogress
     */
    AbortAllSnapshotsInProgress() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
