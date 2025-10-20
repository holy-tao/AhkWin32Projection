#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVssAdmin interface manages providers registered with VSS.
 * @see https://docs.microsoft.com/windows/win32/api//vsadmin/nn-vsadmin-ivssadmin
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssAdmin extends IUnknown{
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
     * 
     * @param {Pointer<Guid>} pProviderId 
     * @param {Pointer<Guid>} ClassId 
     * @param {Pointer<UInt16>} pwszProviderName 
     * @param {Integer} eProviderType 
     * @param {Pointer<UInt16>} pwszProviderVersion 
     * @param {Pointer<Guid>} ProviderVersionId 
     * @returns {HRESULT} 
     */
    RegisterProvider(pProviderId, ClassId, pwszProviderName, eProviderType, pwszProviderVersion, ProviderVersionId) {
        result := ComCall(3, this, "ptr", pProviderId, "ptr", ClassId, "ushort*", pwszProviderName, "int", eProviderType, "ushort*", pwszProviderVersion, "ptr", ProviderVersionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ProviderId 
     * @returns {HRESULT} 
     */
    UnregisterProvider(ProviderId) {
        result := ComCall(4, this, "ptr", ProviderId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVssEnumObject>} ppEnum 
     * @returns {HRESULT} 
     */
    QueryProviders(ppEnum) {
        result := ComCall(5, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AbortAllSnapshotsInProgress() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
