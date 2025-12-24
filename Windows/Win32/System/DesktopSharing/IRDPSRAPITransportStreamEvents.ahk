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
     * Notifies the Remote Desktop Protocol (RDP) stack that a write operation has completed.
     * @param {IRDPSRAPITransportStreamBuffer} pBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreambuffer">IRDPSRAPITransportStreamBuffer</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreambuffer">IRDPSRAPITransportStreamBuffer</a> interface pointer that represents the stream buffer that was written.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapitransportstreamevents-onwritecompleted
     */
    OnWriteCompleted(pBuffer) {
        ComCall(3, this, "ptr", pBuffer)
    }

    /**
     * Notifies the Remote Desktop Protocol (RDP) stack that a read operation has completed.
     * @param {IRDPSRAPITransportStreamBuffer} pBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreambuffer">IRDPSRAPITransportStreamBuffer</a>*</b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/rdpencomapi/nn-rdpencomapi-irdpsrapitransportstreambuffer">IRDPSRAPITransportStreamBuffer</a> interface pointer that represents the stream buffer that was read.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapitransportstreamevents-onreadcompleted
     */
    OnReadCompleted(pBuffer) {
        ComCall(4, this, "ptr", pBuffer)
    }

    /**
     * Notifies the Remote Desktop Protocol (RDP) stack that the connection was closed.
     * @param {HRESULT} hrReason Type: <b>HRESULT</b>
     * 
     * An <b>HRESULT</b> value that specifies if the stream was closed normally or due to an error. Contains <b>S_OK</b> if the stream was closed normally or an error code otherwise.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nf-rdpencomapi-irdpsrapitransportstreamevents-onstreamclosed
     */
    OnStreamClosed(hrReason) {
        ComCall(5, this, "int", hrReason)
    }
}
