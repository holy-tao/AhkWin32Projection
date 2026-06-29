#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MF_TIMED_TEXT_RUBY_POSITION.ahk" { MF_TIMED_TEXT_RUBY_POSITION }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MF_TIMED_TEXT_RUBY_RESERVE.ahk" { MF_TIMED_TEXT_RUBY_RESERVE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MF_TIMED_TEXT_RUBY_ALIGN.ahk" { MF_TIMED_TEXT_RUBY_ALIGN }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFTimedTextRuby extends IUnknown {
    /**
     * The interface identifier for IMFTimedTextRuby
     * @type {Guid}
     */
    static IID := Guid("{76c6a6f5-4955-4de5-b27b-14b734cc14b4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFTimedTextRuby interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetRubyText     : IntPtr
        GetRubyPosition : IntPtr
        GetRubyAlign    : IntPtr
        GetRubyReserve  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFTimedTextRuby.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetRubyText() {
        result := ComCall(3, this, PWSTR.Ptr, &rubyText := 0, "HRESULT")
        return rubyText
    }

    /**
     * 
     * @returns {MF_TIMED_TEXT_RUBY_POSITION} 
     */
    GetRubyPosition() {
        result := ComCall(4, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {MF_TIMED_TEXT_RUBY_ALIGN} 
     */
    GetRubyAlign() {
        result := ComCall(5, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {MF_TIMED_TEXT_RUBY_RESERVE} 
     */
    GetRubyReserve() {
        result := ComCall(6, this, "int*", &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IMFTimedTextRuby.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetRubyText := CallbackCreate(GetMethod(implObj, "GetRubyText"), flags, 2)
        this.vtbl.GetRubyPosition := CallbackCreate(GetMethod(implObj, "GetRubyPosition"), flags, 2)
        this.vtbl.GetRubyAlign := CallbackCreate(GetMethod(implObj, "GetRubyAlign"), flags, 2)
        this.vtbl.GetRubyReserve := CallbackCreate(GetMethod(implObj, "GetRubyReserve"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetRubyText)
        CallbackFree(this.vtbl.GetRubyPosition)
        CallbackFree(this.vtbl.GetRubyAlign)
        CallbackFree(this.vtbl.GetRubyReserve)
    }
}
