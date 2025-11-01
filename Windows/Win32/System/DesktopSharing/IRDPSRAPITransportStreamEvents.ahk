#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods called by the stream interface (IRDPSRAPITransportStream) to notify the Remote Desktop Protocol (RDP) stack about the completion of events.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreamevents
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPITransportStreamEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPITransportStreamEvents
     * @type {Guid}
     */
    static IID => Guid("{ea81c254-f5af-4e40-982e-3e63bb595276}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnWriteCompleted", "OnReadCompleted", "OnStreamClosed"]

    /**
     * 
     * @param {IRDPSRAPITransportStreamBuffer} pBuffer 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitransportstreamevents-onwritecompleted
     */
    OnWriteCompleted(pBuffer) {
        ComCall(3, this, "ptr", pBuffer)
    }

    /**
     * 
     * @param {IRDPSRAPITransportStreamBuffer} pBuffer 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitransportstreamevents-onreadcompleted
     */
    OnReadCompleted(pBuffer) {
        ComCall(4, this, "ptr", pBuffer)
    }

    /**
     * 
     * @param {HRESULT} hrReason 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitransportstreamevents-onstreamclosed
     */
    OnStreamClosed(hrReason) {
        ComCall(5, this, "int", hrReason)
    }
}
