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
     * 
     * @param {Pointer<Int32>} rtStart 
     * @returns {HRESULT} 
     */
    get_StartTime(rtStart) {
        result := ComCall(7, this, "int*", rtStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} rtStart 
     * @returns {HRESULT} 
     */
    put_StartTime(rtStart) {
        result := ComCall(8, this, "int", rtStart, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} rtStop 
     * @returns {HRESULT} 
     */
    get_StopTime(rtStop) {
        result := ComCall(9, this, "int*", rtStop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} rtStop 
     * @returns {HRESULT} 
     */
    put_StopTime(rtStop) {
        result := ComCall(10, this, "int", rtStop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} phResult 
     * @returns {HRESULT} 
     */
    get_RecordingStopped(phResult) {
        result := ComCall(11, this, "ptr", phResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} phResult 
     * @returns {HRESULT} 
     */
    get_RecordingStarted(phResult) {
        result := ComCall(12, this, "ptr", phResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} dwType 
     * @returns {HRESULT} 
     */
    get_RecordingType(dwType) {
        result := ComCall(13, this, "int*", dwType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pRecordingAttribute 
     * @returns {HRESULT} 
     */
    get_RecordingAttribute(pRecordingAttribute) {
        result := ComCall(14, this, "ptr", pRecordingAttribute, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
