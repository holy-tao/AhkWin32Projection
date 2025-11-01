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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "GetProperties", "GetHostVolume", "GetDeviceName"]

    /**
     * 
     * @param {Integer} AccessMask 
     * @param {Integer} Flags 
     * @param {Integer} ReadWriteDepth 
     * @param {Pointer<IVdsOpenVDisk>} ppOpenVDisk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvdisk-open
     */
    Open(AccessMask, Flags, ReadWriteDepth, ppOpenVDisk) {
        result := ComCall(3, this, "int", AccessMask, "int", Flags, "uint", ReadWriteDepth, "ptr*", ppOpenVDisk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VDS_VDISK_PROPERTIES>} pDiskProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvdisk-getproperties
     */
    GetProperties(pDiskProperties) {
        result := ComCall(4, this, "ptr", pDiskProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IVdsVolume>} ppVolume 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvdisk-gethostvolume
     */
    GetHostVolume(ppVolume) {
        result := ComCall(5, this, "ptr*", ppVolume, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppDeviceName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvdisk-getdevicename
     */
    GetDeviceName(ppDeviceName) {
        result := ComCall(6, this, "ptr", ppDeviceName, "HRESULT")
        return result
    }
}
