#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
export default struct IDxcOptimizerPass extends IUnknown {
    /**
     * The interface identifier for IDxcOptimizerPass
     * @type {Guid}
     */
    static IID := Guid("{ae2cd79f-cc22-453f-9b6b-b124e7a5204c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDxcOptimizerPass interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetOptionName           : IntPtr
        GetDescription          : IntPtr
        GetOptionArgCount       : IntPtr
        GetOptionArgName        : IntPtr
        GetOptionArgDescription : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDxcOptimizerPass.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetOptionName() {
        result := ComCall(3, this, PWSTR.Ptr, &ppResult := 0, "HRESULT")
        return ppResult
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetDescription
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecstrings-getdescription
     */
    GetDescription() {
        result := ComCall(4, this, PWSTR.Ptr, &ppResult := 0, "HRESULT")
        return ppResult
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetOptionArgCount() {
        result := ComCall(5, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Integer} argIndex 
     * @returns {PWSTR} 
     */
    GetOptionArgName(argIndex) {
        result := ComCall(6, this, "uint", argIndex, PWSTR.Ptr, &ppResult := 0, "HRESULT")
        return ppResult
    }

    /**
     * 
     * @param {Integer} argIndex 
     * @returns {PWSTR} 
     */
    GetOptionArgDescription(argIndex) {
        result := ComCall(7, this, "uint", argIndex, PWSTR.Ptr, &ppResult := 0, "HRESULT")
        return ppResult
    }

    Query(iid) {
        if (IDxcOptimizerPass.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetOptionName := CallbackCreate(GetMethod(implObj, "GetOptionName"), flags, 2)
        this.vtbl.GetDescription := CallbackCreate(GetMethod(implObj, "GetDescription"), flags, 2)
        this.vtbl.GetOptionArgCount := CallbackCreate(GetMethod(implObj, "GetOptionArgCount"), flags, 2)
        this.vtbl.GetOptionArgName := CallbackCreate(GetMethod(implObj, "GetOptionArgName"), flags, 3)
        this.vtbl.GetOptionArgDescription := CallbackCreate(GetMethod(implObj, "GetOptionArgDescription"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetOptionName)
        CallbackFree(this.vtbl.GetDescription)
        CallbackFree(this.vtbl.GetOptionArgCount)
        CallbackFree(this.vtbl.GetOptionArgName)
        CallbackFree(this.vtbl.GetOptionArgDescription)
    }
}
