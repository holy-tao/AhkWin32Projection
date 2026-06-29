#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IPMExtensionFileOpenPickerInfo extends IUnknown {
    /**
     * The interface identifier for IPMExtensionFileOpenPickerInfo
     * @type {Guid}
     */
    static IID := Guid("{6dc91d25-9606-420c-9a78-e034a3418345}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPMExtensionFileOpenPickerInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_AllFileTypes         : IntPtr
        get_SupportsAllFileTypes : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPMExtensionFileOpenPickerInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOL} 
     */
    SupportsAllFileTypes {
        get => this.get_SupportsAllFileTypes()
    }

    /**
     * 
     * @param {Pointer<Integer>} pcTypes 
     * @param {Pointer<Pointer<BSTR>>} ppTypes 
     * @returns {HRESULT} 
     */
    get_AllFileTypes(pcTypes, ppTypes) {
        pcTypesMarshal := pcTypes is VarRef ? "uint*" : "ptr"
        ppTypesMarshal := ppTypes is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pcTypesMarshal, pcTypes, ppTypesMarshal, ppTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_SupportsAllFileTypes() {
        result := ComCall(4, this, BOOL.Ptr, &pSupportsAllTypes := 0, "HRESULT")
        return pSupportsAllTypes
    }

    Query(iid) {
        if (IPMExtensionFileOpenPickerInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AllFileTypes := CallbackCreate(GetMethod(implObj, "get_AllFileTypes"), flags, 3)
        this.vtbl.get_SupportsAllFileTypes := CallbackCreate(GetMethod(implObj, "get_SupportsAllFileTypes"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AllFileTypes)
        CallbackFree(this.vtbl.get_SupportsAllFileTypes)
    }
}
