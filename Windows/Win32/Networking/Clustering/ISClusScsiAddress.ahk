#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct ISClusScsiAddress extends IDispatch {
    /**
     * The interface identifier for ISClusScsiAddress
     * @type {Guid}
     */
    static IID := Guid("{f2e60728-2631-11d1-89f1-00a0c90d061e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISClusScsiAddress interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_PortNumber : IntPtr
        get_PathId     : IntPtr
        get_TargetId   : IntPtr
        get_Lun        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISClusScsiAddress.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT} 
     */
    PortNumber {
        get => this.get_PortNumber()
    }

    /**
     * @type {VARIANT} 
     */
    PathId {
        get => this.get_PathId()
    }

    /**
     * @type {VARIANT} 
     */
    TargetId {
        get => this.get_TargetId()
    }

    /**
     * @type {VARIANT} 
     */
    Lun {
        get => this.get_Lun()
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PortNumber() {
        pvarPortNumber := VARIANT()
        result := ComCall(7, this, VARIANT.Ptr, pvarPortNumber, "HRESULT")
        return pvarPortNumber
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PathId() {
        pvarPathId := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, pvarPathId, "HRESULT")
        return pvarPathId
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_TargetId() {
        pvarTargetId := VARIANT()
        result := ComCall(9, this, VARIANT.Ptr, pvarTargetId, "HRESULT")
        return pvarTargetId
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_Lun() {
        pvarLun := VARIANT()
        result := ComCall(10, this, VARIANT.Ptr, pvarLun, "HRESULT")
        return pvarLun
    }

    Query(iid) {
        if (ISClusScsiAddress.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PortNumber := CallbackCreate(GetMethod(implObj, "get_PortNumber"), flags, 2)
        this.vtbl.get_PathId := CallbackCreate(GetMethod(implObj, "get_PathId"), flags, 2)
        this.vtbl.get_TargetId := CallbackCreate(GetMethod(implObj, "get_TargetId"), flags, 2)
        this.vtbl.get_Lun := CallbackCreate(GetMethod(implObj, "get_Lun"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PortNumber)
        CallbackFree(this.vtbl.get_PathId)
        CallbackFree(this.vtbl.get_TargetId)
        CallbackFree(this.vtbl.get_Lun)
    }
}
