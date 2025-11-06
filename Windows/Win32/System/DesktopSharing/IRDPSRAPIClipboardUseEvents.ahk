#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Implement this interface on the sharer side to track or control use of the clipboard. If you do not enable clipboard sharing, this interface has no effect. You need to set a value for the SetClipboardRedirectCallback property described in Property.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapiclipboarduseevents
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIClipboardUseEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPIClipboardUseEvents
     * @type {Guid}
     */
    static IID => Guid("{d559f59a-7a27-4138-8763-247ce5f659a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnPasteFromClipboard"]

    /**
     * 
     * @param {Integer} clipboardFormat 
     * @param {IDispatch} pAttendee 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiclipboarduseevents-onpastefromclipboard
     */
    OnPasteFromClipboard(clipboardFormat, pAttendee) {
        result := ComCall(3, this, "uint", clipboardFormat, "ptr", pAttendee, "short*", &pRetVal := 0, "HRESULT")
        return pRetVal
    }
}
