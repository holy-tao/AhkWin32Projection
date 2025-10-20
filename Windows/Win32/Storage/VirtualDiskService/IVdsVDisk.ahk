#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for managing a virtual disk.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsvdisk
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsVDisk extends IUnknown{
    /**
     * The interface identifier for IVdsVDisk
     * @type {Guid}
     */
    static IID => Guid("{1e062b84-e5e6-4b4b-8a25-67b81e8f13e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} AccessMask 
     * @param {Integer} Flags 
     * @param {Integer} ReadWriteDepth 
     * @param {Pointer<IVdsOpenVDisk>} ppOpenVDisk 
     * @returns {HRESULT} 
     */
    Open(AccessMask, Flags, ReadWriteDepth, ppOpenVDisk) {
        result := ComCall(3, this, "int", AccessMask, "int", Flags, "uint", ReadWriteDepth, "ptr", ppOpenVDisk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VDS_VDISK_PROPERTIES>} pDiskProperties 
     * @returns {HRESULT} 
     */
    GetProperties(pDiskProperties) {
        result := ComCall(4, this, "ptr", pDiskProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVdsVolume>} ppVolume 
     * @returns {HRESULT} 
     */
    GetHostVolume(ppVolume) {
        result := ComCall(5, this, "ptr", ppVolume, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppDeviceName 
     * @returns {HRESULT} 
     */
    GetDeviceName(ppDeviceName) {
        result := ComCall(6, this, "ptr", ppDeviceName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
