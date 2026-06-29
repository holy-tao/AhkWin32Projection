#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IWMInterlaceProps extends IUnknown {
    /**
     * The interface identifier for IWMInterlaceProps
     * @type {Guid}
     */
    static IID := Guid("{7b12e5d1-bd22-48ea-bc06-98e893221c89}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMInterlaceProps interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetProcessType                : IntPtr
        SetInitInverseTeleCinePattern : IntPtr
        SetLastFrame                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMInterlaceProps.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} iProcessType 
     * @returns {HRESULT} 
     */
    SetProcessType(iProcessType) {
        result := ComCall(3, this, "int", iProcessType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} iInitPattern 
     * @returns {HRESULT} 
     */
    SetInitInverseTeleCinePattern(iInitPattern) {
        result := ComCall(4, this, "int", iInitPattern, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetLastFrame() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMInterlaceProps.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetProcessType := CallbackCreate(GetMethod(implObj, "SetProcessType"), flags, 2)
        this.vtbl.SetInitInverseTeleCinePattern := CallbackCreate(GetMethod(implObj, "SetInitInverseTeleCinePattern"), flags, 2)
        this.vtbl.SetLastFrame := CallbackCreate(GetMethod(implObj, "SetLastFrame"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetProcessType)
        CallbackFree(this.vtbl.SetInitInverseTeleCinePattern)
        CallbackFree(this.vtbl.SetLastFrame)
    }
}
