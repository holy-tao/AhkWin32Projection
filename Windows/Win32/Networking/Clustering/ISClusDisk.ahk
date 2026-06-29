#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ISClusPartitions.ahk" { ISClusPartitions }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISClusScsiAddress.ahk" { ISClusScsiAddress }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct ISClusDisk extends IDispatch {
    /**
     * The interface identifier for ISClusDisk
     * @type {Guid}
     */
    static IID := Guid("{f2e60724-2631-11d1-89f1-00a0c90d061e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISClusDisk interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Signature   : IntPtr
        get_ScsiAddress : IntPtr
        get_DiskNumber  : IntPtr
        get_Partitions  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISClusDisk.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Signature {
        get => this.get_Signature()
    }

    /**
     * @type {ISClusScsiAddress} 
     */
    ScsiAddress {
        get => this.get_ScsiAddress()
    }

    /**
     * @type {Integer} 
     */
    DiskNumber {
        get => this.get_DiskNumber()
    }

    /**
     * @type {ISClusPartitions} 
     */
    Partitions {
        get => this.get_Partitions()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Signature() {
        result := ComCall(7, this, "int*", &plSignature := 0, "HRESULT")
        return plSignature
    }

    /**
     * 
     * @returns {ISClusScsiAddress} 
     */
    get_ScsiAddress() {
        result := ComCall(8, this, "ptr*", &ppScsiAddress := 0, "HRESULT")
        return ISClusScsiAddress(ppScsiAddress)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DiskNumber() {
        result := ComCall(9, this, "int*", &plDiskNumber := 0, "HRESULT")
        return plDiskNumber
    }

    /**
     * 
     * @returns {ISClusPartitions} 
     */
    get_Partitions() {
        result := ComCall(10, this, "ptr*", &ppPartitions := 0, "HRESULT")
        return ISClusPartitions(ppPartitions)
    }

    Query(iid) {
        if (ISClusDisk.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Signature := CallbackCreate(GetMethod(implObj, "get_Signature"), flags, 2)
        this.vtbl.get_ScsiAddress := CallbackCreate(GetMethod(implObj, "get_ScsiAddress"), flags, 2)
        this.vtbl.get_DiskNumber := CallbackCreate(GetMethod(implObj, "get_DiskNumber"), flags, 2)
        this.vtbl.get_Partitions := CallbackCreate(GetMethod(implObj, "get_Partitions"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Signature)
        CallbackFree(this.vtbl.get_ScsiAddress)
        CallbackFree(this.vtbl.get_DiskNumber)
        CallbackFree(this.vtbl.get_Partitions)
    }
}
