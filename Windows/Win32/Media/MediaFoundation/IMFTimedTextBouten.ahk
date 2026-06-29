#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MFARGB.ahk" { MFARGB }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MF_TIMED_TEXT_BOUTEN_TYPE.ahk" { MF_TIMED_TEXT_BOUTEN_TYPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\MF_TIMED_TEXT_BOUTEN_POSITION.ahk" { MF_TIMED_TEXT_BOUTEN_POSITION }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFTimedTextBouten extends IUnknown {
    /**
     * The interface identifier for IMFTimedTextBouten
     * @type {Guid}
     */
    static IID := Guid("{3c5f3e8a-90c0-464e-8136-898d2975f847}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFTimedTextBouten interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetBoutenType     : IntPtr
        GetBoutenColor    : IntPtr
        GetBoutenPosition : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFTimedTextBouten.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {MF_TIMED_TEXT_BOUTEN_TYPE} 
     */
    GetBoutenType() {
        result := ComCall(3, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {MFARGB} 
     */
    GetBoutenColor() {
        value := MFARGB()
        result := ComCall(4, this, MFARGB.Ptr, value, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {MF_TIMED_TEXT_BOUTEN_POSITION} 
     */
    GetBoutenPosition() {
        result := ComCall(5, this, "int*", &value := 0, "HRESULT")
        return value
    }

    Query(iid) {
        if (IMFTimedTextBouten.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBoutenType := CallbackCreate(GetMethod(implObj, "GetBoutenType"), flags, 2)
        this.vtbl.GetBoutenColor := CallbackCreate(GetMethod(implObj, "GetBoutenColor"), flags, 2)
        this.vtbl.GetBoutenPosition := CallbackCreate(GetMethod(implObj, "GetBoutenPosition"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBoutenType)
        CallbackFree(this.vtbl.GetBoutenColor)
        CallbackFree(this.vtbl.GetBoutenPosition)
    }
}
