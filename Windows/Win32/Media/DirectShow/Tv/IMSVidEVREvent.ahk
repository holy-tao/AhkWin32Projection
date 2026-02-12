#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidOutputDeviceEvent.ahk

/**
 * This topic applies to Windows Vista or later.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidEVREvent)</c>.
 * @see https://learn.microsoft.com/windows/win32/api//content/segment/nn-segment-imsvidevrevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidEVREvent extends IMSVidOutputDeviceEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidEVREvent
     * @type {Guid}
     */
    static IID => Guid("{349abb10-883c-4f22-8714-cecaeee45d62}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnUserEvent"]

    /**
     * This topic applies to Windows Vista or later.
     * @remarks
     * The purpose of this method is to forward custom events from an EVR presenter to the application through the Video Control.
     * 
     * <ol>
     * <li>The presenter calls <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaeventsink-notify">IMediaEventSink::Notify</a> on the EVR with an event code of EC_USER or higher. (This range of values is reserved for custom graph events.)</li>
     * <li>The EVR forwards the event to the Filter Graph Manager.</li>
     * <li>The Filter Graph Manager forwards the event to the Video Control.</li>
     * <li>The Video Control forwards the event to the application by calling <b>OnUserEvent</b>.</li>
     * </ol>
     * The dispatch identifier (dispid) of this method is <b>dispidUserEvent</b>.
     * @param {Integer} lEventCode Event code.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/segment/nf-segment-imsvidevrevent-onuserevent
     */
    OnUserEvent(lEventCode) {
        result := ComCall(8, this, "int", lEventCode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
