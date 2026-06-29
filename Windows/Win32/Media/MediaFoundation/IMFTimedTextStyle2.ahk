#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFTimedTextBouten.ahk" { IMFTimedTextBouten }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFTimedTextRuby.ahk" { IMFTimedTextRuby }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFTimedTextStyle2 extends IUnknown {
    /**
     * The interface identifier for IMFTimedTextStyle2
     * @type {Guid}
     */
    static IID := Guid("{db639199-c809-4c89-bfca-d0bbb9729d6e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFTimedTextStyle2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRuby               : IntPtr
        GetBouten             : IntPtr
        IsTextCombined        : IntPtr
        GetFontAngleInDegrees : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFTimedTextStyle2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IMFTimedTextRuby} 
     */
    GetRuby() {
        result := ComCall(3, this, "ptr*", &ruby := 0, "HRESULT")
        return IMFTimedTextRuby(ruby)
    }

    /**
     * 
     * @returns {IMFTimedTextBouten} 
     */
    GetBouten() {
        result := ComCall(4, this, "ptr*", &bouten := 0, "HRESULT")
        return IMFTimedTextBouten(bouten)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsTextCombined() {
        result := ComCall(5, this, BOOL.Ptr, &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    GetFontAngleInDegrees() {
        result := ComCall(6, this, "double*", &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IMFTimedTextStyle2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRuby := CallbackCreate(GetMethod(implObj, "GetRuby"), flags, 2)
        this.vtbl.GetBouten := CallbackCreate(GetMethod(implObj, "GetBouten"), flags, 2)
        this.vtbl.IsTextCombined := CallbackCreate(GetMethod(implObj, "IsTextCombined"), flags, 2)
        this.vtbl.GetFontAngleInDegrees := CallbackCreate(GetMethod(implObj, "GetFontAngleInDegrees"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRuby)
        CallbackFree(this.vtbl.GetBouten)
        CallbackFree(this.vtbl.IsTextCombined)
        CallbackFree(this.vtbl.GetFontAngleInDegrees)
    }
}
