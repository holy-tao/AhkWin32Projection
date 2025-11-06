#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVdsOpenVDisk.ahk
#Include .\VDS_VDISK_PROPERTIES.ahk
#Include .\IVdsVolume.ahk
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
     * @returns {IVdsOpenVDisk} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvdisk-open
     */
    Open(AccessMask, Flags, ReadWriteDepth) {
        result := ComCall(3, this, "int", AccessMask, "int", Flags, "uint", ReadWriteDepth, "ptr*", &ppOpenVDisk := 0, "HRESULT")
        return IVdsOpenVDisk(ppOpenVDisk)
    }

    /**
     * 
     * @returns {VDS_VDISK_PROPERTIES} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvdisk-getproperties
     */
    GetProperties() {
        pDiskProperties := VDS_VDISK_PROPERTIES()
        result := ComCall(4, this, "ptr", pDiskProperties, "HRESULT")
        return pDiskProperties
    }

    /**
     * 
     * @returns {IVdsVolume} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvdisk-gethostvolume
     */
    GetHostVolume() {
        result := ComCall(5, this, "ptr*", &ppVolume := 0, "HRESULT")
        return IVdsVolume(ppVolume)
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvdisk-getdevicename
     */
    GetDeviceName() {
        result := ComCall(6, this, "ptr*", &ppDeviceName := 0, "HRESULT")
        return ppDeviceName
    }
}
