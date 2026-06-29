#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IShellUIHelper6.ahk" { IShellUIHelper6 }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellUIHelper7 extends IShellUIHelper6 {
    /**
     * The interface identifier for IShellUIHelper7
     * @type {Guid}
     */
    static IID := Guid("{60e567c8-9573-4ab2-a264-637c6c161cb1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellUIHelper7 interfaces
    */
    struct Vtbl extends IShellUIHelper6.Vtbl {
        SetExperimentalFlag                : IntPtr
        GetExperimentalFlag                : IntPtr
        SetExperimentalValue               : IntPtr
        GetExperimentalValue               : IntPtr
        ResetAllExperimentalFlagsAndValues : IntPtr
        GetNeedIEAutoLaunchFlag            : IntPtr
        SetNeedIEAutoLaunchFlag            : IntPtr
        HasNeedIEAutoLaunchFlag            : IntPtr
        LaunchIE                           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellUIHelper7.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrFlagString 
     * @param {VARIANT_BOOL} vfFlag 
     * @returns {HRESULT} 
     */
    SetExperimentalFlag(bstrFlagString, vfFlag) {
        bstrFlagString := bstrFlagString is String ? BSTR.Alloc(bstrFlagString).Value : bstrFlagString

        result := ComCall(88, this, BSTR, bstrFlagString, VARIANT_BOOL, vfFlag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrFlagString 
     * @returns {VARIANT_BOOL} 
     */
    GetExperimentalFlag(bstrFlagString) {
        bstrFlagString := bstrFlagString is String ? BSTR.Alloc(bstrFlagString).Value : bstrFlagString

        result := ComCall(89, this, BSTR, bstrFlagString, VARIANT_BOOL.Ptr, &vfFlag := 0, "HRESULT")
        return vfFlag
    }

    /**
     * 
     * @param {BSTR} bstrValueString 
     * @param {Integer} dwValue 
     * @returns {HRESULT} 
     */
    SetExperimentalValue(bstrValueString, dwValue) {
        bstrValueString := bstrValueString is String ? BSTR.Alloc(bstrValueString).Value : bstrValueString

        result := ComCall(90, this, BSTR, bstrValueString, "uint", dwValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrValueString 
     * @returns {Integer} 
     */
    GetExperimentalValue(bstrValueString) {
        bstrValueString := bstrValueString is String ? BSTR.Alloc(bstrValueString).Value : bstrValueString

        result := ComCall(91, this, BSTR, bstrValueString, "uint*", &pdwValue := 0, "HRESULT")
        return pdwValue
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetAllExperimentalFlagsAndValues() {
        result := ComCall(92, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @returns {VARIANT_BOOL} 
     */
    GetNeedIEAutoLaunchFlag(bstrUrl) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(93, this, BSTR, bstrUrl, VARIANT_BOOL.Ptr, &flag := 0, "HRESULT")
        return flag
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @param {VARIANT_BOOL} flag 
     * @returns {HRESULT} 
     */
    SetNeedIEAutoLaunchFlag(bstrUrl, flag) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(94, this, BSTR, bstrUrl, VARIANT_BOOL, flag, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @returns {VARIANT_BOOL} 
     */
    HasNeedIEAutoLaunchFlag(bstrUrl) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(95, this, BSTR, bstrUrl, VARIANT_BOOL.Ptr, &exists := 0, "HRESULT")
        return exists
    }

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @param {VARIANT_BOOL} automated 
     * @returns {HRESULT} 
     */
    LaunchIE(bstrUrl, automated) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(96, this, BSTR, bstrUrl, VARIANT_BOOL, automated, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellUIHelper7.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetExperimentalFlag := CallbackCreate(GetMethod(implObj, "SetExperimentalFlag"), flags, 3)
        this.vtbl.GetExperimentalFlag := CallbackCreate(GetMethod(implObj, "GetExperimentalFlag"), flags, 3)
        this.vtbl.SetExperimentalValue := CallbackCreate(GetMethod(implObj, "SetExperimentalValue"), flags, 3)
        this.vtbl.GetExperimentalValue := CallbackCreate(GetMethod(implObj, "GetExperimentalValue"), flags, 3)
        this.vtbl.ResetAllExperimentalFlagsAndValues := CallbackCreate(GetMethod(implObj, "ResetAllExperimentalFlagsAndValues"), flags, 1)
        this.vtbl.GetNeedIEAutoLaunchFlag := CallbackCreate(GetMethod(implObj, "GetNeedIEAutoLaunchFlag"), flags, 3)
        this.vtbl.SetNeedIEAutoLaunchFlag := CallbackCreate(GetMethod(implObj, "SetNeedIEAutoLaunchFlag"), flags, 3)
        this.vtbl.HasNeedIEAutoLaunchFlag := CallbackCreate(GetMethod(implObj, "HasNeedIEAutoLaunchFlag"), flags, 3)
        this.vtbl.LaunchIE := CallbackCreate(GetMethod(implObj, "LaunchIE"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetExperimentalFlag)
        CallbackFree(this.vtbl.GetExperimentalFlag)
        CallbackFree(this.vtbl.SetExperimentalValue)
        CallbackFree(this.vtbl.GetExperimentalValue)
        CallbackFree(this.vtbl.ResetAllExperimentalFlagsAndValues)
        CallbackFree(this.vtbl.GetNeedIEAutoLaunchFlag)
        CallbackFree(this.vtbl.SetNeedIEAutoLaunchFlag)
        CallbackFree(this.vtbl.HasNeedIEAutoLaunchFlag)
        CallbackFree(this.vtbl.LaunchIE)
    }
}
