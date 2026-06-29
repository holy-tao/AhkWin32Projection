#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\IDWriteFontSet1.ahk" { IDWriteFontSet1 }

/**
 * Represents a font set. (IDWriteFontSet2)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontset2
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontSet2 extends IDWriteFontSet1 {
    /**
     * The interface identifier for IDWriteFontSet2
     * @type {Guid}
     */
    static IID := Guid("{dc7ead19-e54c-43af-b2da-4e2b79ba3f7f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontSet2 interfaces
    */
    struct Vtbl extends IDWriteFontSet1.Vtbl {
        GetExpirationEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontSet2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the expiration event for the font set, if any. The expiration event is set on a system font set object if it is out of date due to fonts being installed, uninstalled, or updated. (IDWriteFontSet2::GetExpirationEvent)
     * @remarks
     * You mustn't call **CloseHandle** on the returned event handle. The handle is owned by the font set object, and it remains valid as long as you hold a reference to the font set. You can wait on the returned event, or use [RegisterWaitForSingleObject](../winbase/nf-winbase-registerwaitforsingleobject.md) to request a callback when the event is set.
     * @returns {HANDLE} Type: **[HANDLE](/windows/win32/winprog/windows-data-types)**
     * 
     * An event handle, if called on the system font set, or `nullptr` if called on a custom font set.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontset2-getexpirationevent
     */
    GetExpirationEvent() {
        result := ComCall(26, this, HANDLE.Owned)
        return result
    }

    Query(iid) {
        if (IDWriteFontSet2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetExpirationEvent := CallbackCreate(GetMethod(implObj, "GetExpirationEvent"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetExpirationEvent)
    }
}
