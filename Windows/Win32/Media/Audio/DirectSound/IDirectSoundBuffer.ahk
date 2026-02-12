#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\DSBCAPS.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 * @version v4.0.30319
 */
class IDirectSoundBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectSoundBuffer
     * @type {Guid}
     */
    static IID => Guid("{279afa85-4981-11ce-a521-0020af0be560}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCaps", "GetCurrentPosition", "GetFormat", "GetVolume", "GetPan", "GetFrequency", "GetStatus", "Initialize", "Lock", "Play", "SetCurrentPosition", "SetFormat", "SetVolume", "SetPan", "SetFrequency", "Stop", "Unlock", "Restore"]

    /**
     * 
     * @returns {DSBCAPS} 
     */
    GetCaps() {
        pDSBufferCaps := DSBCAPS()
        result := ComCall(3, this, "ptr", pDSBufferCaps, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDSBufferCaps
    }

    /**
     * The GetCurrentPositionEx function retrieves the current position in logical coordinates.
     * @param {Pointer<Integer>} pdwCurrentPlayCursor 
     * @param {Pointer<Integer>} pdwCurrentWriteCursor 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero.
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-getcurrentpositionex
     */
    GetCurrentPosition(pdwCurrentPlayCursor, pdwCurrentWriteCursor) {
        pdwCurrentPlayCursorMarshal := pdwCurrentPlayCursor is VarRef ? "uint*" : "ptr"
        pdwCurrentWriteCursorMarshal := pdwCurrentWriteCursor is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pdwCurrentPlayCursorMarshal, pdwCurrentPlayCursor, pdwCurrentWriteCursorMarshal, pdwCurrentWriteCursor, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * For current documentation on Windows Media codecs and digital signal processors, see Windows Media Audio and Video Codec and DSP APIs. | GetFormatProp
     * @param {Pointer} pwfxFormat 
     * @param {Integer} dwSizeAllocated 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/wmformat/iwmcodecprops-getformatprop
     */
    GetFormat(pwfxFormat, dwSizeAllocated) {
        result := ComCall(5, this, "ptr", pwfxFormat, "uint", dwSizeAllocated, "uint*", &pdwSizeWritten := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwSizeWritten
    }

    /**
     * Retrieves information about the file system and volume associated with the specified root directory. (Unicode)
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fileapi/nf-fileapi-getvolumeinformationw
     */
    GetVolume() {
        result := ComCall(6, this, "int*", &plVolume := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plVolume
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPan() {
        result := ComCall(7, this, "int*", &plPan := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plPan
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFrequency() {
        result := ComCall(8, this, "uint*", &pdwFrequency := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwFrequency
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetStatus() {
        result := ComCall(9, this, "uint*", &pdwStatus := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @param {IDirectSound} pDirectSound 
     * @param {Pointer<DSBUFFERDESC>} pcDSBufferDesc 
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
     * @see https://learn.microsoft.com/windows/win32/api//content/roapi/nf-roapi-initialize
     */
    Initialize(pDirectSound, pcDSBufferDesc) {
        result := ComCall(10, this, "ptr", pDirectSound, "ptr", pcDSBufferDesc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies whether shapes belonging to the layer are locked against being selected or edited.
     * @remarks
     * You can also set this value by selecting **Lock** in the **Layer Properties** dialog box (on the **Home** tab, in the **Editing** group, click **Layers**, and then click **Layer Properties**).
     *   
     * To get a reference to the Lock cell by name from another formula, or from a program using the **CellsU** property, use: 
     *   
     * ||Value |
     * |:-----|:-----|
     * |**Cell name:**  <br/> |Layers.Locked[ *i*  ] where  *i*  = <1>, 2, 3... |
     *    
     * To get a reference to the Lock cell by index from a program, use the **CellsSRC** property with the following arguments: 
     *   
     * ||Value |
     * |:-----|:-----|
     * |**Section index:**  <br/> |**visSectionLayer** <br/> |
     * |**Row index:**  <br/> |**visRowLayer** +  *i*  where  *i*  = 0, 1, 2... |
     * |**Cell index:**  <br/> |**visLayerLock** <br/> |
     * @param {Integer} dwOffset 
     * @param {Integer} dwBytes 
     * @param {Pointer<Pointer<Void>>} ppvAudioPtr1 
     * @param {Pointer<Integer>} pdwAudioBytes1 
     * @param {Pointer<Pointer<Void>>} ppvAudioPtr2 
     * @param {Pointer<Integer>} pdwAudioBytes2 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/visio/lock-cell-layers-section
     */
    Lock(dwOffset, dwBytes, ppvAudioPtr1, pdwAudioBytes1, ppvAudioPtr2, pdwAudioBytes2, dwFlags) {
        ppvAudioPtr1Marshal := ppvAudioPtr1 is VarRef ? "ptr*" : "ptr"
        pdwAudioBytes1Marshal := pdwAudioBytes1 is VarRef ? "uint*" : "ptr"
        ppvAudioPtr2Marshal := ppvAudioPtr2 is VarRef ? "ptr*" : "ptr"
        pdwAudioBytes2Marshal := pdwAudioBytes2 is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, "uint", dwOffset, "uint", dwBytes, ppvAudioPtr1Marshal, ppvAudioPtr1, pdwAudioBytes1Marshal, pdwAudioBytes1, ppvAudioPtr2Marshal, ppvAudioPtr2, pdwAudioBytes2Marshal, pdwAudioBytes2, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Play method plays the current DVD title.
     * @remarks
     * If playback is paused or stopped and [**EnableResetOnStop**](enableresetonstop-property.md) is true, then calling **Play** will resume playback at normal speed at the current location. If playback is stopped and **EnableResetOnStop** is false, then calling **Play** will cause the disc to start playing at the beginning of the first title.
     * @param {Integer} dwReserved1 
     * @param {Integer} dwPriority 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} No return value.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/DirectShow/play-method
     */
    Play(dwReserved1, dwPriority, dwFlags) {
        result := ComCall(12, this, "uint", dwReserved1, "uint", dwPriority, "uint", dwFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} dwNewPosition 
     * @returns {HRESULT} 
     */
    SetCurrentPosition(dwNewPosition) {
        result := ComCall(13, this, "uint", dwNewPosition, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<WAVEFORMATEX>} pcfxFormat 
     * @returns {HRESULT} 
     */
    SetFormat(pcfxFormat) {
        result := ComCall(14, this, "ptr", pcfxFormat, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the label of a file system volume. (Unicode)
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
     * @param {Integer} lVolume 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nf-winbase-setvolumelabelw
     */
    SetVolume(lVolume) {
        result := ComCall(15, this, "int", lVolume, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} lPan 
     * @returns {HRESULT} 
     */
    SetPan(lPan) {
        result := ComCall(16, this, "int", lPan, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} dwFrequency 
     * @returns {HRESULT} 
     */
    SetFrequency(dwFrequency) {
        result := ComCall(17, this, "uint", dwFrequency, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Specifies that a running instances of the task is stopped at the end of the repetition pattern duration.
     * @remarks
     * For scripting development, this setting is specified using the [**RepetitionPattern.StopAtDurationEnd**](repetitionpattern-stopatdurationend.md) property.
     * 
     * For C++ development, this setting is specified using the [**IRepetitionPattern::StopAtDurationEnd**](/windows/win32/api/taskschd/nf-taskschd-irepetitionpattern-get_stopatdurationend) property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/TaskSchd/taskschedulerschema-stopatdurationend-repetitiontype-element
     */
    Stop() {
        result := ComCall(18, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/fileapi/nf-fileapi-unlockfile
     */
    Unlock(pvAudioPtr1, dwAudioBytes1, pvAudioPtr2, dwAudioBytes2) {
        result := ComCall(19, this, "ptr", pvAudioPtr1, "uint", dwAudioBytes1, "ptr", pvAudioPtr2, "uint", dwAudioBytes2, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initiates a system restore.
     * @returns {HRESULT} If the method succeeds, the return value is S\_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/sr/restore-systemrestore
     */
    Restore() {
        result := ComCall(20, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
