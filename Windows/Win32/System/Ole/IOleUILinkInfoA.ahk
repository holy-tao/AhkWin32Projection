#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\IOleUILinkContainerA.ahk" { IOleUILinkContainerA }

/**
 * An extension of the IOleUILinkContainer interface. It returns the time that an object was last updated, which is link information that IOleUILinkContainer does not provide. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The oledlg.h header defines IOleUILinkInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/oledlg/nn-oledlg-ioleuilinkinfoa
 * @namespace Windows.Win32.System.Ole
 * @charset ANSI
 */
export default struct IOleUILinkInfoA extends IOleUILinkContainerA {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOleUILinkInfoA interfaces
    */
    struct Vtbl extends IOleUILinkContainerA.Vtbl {
        GetLastUpdate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOleUILinkInfoA.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Determines the last time the object was updated. (ANSI)
     * @remarks
     * <h3><a id="Notes_to_Implementers"></a><a id="notes_to_implementers"></a><a id="NOTES_TO_IMPLEMENTERS"></a>Notes to Implementers</h3>
     * If the time that the object was last updated is known, copy it to <i>lpLastUpdate</i>. If it is not known, then leave <i>lpLastUpdate</i> unchanged and Unknown will be displayed in the link page.
     * @param {Integer} dwLink Container-defined unique identifier for a single link. Containers can use the pointer to the link's container site for this value.
     * @returns {FILETIME} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that indicates the time that the object was last updated.
     * @see https://learn.microsoft.com/windows/win32/api/oledlg/nf-oledlg-ioleuilinkinfoa-getlastupdate
     */
    GetLastUpdate(dwLink) {
        lpLastUpdate := FILETIME()
        result := ComCall(11, this, "uint", dwLink, FILETIME.Ptr, lpLastUpdate, "HRESULT")
        return lpLastUpdate
    }

    Query(iid) {
        if (IOleUILinkInfoA.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLastUpdate := CallbackCreate(GetMethod(implObj, "GetLastUpdate"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLastUpdate)
    }
}
