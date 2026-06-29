#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IMSMQApplication.ahk" { IMSMQApplication }
#Import "..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct IMSMQApplication2 extends IMSMQApplication {
    /**
     * The interface identifier for IMSMQApplication2
     * @type {Guid}
     */
    static IID := Guid("{12a30900-7300-11d2-b0e6-00e02c074f6b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSMQApplication2 interfaces
    */
    struct Vtbl extends IMSMQApplication.Vtbl {
        RegisterCertificate    : IntPtr
        MachineNameOfMachineId : IntPtr
        get_MSMQVersionMajor   : IntPtr
        get_MSMQVersionMinor   : IntPtr
        get_MSMQVersionBuild   : IntPtr
        get_IsDsEnabled        : IntPtr
        get_Properties         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSMQApplication2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    MSMQVersionMajor {
        get => this.get_MSMQVersionMajor()
    }

    /**
     * @type {Integer} 
     */
    MSMQVersionMinor {
        get => this.get_MSMQVersionMinor()
    }

    /**
     * @type {Integer} 
     */
    MSMQVersionBuild {
        get => this.get_MSMQVersionBuild()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsDsEnabled {
        get => this.get_IsDsEnabled()
    }

    /**
     * @type {IDispatch} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * 
     * @param {Pointer<VARIANT>} Flags 
     * @param {Pointer<VARIANT>} ExternalCertificate 
     * @returns {HRESULT} 
     */
    RegisterCertificate(Flags, ExternalCertificate) {
        result := ComCall(8, this, VARIANT.Ptr, Flags, VARIANT.Ptr, ExternalCertificate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrGuid 
     * @returns {BSTR} 
     */
    MachineNameOfMachineId(bstrGuid) {
        bstrGuid := bstrGuid is String ? BSTR.Alloc(bstrGuid).Value : bstrGuid

        pbstrMachineName := BSTR.Owned()
        result := ComCall(9, this, BSTR, bstrGuid, BSTR.Ptr, pbstrMachineName, "HRESULT")
        return pbstrMachineName
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MSMQVersionMajor() {
        result := ComCall(10, this, "short*", &psMSMQVersionMajor := 0, "HRESULT")
        return psMSMQVersionMajor
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MSMQVersionMinor() {
        result := ComCall(11, this, "short*", &psMSMQVersionMinor := 0, "HRESULT")
        return psMSMQVersionMinor
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MSMQVersionBuild() {
        result := ComCall(12, this, "short*", &psMSMQVersionBuild := 0, "HRESULT")
        return psMSMQVersionBuild
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsDsEnabled() {
        result := ComCall(13, this, VARIANT_BOOL.Ptr, &pfIsDsEnabled := 0, "HRESULT")
        return pfIsDsEnabled
    }

    /**
     * 
     * @returns {IDispatch} 
     */
    get_Properties() {
        result := ComCall(14, this, "ptr*", &ppcolProperties := 0, "HRESULT")
        return IDispatch(ppcolProperties)
    }

    Query(iid) {
        if (IMSMQApplication2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RegisterCertificate := CallbackCreate(GetMethod(implObj, "RegisterCertificate"), flags, 3)
        this.vtbl.MachineNameOfMachineId := CallbackCreate(GetMethod(implObj, "MachineNameOfMachineId"), flags, 3)
        this.vtbl.get_MSMQVersionMajor := CallbackCreate(GetMethod(implObj, "get_MSMQVersionMajor"), flags, 2)
        this.vtbl.get_MSMQVersionMinor := CallbackCreate(GetMethod(implObj, "get_MSMQVersionMinor"), flags, 2)
        this.vtbl.get_MSMQVersionBuild := CallbackCreate(GetMethod(implObj, "get_MSMQVersionBuild"), flags, 2)
        this.vtbl.get_IsDsEnabled := CallbackCreate(GetMethod(implObj, "get_IsDsEnabled"), flags, 2)
        this.vtbl.get_Properties := CallbackCreate(GetMethod(implObj, "get_Properties"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RegisterCertificate)
        CallbackFree(this.vtbl.MachineNameOfMachineId)
        CallbackFree(this.vtbl.get_MSMQVersionMajor)
        CallbackFree(this.vtbl.get_MSMQVersionMinor)
        CallbackFree(this.vtbl.get_MSMQVersionBuild)
        CallbackFree(this.vtbl.get_IsDsEnabled)
        CallbackFree(this.vtbl.get_Properties)
    }
}
