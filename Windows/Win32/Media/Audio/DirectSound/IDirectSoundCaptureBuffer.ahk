#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\DSCBCAPS.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundCaptureBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectSoundCaptureBuffer
     * @type {Guid}
     */
    static IID => Guid("{b0210782-89cd-11d0-af08-00a0c925cd16}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCaps", "GetCurrentPosition", "GetFormat", "GetStatus", "Initialize", "Lock", "Start", "Stop", "Unlock"]

    /**
     * 
     * @returns {DSCBCAPS} 
     */
    GetCaps() {
        pDSCBCaps := DSCBCAPS()
        result := ComCall(3, this, "ptr", pDSCBCaps, "HRESULT")
        return pDSCBCaps
    }

    /**
     * The GetCurrentPositionEx function retrieves the current position in logical coordinates.
     * @param {Pointer<Integer>} pdwCapturePosition 
     * @param {Pointer<Integer>} pdwReadPosition 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-getcurrentpositionex
     */
    GetCurrentPosition(pdwCapturePosition, pdwReadPosition) {
        pdwCapturePositionMarshal := pdwCapturePosition is VarRef ? "uint*" : "ptr"
        pdwReadPositionMarshal := pdwReadPosition is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwCapturePositionMarshal, pdwCapturePosition, pdwReadPositionMarshal, pdwReadPosition, "HRESULT")
        return result
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetFormatProp
     * @param {Pointer} pwfxFormat 
     * @param {Integer} dwSizeAllocated 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/iwmcodecprops-getformatprop
     */
    GetFormat(pwfxFormat, dwSizeAllocated) {
        result := ComCall(5, this, "ptr", pwfxFormat, "uint", dwSizeAllocated, "uint*", &pdwSizeWritten := 0, "HRESULT")
        return pdwSizeWritten
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetStatus() {
        result := ComCall(6, this, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @remarks
     * <b>Windows::Foundation::Initialize</b> is changed to create 
     *     ASTAs instead of classic STAs for the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/ne-roapi-ro_init_type">RO_INIT_TYPE</a> 
     *     value <b>RO_INIT_SINGLETHREADED</b>. 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_SINGLETHREADED</b>) 
     *     is not supported for desktop applications and will return <b>CO_E_NOTSUPPORTED</b> if called 
     *     from a process other than a Windows Store app.
     * 
     * For Microsoft DirectX applications, you must initialize the initial thread by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * 
     * For an out-of-process EXE server,  you must initialize the initial thread of the server by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * @param {IDirectSoundCapture} pDirectSoundCapture 
     * @param {Pointer<DSCBUFFERDESC>} pcDSCBufferDesc 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize(pDirectSoundCapture, pcDSCBufferDesc) {
        result := ComCall(7, this, "ptr", pDirectSoundCapture, "ptr", pcDSCBufferDesc, "HRESULT")
        return result
    }

    /**
     * Dismounts the volume and removes the volume's encryption key from system memory.
     * @remarks
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @param {Integer} dwOffset 
     * @param {Integer} dwBytes 
     * @param {Pointer<Pointer<Void>>} ppvAudioPtr1 
     * @param {Pointer<Integer>} pdwAudioBytes1 
     * @param {Pointer<Pointer<Void>>} ppvAudioPtr2 
     * @param {Pointer<Integer>} pdwAudioBytes2 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} Type: **uint32**
     * 
     * This method returns one of the following codes or another error code if it fails.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                                                           | Description                                                                                                                                                               |
     * |---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl>                                           | The method was successful.<br/>                                                                                                                                     |
     * | <dl> <dt>**E\_ACCESS\_DENIED**</dt> <dt>2147942405 (0x80070005)</dt> </dl>               | Applications are accessing this volume. If all access is nonexclusive, specifying the *ForceDismount* parameter as true allows the method to run successfully.<br/> |
     * | <dl> <dt>**FVE\_E\_NOT\_ENCRYPTED**</dt> <dt>2150694913 (0x80310001)</dt> </dl>          | The volume is fully decrypted and cannot be locked.<br/>                                                                                                            |
     * | <dl> <dt>**FVE\_E\_PROTECTION\_DISABLED**</dt> <dt>2150694945 (0x80310021)</dt> </dl>    | The volume's encryption key is available in the clear on the disk, preventing the volume from being locked.<br/>                                                    |
     * | <dl> <dt>**FVE\_E\_RECOVERY\_KEY\_REQUIRED**</dt> <dt>2150694946 (0x80310022)</dt> </dl> | The volume does not have key protectors of the type "Numerical Password" or "External Key" that are necessary to unlock the volume.<br/>                            |
     * @see https://learn.microsoft.com/windows/win32/SecProv/lock-win32-encryptablevolume
     */
    Lock(dwOffset, dwBytes, ppvAudioPtr1, pdwAudioBytes1, ppvAudioPtr2, pdwAudioBytes2, dwFlags) {
        ppvAudioPtr1Marshal := ppvAudioPtr1 is VarRef ? "ptr*" : "ptr"
        pdwAudioBytes1Marshal := pdwAudioBytes1 is VarRef ? "uint*" : "ptr"
        ppvAudioPtr2Marshal := ppvAudioPtr2 is VarRef ? "ptr*" : "ptr"
        pdwAudioBytes2Marshal := pdwAudioBytes2 is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", dwOffset, "uint", dwBytes, ppvAudioPtr1Marshal, ppvAudioPtr1, pdwAudioBytes1Marshal, pdwAudioBytes1, ppvAudioPtr2Marshal, ppvAudioPtr2, pdwAudioBytes2Marshal, pdwAudioBytes2, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Specifies the date and time when the trigger is activated.
     * @remarks
     * The **&lt;StartBoundary&gt;** element is a required element for time and calendar triggers ([**&lt;TimeTrigger&gt;**](taskschedulerschema-timetrigger-triggergroup-element.md) and [**&lt;CalendarTrigger&gt;**](taskschedulerschema-calendartrigger-triggergroup-element.md)).
     * 
     * For scripting development, the end boundary is specified using the [**Trigger.StartBoundary**](trigger-startboundary.md) property that is inherited by the all trigger objects.
     * 
     * For C++ development, the end boundary is specified using the [**ITrigger::StartBoundary**](/windows/desktop/api/taskschd/nf-taskschd-itrigger-get_startboundary) property that is inherited by the all trigger interfaces.
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-startboundary-triggerbasetype-element
     */
    Start(dwFlags) {
        result := ComCall(9, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Specifies that a running instances of the task is stopped at the end of the repetition pattern duration.
     * @remarks
     * For scripting development, this setting is specified using the [**RepetitionPattern.StopAtDurationEnd**](repetitionpattern-stopatdurationend.md) property.
     * 
     * For C++ development, this setting is specified using the [**IRepetitionPattern::StopAtDurationEnd**](/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-get_stopatdurationend) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/TaskSchd/taskschedulerschema-stopatdurationend-repetitiontype-element
     */
    Stop() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Unlocks a region in an open file.
     * @remarks
     * This function always operates synchronously, but may not queue a completion entry when a completion port is associated with the file handle.
     * 
     * Unlocking a region of a file releases a previously acquired lock on the file. The region to unlock must correspond exactly to an existing locked region. Two adjacent regions of a file cannot be locked separately and then unlocked using a single region that spans both locked regions.
     * 
     * If a process terminates with a portion of a file locked or closes a file that has outstanding locks, the locks are unlocked by the operating system. However, the time it takes for the operating system to unlock these locks depends upon available system resources. Therefore, it is recommended that your process explicitly unlock all files it has locked when it terminates. If this is not done, access to these files may be denied if the operating system has not yet unlocked them.
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
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 Transparent Failover (TFO)
     * 
     * </td>
     * <td>
     * Yes
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * SMB 3.0 with Scale-out File Shares (SO)
     * 
     * </td>
     * <td>
     * Yes
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
     * @param {Pointer} pvAudioPtr1 
     * @param {Integer} dwAudioBytes1 
     * @param {Pointer} pvAudioPtr2 
     * @param {Integer} dwAudioBytes2 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/fileapi/nf-fileapi-unlockfile
     */
    Unlock(pvAudioPtr1, dwAudioBytes1, pvAudioPtr2, dwAudioBytes2) {
        result := ComCall(11, this, "ptr", pvAudioPtr1, "uint", dwAudioBytes1, "ptr", pvAudioPtr2, "uint", dwAudioBytes2, "HRESULT")
        return result
    }
}
