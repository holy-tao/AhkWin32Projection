#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISClusPartition.ahk" { ISClusPartition }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Provides extended information about a partition on a Physical Disk resource.
 * @see https://learn.microsoft.com/windows/win32/api/msclus/nn-msclus-iscluspartitionex
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct ISClusPartitionEx extends ISClusPartition {
    /**
     * The interface identifier for ISClusPartitionEx
     * @type {Guid}
     */
    static IID := Guid("{8802d4fe-b32e-4ad1-9dbd-64f18e1166ce}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISClusPartitionEx interfaces
    */
    struct Vtbl extends ISClusPartition.Vtbl {
        get_TotalSize       : IntPtr
        get_FreeSpace       : IntPtr
        get_DeviceNumber    : IntPtr
        get_PartitionNumber : IntPtr
        get_VolumeGuid      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISClusPartitionEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    TotalSize {
        get => this.get_TotalSize()
    }

    /**
     * @type {Integer} 
     */
    FreeSpace {
        get => this.get_FreeSpace()
    }

    /**
     * @type {Integer} 
     */
    DeviceNumber {
        get => this.get_DeviceNumber()
    }

    /**
     * @type {Integer} 
     */
    PartitionNumber {
        get => this.get_PartitionNumber()
    }

    /**
     * @type {BSTR} 
     */
    VolumeGuid {
        get => this.get_VolumeGuid()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TotalSize() {
        result := ComCall(14, this, "int*", &plTotalSize := 0, "HRESULT")
        return plTotalSize
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FreeSpace() {
        result := ComCall(15, this, "int*", &plFreeSpace := 0, "HRESULT")
        return plFreeSpace
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DeviceNumber() {
        result := ComCall(16, this, "int*", &plDeviceNumber := 0, "HRESULT")
        return plDeviceNumber
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PartitionNumber() {
        result := ComCall(17, this, "int*", &plPartitionNumber := 0, "HRESULT")
        return plPartitionNumber
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_VolumeGuid() {
        pbstrVolumeGuid := BSTR.Owned()
        result := ComCall(18, this, BSTR.Ptr, pbstrVolumeGuid, "HRESULT")
        return pbstrVolumeGuid
    }

    Query(iid) {
        if (ISClusPartitionEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_TotalSize := CallbackCreate(GetMethod(implObj, "get_TotalSize"), flags, 2)
        this.vtbl.get_FreeSpace := CallbackCreate(GetMethod(implObj, "get_FreeSpace"), flags, 2)
        this.vtbl.get_DeviceNumber := CallbackCreate(GetMethod(implObj, "get_DeviceNumber"), flags, 2)
        this.vtbl.get_PartitionNumber := CallbackCreate(GetMethod(implObj, "get_PartitionNumber"), flags, 2)
        this.vtbl.get_VolumeGuid := CallbackCreate(GetMethod(implObj, "get_VolumeGuid"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_TotalSize)
        CallbackFree(this.vtbl.get_FreeSpace)
        CallbackFree(this.vtbl.get_DeviceNumber)
        CallbackFree(this.vtbl.get_PartitionNumber)
        CallbackFree(this.vtbl.get_VolumeGuid)
    }
}
