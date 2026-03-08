#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpObjectToken.ahk
#Include .\ISpStreamFormat.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\ISpEventSource.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpVoice extends ISpEventSource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpVoice
     * @type {Guid}
     */
    static IID => Guid("{6c44df74-72b9-4992-a1ec-ef996e0422d4}")

    /**
     * The class identifier for SpVoice
     * @type {Guid}
     */
    static CLSID => Guid("{96749377-3391-11d2-9ee3-00c04f797396}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetOutput", "GetOutputObjectToken", "GetOutputStream", "Pause", "Resume", "SetVoice", "GetVoice", "Speak", "SpeakStream", "GetStatus", "Skip", "SetPriority", "GetPriority", "SetAlertBoundary", "GetAlertBoundary", "SetRate", "GetRate", "SetVolume", "GetVolume", "WaitUntilDone", "SetSyncSpeakTimeout", "GetSyncSpeakTimeout", "SpeakCompleteEvent", "IsUISupported", "DisplayUI"]

    /**
     * 
     * @param {IUnknown} pUnkOutput 
     * @param {BOOL} fAllowFormatChanges 
     * @returns {HRESULT} 
     */
    SetOutput(pUnkOutput, fAllowFormatChanges) {
        result := ComCall(13, this, "ptr", pUnkOutput, "int", fAllowFormatChanges, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISpObjectToken} 
     */
    GetOutputObjectToken() {
        result := ComCall(14, this, "ptr*", &ppObjectToken := 0, "HRESULT")
        return ISpObjectToken(ppObjectToken)
    }

    /**
     * 
     * @returns {ISpStreamFormat} 
     */
    GetOutputStream() {
        result := ComCall(15, this, "ptr*", &ppStream := 0, "HRESULT")
        return ISpStreamFormat(ppStream)
    }

    /**
     * The Pause method pauses playback at the current location.
     * @remarks
     * If playback is already paused, this method does nothing.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/pause-method
     */
    Pause() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * The Resume method resumes playback after a menu has been displayed.
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/DirectShow/resume-method
     */
    Resume() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISpObjectToken} pToken 
     * @returns {HRESULT} 
     */
    SetVoice(pToken) {
        result := ComCall(18, this, "ptr", pToken, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ISpObjectToken} 
     */
    GetVoice() {
        result := ComCall(19, this, "ptr*", &ppToken := 0, "HRESULT")
        return ISpObjectToken(ppToken)
    }

    /**
     * 
     * @param {PWSTR} pwcs 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    Speak(pwcs, dwFlags) {
        pwcs := pwcs is String ? StrPtr(pwcs) : pwcs

        result := ComCall(20, this, "ptr", pwcs, "uint", dwFlags, "uint*", &pulStreamNumber := 0, "HRESULT")
        return pulStreamNumber
    }

    /**
     * 
     * @param {IStream} pStream 
     * @param {Integer} dwFlags 
     * @returns {Integer} 
     */
    SpeakStream(pStream, dwFlags) {
        result := ComCall(21, this, "ptr", pStream, "uint", dwFlags, "uint*", &pulStreamNumber := 0, "HRESULT")
        return pulStreamNumber
    }

    /**
     * 
     * @param {Pointer<SPVOICESTATUS>} pStatus 
     * @returns {PWSTR} 
     */
    GetStatus(pStatus) {
        result := ComCall(22, this, "ptr", pStatus, "ptr*", &ppszLastBookmark := 0, "HRESULT")
        return ppszLastBookmark
    }

    /**
     * Determines which pointer input frame generated the most recently retrieved message for the specified pointer and discards any queued (unretrieved) pointer input messages generated from the same pointer input frame.
     * @remarks
     * Parallel-mode devices may report pointer input in frames, that is, they may report the state and position of all pointers from that device in a single input report to the system. Ideally, applications should view the entire frame as a single input unless the application-specific requirements dictate otherwise.
     * 
     * The <b>SkipPointerFrameMessages</b> function can be used in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframeinfo">GetPointerFrameInfo</a> function (or one of its type-specific variants) to consume entire frames as a single input.
     * 
     * When an application sees a pointer message, it can use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getpointerframeinfo">GetPointerFrameInfo</a> function to retrieve the entire pointer input frame to which the pointer message belongs, hence obtaining an updated view of all of the pointers currently owned by the window. Note that the returned frame contains only pointers that are currently owned by the same window as the specified pointer.
     * 
     * Having retrieved the entire frame of information, the application can then call the <b>SkipPointerFrameMessages</b> function to skip remaining pointer messages associated with this frame that are pending retrieval. This saves the application the overhead of retrieving and processing the remaining messages one by one.
     * 
     * <div class="alert"><b>Warning</b>  The <b>SkipPointerFrameMessages</b> function should be used only when the caller can be sure that no other entity on the caller’s thread (such as  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a>) is expecting to retrieve pending pointer messages. For this reason, <b>SkipPointerFrameMessages</b> should not be used in conjunction with Direct Manipulation when processing multiple, simultaneous interactions.</div>
     * <div> </div>
     * Note that the information retrieved is associated with the pointer frame most recently retrieved by the calling thread. Once the calling thread retrieves its next message, the information associated with the previous pointer frame may no longer be available.
     * 
     * If the pointer frame contains no additional pointers besides the specified pointer, this function succeeds with no action.
     * 
     * If the calling thread does not own the window to which the pointer message has been delivered, this function fails with the last error set to <b>ERROR_ACCESS_DENIED</b>.
     * @param {PWSTR} pItemType 
     * @param {Integer} lNumItems 
     * @param {Pointer<Integer>} pulNumSkipped 
     * @returns {HRESULT} If the function succeeds, the return value is non-zero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-skippointerframemessages
     */
    Skip(pItemType, lNumItems, pulNumSkipped) {
        pItemType := pItemType is String ? StrPtr(pItemType) : pItemType

        pulNumSkippedMarshal := pulNumSkipped is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, "ptr", pItemType, "int", lNumItems, pulNumSkippedMarshal, pulNumSkipped, "HRESULT")
        return result
    }

    /**
     * Sets the priority class for the specified process. This value together with the priority value of each thread of the process determines each thread's base priority level.
     * @remarks
     * Every thread has a base priority level determined by the thread's priority value and the priority class of its process. The system uses the base priority level of all executable threads to determine which thread gets the next slice of CPU time. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setthreadpriority">SetThreadPriority</a> function enables setting the base priority level of a thread relative to the priority class of its process. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ProcThread/scheduling-priorities">Scheduling Priorities</a>.
     * 
     * The <b>*_PRIORITY_CLASS</b> values affect the CPU scheduling priority of the process. For processes that perform background work such as file I/O, network I/O, or data processing, it is not sufficient to adjust the CPU scheduling priority; even an idle CPU priority process can easily interfere with system responsiveness when it uses the disk and memory. Processes that perform background work should use the <b>PROCESS_MODE_BACKGROUND_BEGIN</b> and <b>PROCESS_MODE_BACKGROUND_END</b> values to adjust their resource scheduling priorities; processes that interact with the user should not use <b>PROCESS_MODE_BACKGROUND_BEGIN</b>.
     * 
     * If a process is in background processing mode, the new threads it creates will also be in background processing mode. When a thread is in background processing mode, it should minimize sharing resources such as critical sections, heaps, and handles with other threads in the process, otherwise priority inversions can occur. If there are threads executing at high priority, a thread in background processing mode may not be scheduled promptly, but it will never be starved.
     * 
     * Each  thread can enter background processing mode independently using <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-setthreadpriority">SetThreadPriority</a>. Do not call <b>SetPriorityClass</b> to enter background processing mode after a thread in the process has called <b>SetThreadPriority</b> to enter background processing mode. After a process ends background processing mode, it resets all threads in the process; however, it is not possible for the process to know which threads were already in background processing mode.
     * @param {Integer} ePriority 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-setpriorityclass
     */
    SetPriority(ePriority) {
        result := ComCall(24, this, "int", ePriority, "HRESULT")
        return result
    }

    /**
     * Retrieves the priority class for the specified process. This value, together with the priority value of each thread of the process, determines each thread's base priority level.
     * @remarks
     * Every thread has a base priority level determined by the thread's priority value and the priority class of its process. The operating system uses the base priority level of all executable threads to determine which thread gets the next slice of CPU time. Threads are scheduled in a round-robin fashion at each priority level, and only when there are no executable threads at a higher level will scheduling of threads at a lower level take place.
     * 
     * For a table that shows the base priority levels for each combination of priority class and thread priority value, see <a href="https://docs.microsoft.com/windows/desktop/ProcThread/scheduling-priorities">Scheduling Priorities</a>.
     * 
     * Priority class is maintained by the executive, so all processes have a priority class that can be queried.
     * @param {Pointer<Integer>} pePriority 
     * @returns {HRESULT} If the function succeeds, the return value is the priority class of the specified process.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The process's priority class is one of the following values.
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ABOVE_NORMAL_PRIORITY_CLASS</b></dt>
     * <dt>0x00008000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Process that has priority above <b>NORMAL_PRIORITY_CLASS</b> but below <b>HIGH_PRIORITY_CLASS</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>BELOW_NORMAL_PRIORITY_CLASS</b></dt>
     * <dt>0x00004000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Process that has priority above <b>IDLE_PRIORITY_CLASS</b> but below <b>NORMAL_PRIORITY_CLASS</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HIGH_PRIORITY_CLASS</b></dt>
     * <dt>0x00000080</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Process that performs time-critical tasks that must be executed immediately for it to run correctly. The threads of a high-priority class process preempt the threads of normal or idle priority class processes. An example is the Task List, which must respond quickly when called by the user, regardless of the load on the operating system. Use extreme care when using the high-priority class, because a high-priority class CPU-bound application can use nearly all available cycles.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>IDLE_PRIORITY_CLASS</b></dt>
     * <dt>0x00000040</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Process whose threads run only when the system is idle and are preempted by the threads of any process running in a higher priority class. An example is a screen saver. The idle priority class is inherited by child processes.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NORMAL_PRIORITY_CLASS</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Process with no special scheduling needs.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>REALTIME_PRIORITY_CLASS</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Process that has the highest possible priority. The threads of a real-time priority class process preempt the threads of all other processes, including operating system processes performing important tasks. For example, a real-time process that executes for more than a very brief interval can cause disk caches not to flush or cause the mouse to be unresponsive.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/nf-processthreadsapi-getpriorityclass
     */
    GetPriority(pePriority) {
        pePriorityMarshal := pePriority is VarRef ? "int*" : "ptr"

        result := ComCall(25, this, pePriorityMarshal, pePriority, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} eBoundary 
     * @returns {HRESULT} 
     */
    SetAlertBoundary(eBoundary) {
        result := ComCall(26, this, "int", eBoundary, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} peBoundary 
     * @returns {HRESULT} 
     */
    GetAlertBoundary(peBoundary) {
        peBoundaryMarshal := peBoundary is VarRef ? "int*" : "ptr"

        result := ComCall(27, this, peBoundaryMarshal, peBoundary, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} RateAdjust 
     * @returns {HRESULT} 
     */
    SetRate(RateAdjust) {
        result := ComCall(28, this, "int", RateAdjust, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRateAdjust 
     * @returns {HRESULT} 
     */
    GetRate(pRateAdjust) {
        pRateAdjustMarshal := pRateAdjust is VarRef ? "int*" : "ptr"

        result := ComCall(29, this, pRateAdjustMarshal, pRateAdjust, "HRESULT")
        return result
    }

    /**
     * Sets the label of a file system volume. (ANSI)
     * @remarks
     * The maximum volume label length is 32 characters.
     * 
     * <b>FAT filesystems:  </b>The maximum volume label length is 11 characters.
     * 
     * A label is a user-friendly name that a user assigns to a volume to make it easier to recognize. A volume can 
     *     have a label, a drive letter, both, or neither. For more information, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/FileIO/naming-a-volume">Naming a Volume</a>.
     * 
     * In Windows 8 and Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * No
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * No
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * No
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * SMB does not support volume management functions.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines SetVolumeLabel as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Integer} usVolume 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-setvolumelabela
     */
    SetVolume(usVolume) {
        result := ComCall(30, this, "ushort", usVolume, "HRESULT")
        return result
    }

    /**
     * Retrieves information about the file system and volume associated with the specified root directory. (ANSI)
     * @remarks
     * When a user attempts to get information about a floppy drive that does not have a floppy disk, or a CD-ROM
     *      drive that does not have a compact disc, the system displays a message box for the user to insert a floppy disk
     *      or a compact disc, respectively. To prevent the system from displaying this message box, call the
     *      <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-seterrormode">SetErrorMode</a> function with
     *      <b>SEM_FAILCRITICALERRORS</b>.
     * 
     * The <b>FILE_VOL_IS_COMPRESSED</b> flag is the only indicator of volume-based compression. The
     *      file system name is not altered to indicate compression, for example, this flag is returned set on a DoubleSpace
     *      volume. When compression is volume-based, an entire volume is  compressed or not compressed.
     * 
     * The <b>FILE_FILE_COMPRESSION</b> flag indicates whether a file system supports file-based
     *      compression. When compression is file-based, individual files can be compressed or not compressed.
     * 
     * The <b>FILE_FILE_COMPRESSION</b> and <b>FILE_VOL_IS_COMPRESSED</b> flags are
     *      mutually exclusive. Both bits cannot be returned set.
     * 
     * The maximum component length value that is stored in <i>lpMaximumComponentLength</i> is the
     *      only indicator that a volume supports longer-than-normal FAT file system (or other file system) file names. The
     *      file system name is not altered to indicate support for long file names.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getcompressedfilesizea">GetCompressedFileSize</a> function obtains the
     *      compressed size of a file. The <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-getfileattributesa">GetFileAttributes</a>
     *      function can determine whether an individual file is compressed.
     * 
     * Symbolic link behavior—
     * 
     * If the path points to a symbolic link, the function returns volume information for the target.
     * 
     * Starting with Windows 8 and Windows Server 2012, this function is supported by the following technologies.
     * 
     * <table>
     * <tr>
     * <th>Technology</th>
     * <th>Supported</th>
     * </tr>
     * <tr>
     * <td>
     * Server Message Block (SMB) 3.0 protocol
     * 
     * </td>
     * <td>
     * No
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * No
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * No
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Cluster Shared Volume File System (CsvFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * Resilient File System (ReFS)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * SMB does not support volume management functions.
     * 
     * <h3><a id="Transacted_Operations"></a><a id="transacted_operations"></a><a id="TRANSACTED_OPERATIONS"></a>Transacted Operations</h3>
     * If the volume supports file system transactions, the function returns
     *       <b>FILE_SUPPORTS_TRANSACTIONS</b> in <i>lpFileSystemFlags</i>.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The fileapi.h header defines GetVolumeInformation as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Integer>} pusVolume 
     * @returns {HRESULT} If all the requested information is retrieved, the return value is nonzero.
     * 
     * If not all the requested information is retrieved, the return value is zero. To get extended error
     *        information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-getvolumeinformationa
     */
    GetVolume(pusVolume) {
        pusVolumeMarshal := pusVolume is VarRef ? "ushort*" : "ptr"

        result := ComCall(31, this, pusVolumeMarshal, pusVolume, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} msTimeout 
     * @returns {HRESULT} 
     */
    WaitUntilDone(msTimeout) {
        result := ComCall(32, this, "uint", msTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} msTimeout 
     * @returns {HRESULT} 
     */
    SetSyncSpeakTimeout(msTimeout) {
        result := ComCall(33, this, "uint", msTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pmsTimeout 
     * @returns {HRESULT} 
     */
    GetSyncSpeakTimeout(pmsTimeout) {
        pmsTimeoutMarshal := pmsTimeout is VarRef ? "uint*" : "ptr"

        result := ComCall(34, this, pmsTimeoutMarshal, pmsTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HANDLE} 
     */
    SpeakCompleteEvent() {
        result := ComCall(35, this, "ptr")
        resultHandle := HANDLE({Value: result}, True)
        return resultHandle
    }

    /**
     * 
     * @param {PWSTR} pszTypeOfUI 
     * @param {Pointer<Void>} pvExtraData 
     * @param {Integer} cbExtraData 
     * @param {Pointer<BOOL>} pfSupported 
     * @returns {HRESULT} 
     */
    IsUISupported(pszTypeOfUI, pvExtraData, cbExtraData, pfSupported) {
        pszTypeOfUI := pszTypeOfUI is String ? StrPtr(pszTypeOfUI) : pszTypeOfUI

        pvExtraDataMarshal := pvExtraData is VarRef ? "ptr" : "ptr"
        pfSupportedMarshal := pfSupported is VarRef ? "int*" : "ptr"

        result := ComCall(36, this, "ptr", pszTypeOfUI, pvExtraDataMarshal, pvExtraData, "uint", cbExtraData, pfSupportedMarshal, pfSupported, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {PWSTR} pszTitle 
     * @param {PWSTR} pszTypeOfUI 
     * @param {Pointer<Void>} pvExtraData 
     * @param {Integer} cbExtraData 
     * @returns {HRESULT} 
     */
    DisplayUI(hwndParent, pszTitle, pszTypeOfUI, pvExtraData, cbExtraData) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle
        pszTypeOfUI := pszTypeOfUI is String ? StrPtr(pszTypeOfUI) : pszTypeOfUI

        pvExtraDataMarshal := pvExtraData is VarRef ? "ptr" : "ptr"

        result := ComCall(37, this, "ptr", hwndParent, "ptr", pszTitle, "ptr", pszTypeOfUI, pvExtraDataMarshal, pvExtraData, "uint", cbExtraData, "HRESULT")
        return result
    }
}
