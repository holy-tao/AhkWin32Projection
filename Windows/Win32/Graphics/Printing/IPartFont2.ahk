#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\EXpsFontRestriction.ahk" { EXpsFontRestriction }
#Import ".\IPartFont.ahk" { IPartFont }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPartFont2 extends IPartFont {
    /**
     * The interface identifier for IPartFont2
     * @type {Guid}
     */
    static IID := Guid("{511e025f-d6cb-43be-bf65-63fe88515a39}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPartFont2 interfaces
    */
    struct Vtbl extends IPartFont.Vtbl {
        GetFontRestriction : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPartFont2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {EXpsFontRestriction} 
     */
    GetFontRestriction() {
        result := ComCall(10, this, "int*", &pRestriction := 0, "HRESULT")
        return pRestriction
    }

    Query(iid) {
        if (IPartFont2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFontRestriction := CallbackCreate(GetMethod(implObj, "GetFontRestriction"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFontRestriction)
    }
}
