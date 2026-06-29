#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\APPLETIDLIST.ahk" { APPLETIDLIST }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IImeSpecifyApplets interface specifies methods called from the IImePad interface object to emulate the IImePadApplet interface.
 * @see https://learn.microsoft.com/windows/win32/api/imepad/nn-imepad-iimespecifyapplets
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IImeSpecifyApplets extends IUnknown {
    /**
     * The interface identifier for IImeSpecifyApplets
     * @type {Guid}
     */
    static IID := Guid("{5d8e643c-c3a9-11d1-afef-00805f0c8b6d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IImeSpecifyApplets interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAppletIIDList : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IImeSpecifyApplets.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called from the IImePad interface to enumerate the IImePadApplet interfaces that are implemented.
     * @param {Pointer<Guid>} refiid IID of the <a href="https://docs.microsoft.com/windows/desktop/api/imepad/nn-imepad-iimepadapplet">IImePadApplet</a> interface. This IID is defined in Imepad.h as <b>IID_IImePadApplet</b>. This is for <b>IImePadApplet</b>'s future enhancement
     * @param {Pointer<APPLETIDLIST>} lpIIDList Pointer to a APPLETIIDLIST structure. Sets the applet's IID list and count.
     * @returns {HRESULT} <b>S_OK</b> if successful, otherwise <b>E_FAIL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/imepad/nf-imepad-iimespecifyapplets-getappletiidlist
     */
    GetAppletIIDList(refiid, lpIIDList) {
        result := ComCall(3, this, Guid.Ptr, refiid, APPLETIDLIST.Ptr, lpIIDList, "HRESULT")
        return result
    }

    Query(iid) {
        if (IImeSpecifyApplets.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAppletIIDList := CallbackCreate(GetMethod(implObj, "GetAppletIIDList"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAppletIIDList)
    }
}
