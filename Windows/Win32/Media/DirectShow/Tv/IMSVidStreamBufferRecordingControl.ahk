#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IMSVidStreamBufferRecordingControl interface enables an application to manage a stream buffer recording object through the Video Control.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidStreamBufferRecordingControl)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidstreambufferrecordingcontrol
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidStreamBufferRecordingControl extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidStreamBufferRecordingControl
     * @type {Guid}
     */
    static IID => Guid("{160621aa-bbbc-4326-a824-c395aebc6e74}")

    /**
     * The class identifier for MSVidStreamBufferRecordingControl
     * @type {Guid}
     */
    static CLSID => Guid("{caafdd83-cefc-4e3d-ba03-175f17a24f91}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StartTime", "put_StartTime", "get_StopTime", "put_StopTime", "get_RecordingStopped", "get_RecordingStarted", "get_RecordingType", "get_RecordingAttribute"]

    /**
     * 
     * @param {Pointer<Integer>} rtStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferrecordingcontrol-get_starttime
     */
    get_StartTime(rtStart) {
        result := ComCall(7, this, "int*", rtStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} rtStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferrecordingcontrol-put_starttime
     */
    put_StartTime(rtStart) {
        result := ComCall(8, this, "int", rtStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} rtStop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferrecordingcontrol-get_stoptime
     */
    get_StopTime(rtStop) {
        result := ComCall(9, this, "int*", rtStop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} rtStop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferrecordingcontrol-put_stoptime
     */
    put_StopTime(rtStop) {
        result := ComCall(10, this, "int", rtStop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} phResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferrecordingcontrol-get_recordingstopped
     */
    get_RecordingStopped(phResult) {
        result := ComCall(11, this, "ptr", phResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} phResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferrecordingcontrol-get_recordingstarted
     */
    get_RecordingStarted(phResult) {
        result := ComCall(12, this, "ptr", phResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} dwType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferrecordingcontrol-get_recordingtype
     */
    get_RecordingType(dwType) {
        result := ComCall(13, this, "int*", dwType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pRecordingAttribute 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidstreambufferrecordingcontrol-get_recordingattribute
     */
    get_RecordingAttribute(pRecordingAttribute) {
        result := ComCall(14, this, "ptr*", pRecordingAttribute, "HRESULT")
        return result
    }
}
