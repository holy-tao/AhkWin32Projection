#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPServices interface is implemented by Windows Media Player. It provides methods to retrieve the current stream state and current stream time.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmpservices/nn-wmpservices-iwmpservices
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPServices extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPServices
     * @type {Guid}
     */
    static IID => Guid("{afb6b76b-1e20-4198-83b3-191db6e0b149}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamTime", "GetStreamState"]

    /**
     * The IWMPServices::GetStreamTime method retrieves a structure indicating the current stream time.
     * @remarks
     * The current stream time is determined by Windows Media Player. This means that the value returned by this method do not necessarily represent the elapsed time relative to the beginning of the file. For instance, if the user moves the trackbar in the Player to seek the media to a new position, the value returned by this method returns the time elapsed since the media began playing from the new position. Changes in playback rate will also affect the value returned by this method.
     * 
     * The values provided in the <b>rtTimestamp</b> member of <b>IMediaObject::ProcessInput</b> and the <b>rtTimestamp</b> member of the <b>DMO_OUTPUT_DATA_BUFFER</b> structure supplied by <b>IMediaObject::ProcessOutput</b> contain values that indicate when the data provided in the buffer will be rendered relative to the current stream time. Therefore, these values also do not necessarily represent the elapsed time relative to the beginning of the file file or the presentation time specified in the file.
     * @param {Pointer<Integer>} prt Pointer to a <b>REFERENCE_TIME</b> structure.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmpservices/nf-wmpservices-iwmpservices-getstreamtime
     */
    GetStreamTime(prt) {
        prtMarshal := prt is VarRef ? "int64*" : "ptr"

        result := ComCall(3, this, prtMarshal, prt, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IWMPServices::GetStreamState method retrieves information about the current play state of the stream.
     * @remarks
     * The stream is stopped, paused, or playing.
     * @param {Pointer<Integer>} pState A pointer to a <b>WMPServices_StreamState</b> enumeration value.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmpservices/nf-wmpservices-iwmpservices-getstreamstate
     */
    GetStreamState(pState) {
        pStateMarshal := pState is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pStateMarshal, pState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
