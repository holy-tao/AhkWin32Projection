#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_DRIWMDRMSession extends IUnknown {
    /**
     * The interface identifier for IBDA_DRIWMDRMSession
     * @type {Guid}
     */
    static IID := Guid("{05c690f8-56db-4bb2-b053-79c12098bb26}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_DRIWMDRMSession interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AcknowledgeLicense           : IntPtr
        ProcessLicenseChallenge      : IntPtr
        ProcessRegistrationChallenge : IntPtr
        SetRevInfo                   : IntPtr
        SetCrl                       : IntPtr
        GetHMSAssociationData        : IntPtr
        GetLastCardeaError           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_DRIWMDRMSession.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {HRESULT} hrLicenseAck 
     * @returns {HRESULT} 
     */
    AcknowledgeLicense(hrLicenseAck) {
        result := ComCall(3, this, "int", hrLicenseAck, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwcbLicenseMessage 
     * @param {Pointer<Integer>} pbLicenseMessage 
     * @param {Pointer<Integer>} pdwcbLicenseResponse 
     * @param {Pointer<Pointer<Integer>>} ppbLicenseResponse 
     * @returns {HRESULT} 
     */
    ProcessLicenseChallenge(dwcbLicenseMessage, pbLicenseMessage, pdwcbLicenseResponse, ppbLicenseResponse) {
        pbLicenseMessageMarshal := pbLicenseMessage is VarRef ? "char*" : "ptr"
        pdwcbLicenseResponseMarshal := pdwcbLicenseResponse is VarRef ? "uint*" : "ptr"
        ppbLicenseResponseMarshal := ppbLicenseResponse is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", dwcbLicenseMessage, pbLicenseMessageMarshal, pbLicenseMessage, pdwcbLicenseResponseMarshal, pdwcbLicenseResponse, ppbLicenseResponseMarshal, ppbLicenseResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwcbRegistrationMessage 
     * @param {Pointer<Integer>} pbRegistrationMessage 
     * @param {Pointer<Integer>} pdwcbRegistrationResponse 
     * @param {Pointer<Pointer<Integer>>} ppbRegistrationResponse 
     * @returns {HRESULT} 
     */
    ProcessRegistrationChallenge(dwcbRegistrationMessage, pbRegistrationMessage, pdwcbRegistrationResponse, ppbRegistrationResponse) {
        pbRegistrationMessageMarshal := pbRegistrationMessage is VarRef ? "char*" : "ptr"
        pdwcbRegistrationResponseMarshal := pdwcbRegistrationResponse is VarRef ? "uint*" : "ptr"
        ppbRegistrationResponseMarshal := ppbRegistrationResponse is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "uint", dwcbRegistrationMessage, pbRegistrationMessageMarshal, pbRegistrationMessage, pdwcbRegistrationResponseMarshal, pdwcbRegistrationResponse, ppbRegistrationResponseMarshal, ppbRegistrationResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRevInfoLen 
     * @param {Pointer<Integer>} pbRevInfo 
     * @param {Pointer<Integer>} pdwResponse 
     * @returns {HRESULT} 
     */
    SetRevInfo(dwRevInfoLen, pbRevInfo, pdwResponse) {
        pbRevInfoMarshal := pbRevInfo is VarRef ? "char*" : "ptr"
        pdwResponseMarshal := pdwResponse is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", dwRevInfoLen, pbRevInfoMarshal, pbRevInfo, pdwResponseMarshal, pdwResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCrlLen 
     * @param {Pointer<Integer>} pbCrlLen 
     * @param {Pointer<Integer>} pdwResponse 
     * @returns {HRESULT} 
     */
    SetCrl(dwCrlLen, pbCrlLen, pdwResponse) {
        pbCrlLenMarshal := pbCrlLen is VarRef ? "char*" : "ptr"
        pdwResponseMarshal := pdwResponse is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", dwCrlLen, pbCrlLenMarshal, pbCrlLen, pdwResponseMarshal, pdwResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GetHMSAssociationData() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwError 
     * @returns {HRESULT} 
     */
    GetLastCardeaError(pdwError) {
        pdwErrorMarshal := pdwError is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pdwErrorMarshal, pdwError, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_DRIWMDRMSession.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AcknowledgeLicense := CallbackCreate(GetMethod(implObj, "AcknowledgeLicense"), flags, 2)
        this.vtbl.ProcessLicenseChallenge := CallbackCreate(GetMethod(implObj, "ProcessLicenseChallenge"), flags, 5)
        this.vtbl.ProcessRegistrationChallenge := CallbackCreate(GetMethod(implObj, "ProcessRegistrationChallenge"), flags, 5)
        this.vtbl.SetRevInfo := CallbackCreate(GetMethod(implObj, "SetRevInfo"), flags, 4)
        this.vtbl.SetCrl := CallbackCreate(GetMethod(implObj, "SetCrl"), flags, 4)
        this.vtbl.GetHMSAssociationData := CallbackCreate(GetMethod(implObj, "GetHMSAssociationData"), flags, 1)
        this.vtbl.GetLastCardeaError := CallbackCreate(GetMethod(implObj, "GetLastCardeaError"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AcknowledgeLicense)
        CallbackFree(this.vtbl.ProcessLicenseChallenge)
        CallbackFree(this.vtbl.ProcessRegistrationChallenge)
        CallbackFree(this.vtbl.SetRevInfo)
        CallbackFree(this.vtbl.SetCrl)
        CallbackFree(this.vtbl.GetHMSAssociationData)
        CallbackFree(this.vtbl.GetLastCardeaError)
    }
}
