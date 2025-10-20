#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface is deprecated.
 * @see https://docs.microsoft.com/windows/win32/api//mmstream/nn-mmstream-istreamsample
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IStreamSample extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamSample
     * @type {Guid}
     */
    static IID => Guid("{b502d1be-9a57-11d0-8fde-00c04fd9189d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMediaStream", "GetSampleTimes", "SetSampleTimes", "Update", "CompletionStatus"]

    /**
     * 
     * @param {Pointer<IMediaStream>} ppMediaStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-istreamsample-getmediastream
     */
    GetMediaStream(ppMediaStream) {
        result := ComCall(3, this, "ptr*", ppMediaStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pStartTime 
     * @param {Pointer<Integer>} pEndTime 
     * @param {Pointer<Integer>} pCurrentTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-istreamsample-getsampletimes
     */
    GetSampleTimes(pStartTime, pEndTime, pCurrentTime) {
        result := ComCall(4, this, "int64*", pStartTime, "int64*", pEndTime, "int64*", pCurrentTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pStartTime 
     * @param {Pointer<Integer>} pEndTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-istreamsample-setsampletimes
     */
    SetSampleTimes(pStartTime, pEndTime) {
        result := ComCall(5, this, "int64*", pStartTime, "int64*", pEndTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {HANDLE} hEvent 
     * @param {Pointer<PAPCFUNC>} pfnAPC 
     * @param {Pointer} dwAPCData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-istreamsample-update
     */
    Update(dwFlags, hEvent, pfnAPC, dwAPCData) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(6, this, "uint", dwFlags, "ptr", hEvent, "ptr", pfnAPC, "ptr", dwAPCData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} dwMilliseconds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmstream/nf-mmstream-istreamsample-completionstatus
     */
    CompletionStatus(dwFlags, dwMilliseconds) {
        result := ComCall(7, this, "uint", dwFlags, "uint", dwMilliseconds, "HRESULT")
        return result
    }
}
