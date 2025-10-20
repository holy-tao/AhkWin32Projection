#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for creating and managing virtual disks.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsvdprovider
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsVdProvider extends IUnknown{
    /**
     * The interface identifier for IVdsVdProvider
     * @type {Guid}
     */
    static IID => Guid("{b481498c-8354-45f9-84a0-0bdd2832a91f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     */
    QueryVDisks(ppEnum) {
        result := ComCall(3, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VIRTUAL_STORAGE_TYPE>} VirtualDeviceType 
     * @param {PWSTR} pPath 
     * @param {PWSTR} pStringSecurityDescriptor 
     * @param {Integer} Flags 
     * @param {Integer} ProviderSpecificFlags 
     * @param {Integer} Reserved 
     * @param {Pointer<VDS_CREATE_VDISK_PARAMETERS>} pCreateDiskParameters 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     */
    CreateVDisk(VirtualDeviceType, pPath, pStringSecurityDescriptor, Flags, ProviderSpecificFlags, Reserved, pCreateDiskParameters, ppAsync) {
        pPath := pPath is String ? StrPtr(pPath) : pPath
        pStringSecurityDescriptor := pStringSecurityDescriptor is String ? StrPtr(pStringSecurityDescriptor) : pStringSecurityDescriptor

        result := ComCall(4, this, "ptr", VirtualDeviceType, "ptr", pPath, "ptr", pStringSecurityDescriptor, "int", Flags, "uint", ProviderSpecificFlags, "uint", Reserved, "ptr", pCreateDiskParameters, "ptr", ppAsync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VIRTUAL_STORAGE_TYPE>} VirtualDeviceType 
     * @param {PWSTR} pPath 
     * @param {Pointer<IVdsVDisk>} ppVDisk 
     * @returns {HRESULT} 
     */
    AddVDisk(VirtualDeviceType, pPath, ppVDisk) {
        pPath := pPath is String ? StrPtr(pPath) : pPath

        result := ComCall(5, this, "ptr", VirtualDeviceType, "ptr", pPath, "ptr", ppVDisk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVdsVDisk>} pVDisk 
     * @param {Pointer<IVdsDisk>} ppDisk 
     * @returns {HRESULT} 
     */
    GetDiskFromVDisk(pVDisk, ppDisk) {
        result := ComCall(6, this, "ptr", pVDisk, "ptr", ppDisk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVdsDisk>} pDisk 
     * @param {Pointer<IVdsVDisk>} ppVDisk 
     * @returns {HRESULT} 
     */
    GetVDiskFromDisk(pDisk, ppVDisk) {
        result := ComCall(7, this, "ptr", pDisk, "ptr", ppVDisk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
