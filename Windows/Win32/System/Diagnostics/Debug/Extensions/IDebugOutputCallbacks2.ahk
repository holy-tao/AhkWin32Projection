#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct IDebugOutputCallbacks2 extends IUnknown {
    /**
     * The interface identifier for IDebugOutputCallbacks2
     * @type {Guid}
     */
    static IID := Guid("{67721fe9-56d2-4a44-a325-2b65513ce6eb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDebugOutputCallbacks2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Output          : IntPtr
        GetInterestMask : IntPtr
        Output2         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDebugOutputCallbacks2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Integer} Mask 
     * @param {PSTR} Text 
     * @returns {HRESULT} 
     */
    Output(Mask, Text) {
        Text := Text is String ? StrPtr(Text) : Text

        result := ComCall(3, this, "uint", Mask, "ptr", Text, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetInterestMask() {
        result := ComCall(4, this, "uint*", &Mask := 0, "HRESULT")
        return Mask
    }

    /**
     * 
     * @param {Integer} Which 
     * @param {Integer} Flags 
     * @param {Integer} Arg 
     * @param {PWSTR} Text 
     * @returns {HRESULT} 
     */
    Output2(Which, Flags, Arg, Text) {
        Text := Text is String ? StrPtr(Text) : Text

        result := ComCall(5, this, "uint", Which, "uint", Flags, "uint", Arg, "ptr", Text, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDebugOutputCallbacks2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Output := CallbackCreate(GetMethod(implObj, "Output"), flags, 3)
        this.vtbl.GetInterestMask := CallbackCreate(GetMethod(implObj, "GetInterestMask"), flags, 2)
        this.vtbl.Output2 := CallbackCreate(GetMethod(implObj, "Output2"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Output)
        CallbackFree(this.vtbl.GetInterestMask)
        CallbackFree(this.vtbl.Output2)
    }
}
