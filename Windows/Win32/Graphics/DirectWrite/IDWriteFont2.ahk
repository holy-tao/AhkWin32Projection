#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IDWriteFont1.ahk" { IDWriteFont1 }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents a physical font in a font collection.
 * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritefont2
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFont2 extends IDWriteFont1 {
    /**
     * The interface identifier for IDWriteFont2
     * @type {Guid}
     */
    static IID := Guid("{29748ed6-8c9c-4a6a-be0b-d912e8538944}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFont2 interfaces
    */
    struct Vtbl extends IDWriteFont1.Vtbl {
        IsColorFont : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFont2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enables determining if a color rendering path is potentially necessary.
     * @returns {BOOL} This method has no parameters.
     * 
     * 
     * Type: **BOOL**
     * 
     * Returns **TRUE** if the font has color information (COLR and CPAL tables); otherwise **FALSE**.
     * @see https://learn.microsoft.com/windows/win32/DirectWrite/idwritefont2-iscolorfont
     */
    IsColorFont() {
        result := ComCall(18, this, BOOL)
        return result
    }

    Query(iid) {
        if (IDWriteFont2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.IsColorFont := CallbackCreate(GetMethod(implObj, "IsColorFont"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.IsColorFont)
    }
}
