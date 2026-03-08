#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDirectMusicDownloadedInstrument.ahk
#Include ..\..\IReferenceClock.ahk
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
     * The ReadBlobFromFile function reads a BLOB in a file.
     * @param {IDirectMusicBuffer} pBuffer 
     * @returns {HRESULT} If the function is successful, the return value is NMERR\_SUCCESS.
     * 
     * If the function is unsuccessful, the return value is a NMERR value that indicates the error.
     * @see https://learn.microsoft.com/windows/win32/NetMon2/readblobfromfile
     */
    Read(pBuffer) {
        result := ComCall(5, this, "ptr", pBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectMusicInstrument} pInstrument 
     * @param {Pointer<DMUS_NOTERANGE>} pNoteRanges 
     * @param {Integer} dwNumNoteRanges 
     * @returns {IDirectMusicDownloadedInstrument} 
     */
    DownloadInstrument(pInstrument, pNoteRanges, dwNumNoteRanges) {
        result := ComCall(6, this, "ptr", pInstrument, "ptr*", &ppDownloadedInstrument := 0, "ptr", pNoteRanges, "uint", dwNumNoteRanges, "HRESULT")
        return IDirectMusicDownloadedInstrument(ppDownloadedInstrument)
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
     * @returns {IReferenceClock} 
     */
    GetLatencyClock() {
        result := ComCall(8, this, "ptr*", &ppClock := 0, "HRESULT")
        return IReferenceClock(ppClock)
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
     * Learn more about: CompactGrbit enumeration
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/extensible-storage-engine/compactgrbit-enumeration
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
     * @remarks
     * To retrieve a handle to the device, you must call the 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function with either the name of a device or 
     *      the name of the driver associated with a device. To specify a device name, use the following format:
     * 
     * \\\\.&#92;<i>DeviceName</i>
     * 
     * <b>DeviceIoControl</b> can accept a handle to a specific 
     *      device. For example, to open a handle to the logical drive A: with 
     *      <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a>, specify \\\\.\a:. Alternatively, you can use the 
     *      names \\\\.\PhysicalDrive0, \\\\.\PhysicalDrive1, and so on, to open handles to the physical drives on a system.
     * 
     * You should specify the <b>FILE_SHARE_READ</b> and 
     *     <b>FILE_SHARE_WRITE</b> access flags when calling 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> to open a handle to a device driver. However, 
     *     when you open a communications resource, such as a serial port, you must specify exclusive access. Use the other 
     *     <b>CreateFile</b> parameters as follows when opening a device 
     *     handle:
     * 
     * <ul>
     * <li>The <i>fdwCreate</i> parameter must specify 
     *       <b>OPEN_EXISTING</b>.</li>
     * <li>The <i>hTemplateFile</i> parameter must be <b>NULL</b>.</li>
     * <li>The <i>fdwAttrsAndFlags</i> parameter can specify 
     *       <b>FILE_FLAG_OVERLAPPED</b> to indicate that the returned handle can be used in overlapped 
     *       (asynchronous) I/O operations.</li>
     * </ul>
     * For lists of supported control codes, see the following topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows-hardware/drivers/storage/cd-rom-io-control-codes">CD-ROM Control Codes</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/DevIO/communications-control-codes">Communications Control Codes</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/DevIO/device-management-control-codes">Device Management Control Codes</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/directory-management-control-codes">Directory Management Control Codes</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/disk-management-control-codes">Disk Management Control Codes</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/file-management-control-codes">File Management Control Codes</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Power/power-management-control-codes">Power Management Control Codes</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/FileIO/volume-management-control-codes">Volume Management Control Codes</a>
     * </li>
     * </ul>
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
     * @returns {HRESULT} If the operation completes successfully, the return value is nonzero (TRUE).
     * 
     * If the operation fails or is pending, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/ioapiset/nf-ioapiset-deviceiocontrol
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
     * The ActivateActCtx function activates the specified activation context.
     * @remarks
     * The <i>lpCookie</i> parameter is later passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-deactivateactctx">DeactivateActCtx</a>, which verifies the pairing of calls to 
     * <b>ActivateActCtx</b> and 
     * <b>DeactivateActCtx</b> and ensures that the appropriate activation context is being deactivated. This is done because the deactivation of activation contexts must occur in the reverse order of activation.
     * 
     * The activation of activation contexts can be understood as pushing an activation context onto a stack of activation contexts. The activation context you activate through this function  redirects any binding to DLLs, window classes, COM servers, type libraries, and mutexes for any side-by-side APIs you call.
     * 
     * The top item of an activation context stack is the active, default-activation context of the current thread. If a null activation context handle is pushed onto the stack, thereby activating it, the default settings in the original manifest override all activation contexts that are lower on the stack.
     * @param {BOOL} fActive 
     * @returns {HRESULT} If the function succeeds, it returns <b>TRUE</b>. Otherwise, it returns <b>FALSE</b>.
     * 
     * This function sets errors that can be retrieved by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. For an example, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/retrieving-the-last-error-code">Retrieving the Last-Error Code</a>. For a complete list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-activateactctx
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
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetFormatProp
     * @param {Pointer<WAVEFORMATEX>} pWaveFormatEx 
     * @param {Pointer<Integer>} pdwWaveFormatExSize 
     * @param {Pointer<Integer>} pdwBufferSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecprops-getformatprop
     */
    GetFormat(pWaveFormatEx, pdwWaveFormatExSize, pdwBufferSize) {
        pdwWaveFormatExSizeMarshal := pdwWaveFormatExSize is VarRef ? "uint*" : "ptr"
        pdwBufferSizeMarshal := pdwBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, "ptr", pWaveFormatEx, pdwWaveFormatExSizeMarshal, pdwWaveFormatExSize, pdwBufferSizeMarshal, pdwBufferSize, "HRESULT")
        return result
    }
}
