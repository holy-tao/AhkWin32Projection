#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ImgErrorInfo.ahk" { ImgErrorInfo }
#Import "..\..\System\Ole\ICreateErrorInfo.ahk" { ICreateErrorInfo }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IImgCreateErrorInfo extends ICreateErrorInfo {
    /**
     * The interface identifier for IImgCreateErrorInfo
     * @type {Guid}
     */
    static IID := Guid("{1c55a64c-07cd-4fb5-90f7-b753d91f0c9e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IImgCreateErrorInfo interfaces
    */
    struct Vtbl extends ICreateErrorInfo.Vtbl {
        AttachToErrorInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IImgCreateErrorInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<ImgErrorInfo>} pErrorInfo 
     * @returns {HRESULT} 
     */
    AttachToErrorInfo(pErrorInfo) {
        result := ComCall(8, this, ImgErrorInfo.Ptr, pErrorInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IImgCreateErrorInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AttachToErrorInfo := CallbackCreate(GetMethod(implObj, "AttachToErrorInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AttachToErrorInfo)
    }
}
