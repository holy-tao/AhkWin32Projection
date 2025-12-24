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
     * Opens a handle to the specified virtual disk file and returns an IVdsOpenVDisk interface pointer to the object that represents the opened handle.
     * @param {Integer} AccessMask A bitmask of <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-virtual_disk_access_mask-r1">VIRTUAL_DISK_ACCESS_MASK</a> flags specifying the access rights to be applied to the opened virtual disk.
     * @param {Integer} Flags A bitmask of <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-open_virtual_disk_flag">OPEN_VIRTUAL_DISK_FLAG</a> flags specifying how the virtual disk is to be opened.
     * @param {Integer} ReadWriteDepth The number of stores (backing files), beginning with the child, of the backing store chain to open read/write. The remaining stores in the differencing chain will be opened read-only. (This is necessary for merge operations to succeed.)
     * @returns {IVdsOpenVDisk} A pointer to a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdsopenvdisk">IVdsOpenVDisk</a> interface pointer to the newly created object that represents the handle opened to the virtual disk object. Callers must release the interface pointer when it is no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvdisk-open
     */
    Open(AccessMask, Flags, ReadWriteDepth) {
        result := ComCall(3, this, "int", AccessMask, "int", Flags, "uint", ReadWriteDepth, "ptr*", &ppOpenVDisk := 0, "HRESULT")
        return IVdsOpenVDisk(ppOpenVDisk)
    }

    /**
     * Returns disk property information for the volume where the virtual disk resides.
     * @returns {VDS_VDISK_PROPERTIES} Receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_vdisk_properties">VDS_VDISK_PROPERTIES</a> structure containing the disk property information.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvdisk-getproperties
     */
    GetProperties() {
        pDiskProperties := VDS_VDISK_PROPERTIES()
        result := ComCall(4, this, "ptr", pDiskProperties, "HRESULT")
        return pDiskProperties
    }

    /**
     * Returns an interface pointer to the volume object for the volume where the virtual disk resides.
     * @returns {IVdsVolume} A pointer to a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdsvolume">IVdsVolume</a> interface pointer for the volume. Callers must release the interface pointer when it is no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvdisk-gethostvolume
     */
    GetHostVolume() {
        result := ComCall(5, this, "ptr*", &ppVolume := 0, "HRESULT")
        return IVdsVolume(ppVolume)
    }

    /**
     * Returns the device name for the volume where the virtual disk resides.
     * @returns {PWSTR} A pointer to a variable that receives a string that contains the device name for the volume.
     * @see https://docs.microsoft.com/windows/win32/api//vds/nf-vds-ivdsvdisk-getdevicename
     */
    GetDeviceName() {
        result := ComCall(6, this, "ptr*", &ppDeviceName := 0, "HRESULT")
        return ppDeviceName
    }
}
