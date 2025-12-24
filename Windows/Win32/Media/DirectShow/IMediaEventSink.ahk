#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Notifies the Filter Graph Manager of events that occur within the filter graph.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-imediaeventsink
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaEventSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaEventSink
     * @type {Guid}
     */
    static IID => Guid("{56a868a2-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Notify"]

    /**
     * The Notify method notifies the Filter Graph Manager of an event.
     * @param {Integer} EventCode Identifier of the event.
     * @param {Pointer} EventParam1 First event parameter.
     * @param {Pointer} EventParam2 Second event parameter.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-imediaeventsink-notify
     */
    Notify(EventCode, EventParam1, EventParam2) {
        result := ComCall(3, this, "int", EventCode, "ptr", EventParam1, "ptr", EventParam2, "HRESULT")
        return result
    }
}
