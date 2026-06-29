#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct ISIInbandEPG extends IUnknown {
    /**
     * The interface identifier for ISIInbandEPG
     * @type {Guid}
     */
    static IID := Guid("{f90ad9d0-b854-4b68-9cc1-b2cc96119d85}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISIInbandEPG interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        StartSIEPGScan     : IntPtr
        StopSIEPGScan      : IntPtr
        IsSIEPGScanRunning : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISIInbandEPG.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StartSIEPGScan() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopSIEPGScan() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsSIEPGScanRunning() {
        result := ComCall(5, this, BOOL.Ptr, &bRunning := 0, "HRESULT")
        return bRunning
    }

    Query(iid) {
        if (ISIInbandEPG.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartSIEPGScan := CallbackCreate(GetMethod(implObj, "StartSIEPGScan"), flags, 1)
        this.vtbl.StopSIEPGScan := CallbackCreate(GetMethod(implObj, "StopSIEPGScan"), flags, 1)
        this.vtbl.IsSIEPGScanRunning := CallbackCreate(GetMethod(implObj, "IsSIEPGScanRunning"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartSIEPGScan)
        CallbackFree(this.vtbl.StopSIEPGScan)
        CallbackFree(this.vtbl.IsSIEPGScanRunning)
    }
}
