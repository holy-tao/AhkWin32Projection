#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct ISClusPartition extends IDispatch {
    /**
     * The interface identifier for ISClusPartition
     * @type {Guid}
     */
    static IID := Guid("{f2e60720-2631-11d1-89f1-00a0c90d061e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISClusPartition interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Flags                  : IntPtr
        get_DeviceName             : IntPtr
        get_VolumeLabel            : IntPtr
        get_SerialNumber           : IntPtr
        get_MaximumComponentLength : IntPtr
        get_FileSystemFlags        : IntPtr
        get_FileSystem             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISClusPartition.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Flags {
        get => this.get_Flags()
    }

    /**
     * @type {BSTR} 
     */
    DeviceName {
        get => this.get_DeviceName()
    }

    /**
     * @type {BSTR} 
     */
    VolumeLabel {
        get => this.get_VolumeLabel()
    }

    /**
     * @type {Integer} 
     */
    SerialNumber {
        get => this.get_SerialNumber()
    }

    /**
     * @type {Integer} 
     */
    MaximumComponentLength {
        get => this.get_MaximumComponentLength()
    }

    /**
     * @type {Integer} 
     */
    FileSystemFlags {
        get => this.get_FileSystemFlags()
    }

    /**
     * @type {BSTR} 
     */
    FileSystem {
        get => this.get_FileSystem()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Flags() {
        result := ComCall(7, this, "int*", &plFlags := 0, "HRESULT")
        return plFlags
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DeviceName() {
        pbstrDeviceName := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrDeviceName, "HRESULT")
        return pbstrDeviceName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_VolumeLabel() {
        pbstrVolumeLabel := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrVolumeLabel, "HRESULT")
        return pbstrVolumeLabel
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SerialNumber() {
        result := ComCall(10, this, "int*", &plSerialNumber := 0, "HRESULT")
        return plSerialNumber
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaximumComponentLength() {
        result := ComCall(11, this, "int*", &plMaximumComponentLength := 0, "HRESULT")
        return plMaximumComponentLength
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FileSystemFlags() {
        result := ComCall(12, this, "int*", &plFileSystemFlags := 0, "HRESULT")
        return plFileSystemFlags
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_FileSystem() {
        pbstrFileSystem := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pbstrFileSystem, "HRESULT")
        return pbstrFileSystem
    }

    Query(iid) {
        if (ISClusPartition.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Flags := CallbackCreate(GetMethod(implObj, "get_Flags"), flags, 2)
        this.vtbl.get_DeviceName := CallbackCreate(GetMethod(implObj, "get_DeviceName"), flags, 2)
        this.vtbl.get_VolumeLabel := CallbackCreate(GetMethod(implObj, "get_VolumeLabel"), flags, 2)
        this.vtbl.get_SerialNumber := CallbackCreate(GetMethod(implObj, "get_SerialNumber"), flags, 2)
        this.vtbl.get_MaximumComponentLength := CallbackCreate(GetMethod(implObj, "get_MaximumComponentLength"), flags, 2)
        this.vtbl.get_FileSystemFlags := CallbackCreate(GetMethod(implObj, "get_FileSystemFlags"), flags, 2)
        this.vtbl.get_FileSystem := CallbackCreate(GetMethod(implObj, "get_FileSystem"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Flags)
        CallbackFree(this.vtbl.get_DeviceName)
        CallbackFree(this.vtbl.get_VolumeLabel)
        CallbackFree(this.vtbl.get_SerialNumber)
        CallbackFree(this.vtbl.get_MaximumComponentLength)
        CallbackFree(this.vtbl.get_FileSystemFlags)
        CallbackFree(this.vtbl.get_FileSystem)
    }
}
