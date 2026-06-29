#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MINIDRV_TRANSFER_CONTEXT.ahk" { MINIDRV_TRANSFER_CONTEXT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct IWiaMiniDrvCallBack extends IUnknown {
    /**
     * The interface identifier for IWiaMiniDrvCallBack
     * @type {Guid}
     */
    static IID := Guid("{33a57d5a-3de8-11d2-9a36-00c04fa36145}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWiaMiniDrvCallBack interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        MiniDrvCallback : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWiaMiniDrvCallBack.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} lReason 
     * @param {Integer} lStatus 
     * @param {Integer} lPercentComplete 
     * @param {Integer} lOffset 
     * @param {Integer} lLength 
     * @param {Pointer<MINIDRV_TRANSFER_CONTEXT>} pTranCtx 
     * @param {Integer} lReserved 
     * @returns {HRESULT} 
     */
    MiniDrvCallback(lReason, lStatus, lPercentComplete, lOffset, lLength, pTranCtx, lReserved) {
        result := ComCall(3, this, "int", lReason, "int", lStatus, "int", lPercentComplete, "int", lOffset, "int", lLength, MINIDRV_TRANSFER_CONTEXT.Ptr, pTranCtx, "int", lReserved, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWiaMiniDrvCallBack.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.MiniDrvCallback := CallbackCreate(GetMethod(implObj, "MiniDrvCallback"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.MiniDrvCallback)
    }
}
