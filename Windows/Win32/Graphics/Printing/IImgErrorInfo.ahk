#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IErrorInfo.ahk" { IErrorInfo }
#Import ".\ImgErrorInfo.ahk" { ImgErrorInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IImgErrorInfo extends IErrorInfo {
    /**
     * The interface identifier for IImgErrorInfo
     * @type {Guid}
     */
    static IID := Guid("{2bce4ece-d30e-445a-9423-6829be945ad8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IImgErrorInfo interfaces
    */
    struct Vtbl extends IErrorInfo.Vtbl {
        GetDeveloperDescription : IntPtr
        GetUserErrorId          : IntPtr
        GetUserParameterCount   : IntPtr
        GetUserParameter        : IntPtr
        GetUserFallback         : IntPtr
        GetExceptionId          : IntPtr
        DetachErrorInfo         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IImgErrorInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetDeveloperDescription() {
        pbstrDevDescription := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrDevDescription, "HRESULT")
        return pbstrDevDescription
    }

    /**
     * 
     * @returns {Guid} 
     */
    GetUserErrorId() {
        pErrorId := Guid()
        result := ComCall(9, this, Guid.Ptr, pErrorId, "HRESULT")
        return pErrorId
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetUserParameterCount() {
        result := ComCall(10, this, "uint*", &pcUserParams := 0, "HRESULT")
        return pcUserParams
    }

    /**
     * 
     * @param {Integer} cParam 
     * @returns {BSTR} 
     */
    GetUserParameter(cParam) {
        pbstrParam := BSTR.Owned()
        result := ComCall(11, this, "uint", cParam, BSTR.Ptr, pbstrParam, "HRESULT")
        return pbstrParam
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetUserFallback() {
        pbstrFallback := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pbstrFallback, "HRESULT")
        return pbstrFallback
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetExceptionId() {
        result := ComCall(13, this, "uint*", &pExceptionId := 0, "HRESULT")
        return pExceptionId
    }

    /**
     * 
     * @returns {ImgErrorInfo} 
     */
    DetachErrorInfo() {
        pErrorInfo := ImgErrorInfo()
        result := ComCall(14, this, ImgErrorInfo.Ptr, pErrorInfo, "HRESULT")
        return pErrorInfo
    }

    Query(iid) {
        if (IImgErrorInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDeveloperDescription := CallbackCreate(GetMethod(implObj, "GetDeveloperDescription"), flags, 2)
        this.vtbl.GetUserErrorId := CallbackCreate(GetMethod(implObj, "GetUserErrorId"), flags, 2)
        this.vtbl.GetUserParameterCount := CallbackCreate(GetMethod(implObj, "GetUserParameterCount"), flags, 2)
        this.vtbl.GetUserParameter := CallbackCreate(GetMethod(implObj, "GetUserParameter"), flags, 3)
        this.vtbl.GetUserFallback := CallbackCreate(GetMethod(implObj, "GetUserFallback"), flags, 2)
        this.vtbl.GetExceptionId := CallbackCreate(GetMethod(implObj, "GetExceptionId"), flags, 2)
        this.vtbl.DetachErrorInfo := CallbackCreate(GetMethod(implObj, "DetachErrorInfo"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDeveloperDescription)
        CallbackFree(this.vtbl.GetUserErrorId)
        CallbackFree(this.vtbl.GetUserParameterCount)
        CallbackFree(this.vtbl.GetUserParameter)
        CallbackFree(this.vtbl.GetUserFallback)
        CallbackFree(this.vtbl.GetExceptionId)
        CallbackFree(this.vtbl.DetachErrorInfo)
    }
}
