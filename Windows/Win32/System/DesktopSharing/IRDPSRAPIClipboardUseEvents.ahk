#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Implement this interface on the sharer side to track or control use of the clipboard. If you do not enable clipboard sharing, this interface has no effect. You need to set a value for the SetClipboardRedirectCallback property described in Property.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nn-rdpencomapi-irdpsrapiclipboarduseevents
 * @namespace Windows.Win32.System.DesktopSharing
 */
export default struct IRDPSRAPIClipboardUseEvents extends IUnknown {
    /**
     * The interface identifier for IRDPSRAPIClipboardUseEvents
     * @type {Guid}
     */
    static IID := Guid("{d559f59a-7a27-4138-8763-247ce5f659a8}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IRDPSRAPIClipboardUseEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnPasteFromClipboard : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IRDPSRAPIClipboardUseEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This callback is issued when an attempt to copy data from the sharer computer is made.
     * @param {Integer} _clipboardFormat A clipboard format identifier. For more information about clipboard formats, see <a href="https://docs.microsoft.com/windows/desktop/dataxchg/clipboard-formats">Clipboard Formats</a>. For a list of clipboard format identifiers, see <a href="https://docs.microsoft.com/windows/desktop/dataxchg/standard-clipboard-formats">Standard Clipboard Formats</a>.
     * @param {IDispatch} pAttendee A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapiattendee">IRDPSRAPIAttendee</a> instance for the attendee who attempted the clipboard copy.
     * @returns {VARIANT_BOOL} The return value for this attempt.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>VARIANT_TRUE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The clipboard copy attempt should be allowed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>VARIANT_FALSE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The clipboard copy attempt should not be allowed. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiclipboarduseevents-onpastefromclipboard
     */
    OnPasteFromClipboard(_clipboardFormat, pAttendee) {
        result := ComCall(3, this, "uint", _clipboardFormat, "ptr", pAttendee, VARIANT_BOOL.Ptr, &pRetVal := 0, "HRESULT")
        return pRetVal
    }

    Query(iid) {
        if (IRDPSRAPIClipboardUseEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnPasteFromClipboard := CallbackCreate(GetMethod(implObj, "OnPasteFromClipboard"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnPasteFromClipboard)
    }
}
