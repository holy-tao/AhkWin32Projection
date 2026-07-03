#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IPMExtensionInfo extends IUnknown {
    /**
     * The interface identifier for IPMExtensionInfo
     * @type {Guid}
     */
    static IID := Guid("{49acde79-9788-4d0a-8aa0-1746afdb9e9d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPMExtensionInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_SupplierPID    : IntPtr
        get_SupplierTaskID : IntPtr
        get_Title          : IntPtr
        get_IconPath       : IntPtr
        get_ExtraFile      : IntPtr
        get_InvocationInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPMExtensionInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Guid} 
     */
    SupplierPID {
        get => this.get_SupplierPID()
    }

    /**
     */
    SupplierTaskID {
        get => this.get_SupplierTaskID()
    }

    /**
     */
    Title {
        get => this.get_Title()
    }

    /**
     */
    IconPath {
        get => this.get_IconPath()
    }

    /**
     */
    ExtraFile {
        get => this.get_ExtraFile()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_SupplierPID() {
        pSupplierPID := Guid()
        result := ComCall(3, this, Guid.Ptr, pSupplierPID, "HRESULT")
        return pSupplierPID
    }

    /**
     * 
     * @param {Pointer<BSTR>} pSupplierTID 
     * @returns {HRESULT} 
     */
    get_SupplierTaskID(pSupplierTID) {
        result := ComCall(4, this, BSTR.Ptr, pSupplierTID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pTitle 
     * @returns {HRESULT} 
     */
    get_Title(pTitle) {
        result := ComCall(5, this, BSTR.Ptr, pTitle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pIconPath 
     * @returns {HRESULT} 
     */
    get_IconPath(pIconPath) {
        result := ComCall(6, this, BSTR.Ptr, pIconPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pFilePath 
     * @returns {HRESULT} 
     */
    get_ExtraFile(pFilePath) {
        result := ComCall(7, this, BSTR.Ptr, pFilePath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pImageUrn 
     * @param {Pointer<BSTR>} pParameters 
     * @returns {HRESULT} 
     */
    get_InvocationInfo(pImageUrn, pParameters) {
        result := ComCall(8, this, BSTR.Ptr, pImageUrn, BSTR.Ptr, pParameters, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPMExtensionInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SupplierPID := CallbackCreate(GetMethod(implObj, "get_SupplierPID"), flags, 2)
        this.vtbl.get_SupplierTaskID := CallbackCreate(GetMethod(implObj, "get_SupplierTaskID"), flags, 2)
        this.vtbl.get_Title := CallbackCreate(GetMethod(implObj, "get_Title"), flags, 2)
        this.vtbl.get_IconPath := CallbackCreate(GetMethod(implObj, "get_IconPath"), flags, 2)
        this.vtbl.get_ExtraFile := CallbackCreate(GetMethod(implObj, "get_ExtraFile"), flags, 2)
        this.vtbl.get_InvocationInfo := CallbackCreate(GetMethod(implObj, "get_InvocationInfo"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SupplierPID)
        CallbackFree(this.vtbl.get_SupplierTaskID)
        CallbackFree(this.vtbl.get_Title)
        CallbackFree(this.vtbl.get_IconPath)
        CallbackFree(this.vtbl.get_ExtraFile)
        CallbackFree(this.vtbl.get_InvocationInfo)
    }
}
