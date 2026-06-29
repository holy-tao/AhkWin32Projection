#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWMDRMTranscryptor.ahk" { IWMDRMTranscryptor }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMDRMTranscryptor2 extends IWMDRMTranscryptor {
    /**
     * The interface identifier for IWMDRMTranscryptor2
     * @type {Guid}
     */
    static IID := Guid("{e0da439f-d331-496a-bece-18e5bac5dd23}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMDRMTranscryptor2 interfaces
    */
    struct Vtbl extends IWMDRMTranscryptor.Vtbl {
        SeekEx               : IntPtr
        ZeroAdjustTimestamps : IntPtr
        GetSeekStartTime     : IntPtr
        GetDuration          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMDRMTranscryptor2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} cnsStartTime 
     * @param {Integer} cnsDuration 
     * @param {Float} flRate 
     * @param {BOOL} fIncludeFileHeader 
     * @returns {HRESULT} 
     */
    SeekEx(cnsStartTime, cnsDuration, flRate, fIncludeFileHeader) {
        result := ComCall(7, this, "uint", cnsStartTime, "uint", cnsDuration, "float", flRate, BOOL, fIncludeFileHeader, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    ZeroAdjustTimestamps(fEnable) {
        result := ComCall(8, this, BOOL, fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetSeekStartTime() {
        result := ComCall(9, this, "uint*", &pcnsTime := 0, "HRESULT")
        return pcnsTime
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDuration() {
        result := ComCall(10, this, "uint*", &pcnsDuration := 0, "HRESULT")
        return pcnsDuration
    }

    Query(iid) {
        if (IWMDRMTranscryptor2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SeekEx := CallbackCreate(GetMethod(implObj, "SeekEx"), flags, 5)
        this.vtbl.ZeroAdjustTimestamps := CallbackCreate(GetMethod(implObj, "ZeroAdjustTimestamps"), flags, 2)
        this.vtbl.GetSeekStartTime := CallbackCreate(GetMethod(implObj, "GetSeekStartTime"), flags, 2)
        this.vtbl.GetDuration := CallbackCreate(GetMethod(implObj, "GetDuration"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SeekEx)
        CallbackFree(this.vtbl.ZeroAdjustTimestamps)
        CallbackFree(this.vtbl.GetSeekStartTime)
        CallbackFree(this.vtbl.GetDuration)
    }
}
