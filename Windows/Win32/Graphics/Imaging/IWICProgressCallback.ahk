#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\WICProgressOperation.ahk" { WICProgressOperation }

/**
 * IWICProgressCallback interface is documented only for compliance; its use is not recommended and may be altered or unavailable in the future. Instead, and use RegisterProgressNotification.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicprogresscallback
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICProgressCallback extends IUnknown {
    /**
     * The interface identifier for IWICProgressCallback
     * @type {Guid}
     */
    static IID := Guid("{4776f9cd-9517-45fa-bf24-e89c5ec5c60c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICProgressCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Notify : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICProgressCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notify method is documented only for compliance; its use is not recommended and may be altered or unavailable in the future. Instead, and use RegisterProgressNotification.
     * @param {Integer} uFrameNum Type: <b>ULONG</b>
     * 
     * The current frame number.
     * @param {WICProgressOperation} operation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicprogressoperation">WICProgressOperation</a></b>
     * 
     * The operation on which progress is being reported.
     * @param {Float} dblProgress Type: <b>double</b>
     * 
     * The progress value ranging from is 0.0 to 1.0. 0.0 indicates the beginning of the operation. 1.0 indicates the end of the operation.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicprogresscallback-notify
     */
    Notify(uFrameNum, operation, dblProgress) {
        result := ComCall(3, this, "uint", uFrameNum, WICProgressOperation, operation, "double", dblProgress, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWICProgressCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Notify := CallbackCreate(GetMethod(implObj, "Notify"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Notify)
    }
}
