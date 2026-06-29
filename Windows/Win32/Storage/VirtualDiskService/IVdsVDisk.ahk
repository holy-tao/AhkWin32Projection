#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Vhd\VIRTUAL_DISK_ACCESS_MASK.ahk" { VIRTUAL_DISK_ACCESS_MASK }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IVdsOpenVDisk.ahk" { IVdsOpenVDisk }
#Import ".\IVdsVolume.ahk" { IVdsVolume }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Vhd\OPEN_VIRTUAL_DISK_FLAG.ahk" { OPEN_VIRTUAL_DISK_FLAG }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\VDS_VDISK_PROPERTIES.ahk" { VDS_VDISK_PROPERTIES }

/**
 * Defines methods for managing a virtual disk. (IVdsVDisk)
 * @see https://learn.microsoft.com/windows/win32/api/vds/nn-vds-ivdsvdisk
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsVDisk extends IUnknown {
    /**
     * The interface identifier for IVdsVDisk
     * @type {Guid}
     */
    static IID := Guid("{1e062b84-e5e6-4b4b-8a25-67b81e8f13e8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsVDisk interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Open          : IntPtr
        GetProperties : IntPtr
        GetHostVolume : IntPtr
        GetDeviceName : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsVDisk.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Opens a handle to the specified virtual disk file and returns an IVdsOpenVDisk interface pointer to the object that represents the opened handle.
     * @remarks
     * Applications must initialize process-wide security by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a> function. The <i>dwImpLevel</i> parameter should be set to <b>RPC_C_IMP_LEVEL_IMPERSONATE</b>.
     * 
     * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>These actions are not required until Windows 7 and Windows Server 2008 R2.
     * @param {VIRTUAL_DISK_ACCESS_MASK} AccessMask A bitmask of <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-virtual_disk_access_mask-r1">VIRTUAL_DISK_ACCESS_MASK</a> flags specifying the access rights to be applied to the opened virtual disk.
     * @param {OPEN_VIRTUAL_DISK_FLAG} Flags A bitmask of <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-open_virtual_disk_flag">OPEN_VIRTUAL_DISK_FLAG</a> flags specifying how the virtual disk is to be opened.
     * @param {Integer} ReadWriteDepth The number of stores (backing files), beginning with the child, of the backing store chain to open read/write. The remaining stores in the differencing chain will be opened read-only. (This is necessary for merge operations to succeed.)
     * @returns {IVdsOpenVDisk} A pointer to a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdsopenvdisk">IVdsOpenVDisk</a> interface pointer to the newly created object that represents the handle opened to the virtual disk object. Callers must release the interface pointer when it is no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvdisk-open
     */
    Open(AccessMask, Flags, ReadWriteDepth) {
        result := ComCall(3, this, VIRTUAL_DISK_ACCESS_MASK, AccessMask, OPEN_VIRTUAL_DISK_FLAG, Flags, "uint", ReadWriteDepth, "ptr*", &ppOpenVDisk := 0, "HRESULT")
        return IVdsOpenVDisk(ppOpenVDisk)
    }

    /**
     * Returns disk property information for the volume where the virtual disk resides.
     * @returns {VDS_VDISK_PROPERTIES} Receives a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_vdisk_properties">VDS_VDISK_PROPERTIES</a> structure containing the disk property information.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvdisk-getproperties
     */
    GetProperties() {
        pDiskProperties := VDS_VDISK_PROPERTIES()
        result := ComCall(4, this, VDS_VDISK_PROPERTIES.Ptr, pDiskProperties, "HRESULT")
        return pDiskProperties
    }

    /**
     * Returns an interface pointer to the volume object for the volume where the virtual disk resides.
     * @returns {IVdsVolume} A pointer to a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/vds/nn-vds-ivdsvolume">IVdsVolume</a> interface pointer for the volume. Callers must release the interface pointer when it is no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvdisk-gethostvolume
     */
    GetHostVolume() {
        result := ComCall(5, this, "ptr*", &ppVolume := 0, "HRESULT")
        return IVdsVolume(ppVolume)
    }

    /**
     * Returns the device name for the volume where the virtual disk resides.
     * @returns {PWSTR} A pointer to a variable that receives a string that contains the device name for the volume.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsvdisk-getdevicename
     */
    GetDeviceName() {
        result := ComCall(6, this, PWSTR.Ptr, &ppDeviceName := 0, "HRESULT")
        return ppDeviceName
    }

    Query(iid) {
        if (IVdsVDisk.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Open := CallbackCreate(GetMethod(implObj, "Open"), flags, 5)
        this.vtbl.GetProperties := CallbackCreate(GetMethod(implObj, "GetProperties"), flags, 2)
        this.vtbl.GetHostVolume := CallbackCreate(GetMethod(implObj, "GetHostVolume"), flags, 2)
        this.vtbl.GetDeviceName := CallbackCreate(GetMethod(implObj, "GetDeviceName"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Open)
        CallbackFree(this.vtbl.GetProperties)
        CallbackFree(this.vtbl.GetHostVolume)
        CallbackFree(this.vtbl.GetDeviceName)
    }
}
