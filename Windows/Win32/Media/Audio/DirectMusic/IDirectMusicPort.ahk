#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class IDirectMusicPort extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectMusicPort
     * @type {Guid}
     */
    static IID => Guid("{08f2d8c9-37c2-11d2-b9f9-0000f875ac12}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PlayBuffer", "SetReadNotificationHandle", "Read", "DownloadInstrument", "UnloadInstrument", "GetLatencyClock", "GetRunningStats", "Compact", "GetCaps", "DeviceIoControl", "SetNumChannelGroups", "GetNumChannelGroups", "Activate", "SetChannelPriority", "GetChannelPriority", "SetDirectSound", "GetFormat"]

    /**
     * 
     * @param {IDirectMusicBuffer} pBuffer 
     * @returns {HRESULT} 
     */
    PlayBuffer(pBuffer) {
        result := ComCall(3, this, "ptr", pBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HANDLE} hEvent 
     * @returns {HRESULT} 
     */
    SetReadNotificationHandle(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(4, this, "ptr", hEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectMusicBuffer} pBuffer 
     * @returns {HRESULT} 
     */
    Read(pBuffer) {
        result := ComCall(5, this, "ptr", pBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectMusicInstrument} pInstrument 
     * @param {Pointer<IDirectMusicDownloadedInstrument>} ppDownloadedInstrument 
     * @param {Pointer<DMUS_NOTERANGE>} pNoteRanges 
     * @param {Integer} dwNumNoteRanges 
     * @returns {HRESULT} 
     */
    DownloadInstrument(pInstrument, ppDownloadedInstrument, pNoteRanges, dwNumNoteRanges) {
        result := ComCall(6, this, "ptr", pInstrument, "ptr*", ppDownloadedInstrument, "ptr", pNoteRanges, "uint", dwNumNoteRanges, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectMusicDownloadedInstrument} pDownloadedInstrument 
     * @returns {HRESULT} 
     */
    UnloadInstrument(pDownloadedInstrument) {
        result := ComCall(7, this, "ptr", pDownloadedInstrument, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IReferenceClock>} ppClock 
     * @returns {HRESULT} 
     */
    GetLatencyClock(ppClock) {
        result := ComCall(8, this, "ptr*", ppClock, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DMUS_SYNTHSTATS>} pStats 
     * @returns {HRESULT} 
     */
    GetRunningStats(pStats) {
        result := ComCall(9, this, "ptr", pStats, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Compact() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DMUS_PORTCAPS>} pPortCaps 
     * @returns {HRESULT} 
     */
    GetCaps(pPortCaps) {
        result := ComCall(11, this, "ptr", pPortCaps, "HRESULT")
        return result
    }

    /**
     * Sends a control code directly to a specified device driver, causing the corresponding device to perform the corresponding operation.
     * @param {Integer} dwIoControlCode The control code for the operation. This value identifies the specific operation to be performed and the 
     *        type of device on which to perform it.
     * 
     * For a list of the control codes, see Remarks. The documentation for each control code provides usage details 
     *        for the <i>lpInBuffer</i>, <i>nInBufferSize</i>, 
     *        <i>lpOutBuffer</i>, and <i>nOutBufferSize</i> parameters.
     * @param {Pointer<Void>} lpInBuffer A pointer to the input buffer that contains the data required to perform the operation. The format of this 
     *        data depends on the value of the <i>dwIoControlCode</i> parameter.
     * 
     * This parameter can be <b>NULL</b> if <i>dwIoControlCode</i> specifies 
     *        an operation that does not require input data.
     * @param {Integer} nInBufferSize The size of the input buffer, in bytes.
     * @param {Pointer<Void>} lpOutBuffer A pointer to the output buffer that is to receive the data returned by the operation. The format of this 
     *        data depends on the value of the <i>dwIoControlCode</i> parameter.
     * 
     * This parameter can be <b>NULL</b> if <i>dwIoControlCode</i> specifies 
     *        an operation that does not return data.
     * @param {Integer} nOutBufferSize The size of the output buffer, in bytes.
     * @param {Pointer<Integer>} lpBytesReturned A pointer to a variable that receives the size of the data stored in the output buffer, in bytes.
     * 
     * If the output buffer is too small to receive any data,  the call fails, 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 
     *        <b>ERROR_INSUFFICIENT_BUFFER</b>, and <i>lpBytesReturned</i> is zero.
     * 
     * If the output buffer is too small to hold all of the data but can hold some entries, some drivers will return 
     *        as much data as fits. In this case, the call fails, 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns 
     *        <b>ERROR_MORE_DATA</b>, and <i>lpBytesReturned</i> indicates the amount 
     *        of data received. Your application should call 
     *        <b>DeviceIoControl</b> again with the same operation, 
     *        specifying a new starting point.
     * 
     * If <i>lpOverlapped</i> is <b>NULL</b>, 
     *        <i>lpBytesReturned</i> cannot be <b>NULL</b>. Even when an operation 
     *        returns no output data and <i>lpOutBuffer</i> is <b>NULL</b>, 
     *        <b>DeviceIoControl</b> makes use of 
     *        <i>lpBytesReturned</i>. After such an operation, the value of 
     *        <i>lpBytesReturned</i> is meaningless.
     * 
     * If <i>lpOverlapped</i> is not <b>NULL</b>, 
     *        <i>lpBytesReturned</i> can be <b>NULL</b>. If this parameter is not 
     *        <b>NULL</b> and the operation returns data, <i>lpBytesReturned</i> is 
     *        meaningless until the overlapped operation has completed. To retrieve the number of bytes returned, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a>. If 
     *        <i>hDevice</i> is associated with an I/O completion port, you can retrieve the number of 
     *        bytes returned by calling 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a>.
     * @param {Pointer<OVERLAPPED>} lpOverlapped A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure.
     * 
     * If <i>hDevice</i> was opened without specifying 
     *        <b>FILE_FLAG_OVERLAPPED</b>, <i>lpOverlapped</i> is ignored.
     * 
     * If <i>hDevice</i> was opened with the <b>FILE_FLAG_OVERLAPPED</b> flag, 
     *        the operation is performed as an overlapped (asynchronous) operation. In this case, 
     *        <i>lpOverlapped</i> must point to a valid 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure that contains a handle to an 
     *        event object. Otherwise, the function fails in unpredictable ways.
     * 
     * For overlapped operations, 
     *        <b>DeviceIoControl</b> returns immediately, and the event 
     *        object is signaled when the operation has been completed. Otherwise, the function does not return until the 
     *        operation has been completed or an error occurs.
     * @returns {HRESULT} If the operation completes successfully, the return value is nonzero.
     * 
     * If the operation fails or is pending, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//ioapiset/nf-ioapiset-deviceiocontrol
     */
    DeviceIoControl(dwIoControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned, lpOverlapped) {
        lpInBufferMarshal := lpInBuffer is VarRef ? "ptr" : "ptr"
        lpOutBufferMarshal := lpOutBuffer is VarRef ? "ptr" : "ptr"
        lpBytesReturnedMarshal := lpBytesReturned is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "uint", dwIoControlCode, lpInBufferMarshal, lpInBuffer, "uint", nInBufferSize, lpOutBufferMarshal, lpOutBuffer, "uint", nOutBufferSize, lpBytesReturnedMarshal, lpBytesReturned, "ptr", lpOverlapped, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwChannelGroups 
     * @returns {HRESULT} 
     */
    SetNumChannelGroups(dwChannelGroups) {
        result := ComCall(13, this, "uint", dwChannelGroups, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwChannelGroups 
     * @returns {HRESULT} 
     */
    GetNumChannelGroups(pdwChannelGroups) {
        pdwChannelGroupsMarshal := pdwChannelGroups is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pdwChannelGroupsMarshal, pdwChannelGroups, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fActive 
     * @returns {HRESULT} 
     */
    Activate(fActive) {
        result := ComCall(15, this, "int", fActive, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwChannelGroup 
     * @param {Integer} dwChannel 
     * @param {Integer} dwPriority 
     * @returns {HRESULT} 
     */
    SetChannelPriority(dwChannelGroup, dwChannel, dwPriority) {
        result := ComCall(16, this, "uint", dwChannelGroup, "uint", dwChannel, "uint", dwPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwChannelGroup 
     * @param {Integer} dwChannel 
     * @param {Pointer<Integer>} pdwPriority 
     * @returns {HRESULT} 
     */
    GetChannelPriority(dwChannelGroup, dwChannel, pdwPriority) {
        pdwPriorityMarshal := pdwPriority is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, "uint", dwChannelGroup, "uint", dwChannel, pdwPriorityMarshal, pdwPriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectSound} pDirectSound 
     * @param {IDirectSoundBuffer} pDirectSoundBuffer 
     * @returns {HRESULT} 
     */
    SetDirectSound(pDirectSound, pDirectSoundBuffer) {
        result := ComCall(18, this, "ptr", pDirectSound, "ptr", pDirectSoundBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatEx 
     * @param {Pointer<Integer>} pdwWaveFormatExSize 
     * @param {Pointer<Integer>} pdwBufferSize 
     * @returns {HRESULT} 
     */
    GetFormat(pWaveFormatEx, pdwWaveFormatExSize, pdwBufferSize) {
        pdwWaveFormatExSizeMarshal := pdwWaveFormatExSize is VarRef ? "uint*" : "ptr"
        pdwBufferSizeMarshal := pdwBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, "ptr", pWaveFormatEx, pdwWaveFormatExSizeMarshal, pdwWaveFormatExSize, pdwBufferSizeMarshal, pdwBufferSize, "HRESULT")
        return result
    }
}
