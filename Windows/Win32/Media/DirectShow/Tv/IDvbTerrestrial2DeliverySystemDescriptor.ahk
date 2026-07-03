#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IDvbTerrestrial2DeliverySystemDescriptor extends IUnknown {
    /**
     * The interface identifier for IDvbTerrestrial2DeliverySystemDescriptor
     * @type {Guid}
     */
    static IID := Guid("{20ee9be9-cd57-49ab-8f6e-1d07aeb8e482}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDvbTerrestrial2DeliverySystemDescriptor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTag                : IntPtr
        GetLength             : IntPtr
        GetTagExtension       : IntPtr
        GetCentreFrequency    : IntPtr
        GetPLPId              : IntPtr
        GetT2SystemId         : IntPtr
        GetMultipleInputMode  : IntPtr
        GetBandwidth          : IntPtr
        GetGuardInterval      : IntPtr
        GetTransmissionMode   : IntPtr
        GetCellId             : IntPtr
        GetOtherFrequencyFlag : IntPtr
        GetTFSFlag            : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDvbTerrestrial2DeliverySystemDescriptor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetTagExtension() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCentreFrequency() {
        result := ComCall(6, this, "uint*", &pdwVal := 0, "HRESULT")
        return pdwVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPLPId() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetT2SystemId() {
        result := ComCall(8, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMultipleInputMode() {
        result := ComCall(9, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetBandwidth() {
        result := ComCall(10, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetGuardInterval() {
        result := ComCall(11, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetTransmissionMode() {
        result := ComCall(12, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCellId() {
        result := ComCall(13, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetOtherFrequencyFlag() {
        result := ComCall(14, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetTFSFlag() {
        result := ComCall(15, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    Query(iid) {
        if (IDvbTerrestrial2DeliverySystemDescriptor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTag := CallbackCreate(GetMethod(implObj, "GetTag"), flags, 2)
        this.vtbl.GetLength := CallbackCreate(GetMethod(implObj, "GetLength"), flags, 2)
        this.vtbl.GetTagExtension := CallbackCreate(GetMethod(implObj, "GetTagExtension"), flags, 2)
        this.vtbl.GetCentreFrequency := CallbackCreate(GetMethod(implObj, "GetCentreFrequency"), flags, 2)
        this.vtbl.GetPLPId := CallbackCreate(GetMethod(implObj, "GetPLPId"), flags, 2)
        this.vtbl.GetT2SystemId := CallbackCreate(GetMethod(implObj, "GetT2SystemId"), flags, 2)
        this.vtbl.GetMultipleInputMode := CallbackCreate(GetMethod(implObj, "GetMultipleInputMode"), flags, 2)
        this.vtbl.GetBandwidth := CallbackCreate(GetMethod(implObj, "GetBandwidth"), flags, 2)
        this.vtbl.GetGuardInterval := CallbackCreate(GetMethod(implObj, "GetGuardInterval"), flags, 2)
        this.vtbl.GetTransmissionMode := CallbackCreate(GetMethod(implObj, "GetTransmissionMode"), flags, 2)
        this.vtbl.GetCellId := CallbackCreate(GetMethod(implObj, "GetCellId"), flags, 2)
        this.vtbl.GetOtherFrequencyFlag := CallbackCreate(GetMethod(implObj, "GetOtherFrequencyFlag"), flags, 2)
        this.vtbl.GetTFSFlag := CallbackCreate(GetMethod(implObj, "GetTFSFlag"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTag)
        CallbackFree(this.vtbl.GetLength)
        CallbackFree(this.vtbl.GetTagExtension)
        CallbackFree(this.vtbl.GetCentreFrequency)
        CallbackFree(this.vtbl.GetPLPId)
        CallbackFree(this.vtbl.GetT2SystemId)
        CallbackFree(this.vtbl.GetMultipleInputMode)
        CallbackFree(this.vtbl.GetBandwidth)
        CallbackFree(this.vtbl.GetGuardInterval)
        CallbackFree(this.vtbl.GetTransmissionMode)
        CallbackFree(this.vtbl.GetCellId)
        CallbackFree(this.vtbl.GetOtherFrequencyFlag)
        CallbackFree(this.vtbl.GetTFSFlag)
    }
}
