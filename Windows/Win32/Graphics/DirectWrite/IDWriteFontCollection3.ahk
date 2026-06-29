#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\IDWriteFontCollection2.ahk" { IDWriteFontCollection2 }

/**
 * This interface encapsulates a set of fonts, such as the set of fonts installed on the system, or the set of fonts in a particular directory. The font collection API can be used to discover what font families and fonts are available, and to obtain some metadata about the fonts. (IDWriteFontCollection3)
 * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nn-dwrite_3-idwritefontcollection3
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct IDWriteFontCollection3 extends IDWriteFontCollection2 {
    /**
     * The interface identifier for IDWriteFontCollection3
     * @type {Guid}
     */
    static IID := Guid("{a4d055a6-f9e3-4e25-93b7-9e309f3af8e9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDWriteFontCollection3 interfaces
    */
    struct Vtbl extends IDWriteFontCollection2.Vtbl {
        GetExpirationEvent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDWriteFontCollection3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the expiration event for the font set, if any. The expiration event is set on a system font set object if it is out of date due to fonts being installed, uninstalled, or updated. (IDWriteFontCollection3::GetExpirationEvent)
     * @remarks
     * You mustn't call **CloseHandle** on the returned event handle. The handle is owned by the font set object, and it remains valid as long as you hold a reference to the font set. You can wait on the returned event, or use [RegisterWaitForSingleObject](../winbase/nf-winbase-registerwaitforsingleobject.md) to request a callback when the event is set.
     * @returns {HANDLE} Type: **[HANDLE](/windows/win32/winprog/windows-data-types)**
     * 
     * An event handle, if called on the system font set, or `nullptr` if called on a custom font set.
     * @see https://learn.microsoft.com/windows/win32/api/dwrite_3/nf-dwrite_3-idwritefontcollection3-getexpirationevent
     */
    GetExpirationEvent() {
        result := ComCall(13, this, HANDLE.Owned)
        return result
    }

    Query(iid) {
        if (IDWriteFontCollection3.IID.Equals(iid)) {
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
