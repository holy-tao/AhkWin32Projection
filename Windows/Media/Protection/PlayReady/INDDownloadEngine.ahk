#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\NDDownloadEngineNotifier.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides the PlayReady-ND download engine used to stream protected media content from a transmitter.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.inddownloadengine
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class INDDownloadEngine extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INDDownloadEngine
     * @type {Guid}
     */
    static IID => Guid("{2d223d65-c4b6-4438-8d46-b96e6d0fb21f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Pause", "Resume", "Close", "Seek", "get_CanSeek", "get_BufferFullMinThresholdInSamples", "get_BufferFullMaxThresholdInSamples", "get_Notifier"]

    /**
     * Gets whether the download engine supports seeking.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.inddownloadengine.canseek
     * @type {Boolean} 
     */
    CanSeek {
        get => this.get_CanSeek()
    }

    /**
     * Gets the minimum number of samples a sample buffer can hold before a download engine resumes downloading.
     * @remarks
     * When the buffer holds a number of samples smaller than this, the download engine is notified to resume downloading.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.inddownloadengine.bufferfullminthresholdinsamples
     * @type {Integer} 
     */
    BufferFullMinThresholdInSamples {
        get => this.get_BufferFullMinThresholdInSamples()
    }

    /**
     * Gets the maximum threshold of the sample buffer.
     * @remarks
     * When the sample buffer contains more samples than this threshold, the download engine is notified to pause.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.inddownloadengine.bufferfullmaxthresholdinsamples
     * @type {Integer} 
     */
    BufferFullMaxThresholdInSamples {
        get => this.get_BufferFullMaxThresholdInSamples()
    }

    /**
     * Gets the download engine notifier that will provide notification of download stream events from the transmitter.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.inddownloadengine.notifier
     * @type {NDDownloadEngineNotifier} 
     */
    Notifier {
        get => this.get_Notifier()
    }

    /**
     * Notifies the download engine to open the content specified by a URL.
     * @param {Uri} uri_ The URI from which the download engine gets content.
     * @param {Integer} sessionIDBytes_length 
     * @param {Pointer<Integer>} sessionIDBytes The session identifier used to identify the session. The session identifier must be 16 bytes.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.inddownloadengine.open
     */
    Open(uri_, sessionIDBytes_length, sessionIDBytes) {
        sessionIDBytesMarshal := sessionIDBytes is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "ptr", uri_, "uint", sessionIDBytes_length, sessionIDBytesMarshal, sessionIDBytes, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies the download engine to pause downloading.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.inddownloadengine.pause
     */
    Pause() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies the download engine to resume a paused download.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.inddownloadengine.resume
     */
    Resume() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies the download engine to stop downloading and disconnect from the remote server.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.inddownloadengine.close
     */
    Close() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Notifies the download engine to go to a specified time position in the media stream.
     * @param {TimeSpan} startPosition The position within the media stream to which to seek.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.inddownloadengine.seek
     */
    Seek(startPosition) {
        result := ComCall(10, this, "ptr", startPosition, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanSeek() {
        result := ComCall(11, this, "int*", &canSeek := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return canSeek
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BufferFullMinThresholdInSamples() {
        result := ComCall(12, this, "uint*", &bufferFullMinThreshold := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bufferFullMinThreshold
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BufferFullMaxThresholdInSamples() {
        result := ComCall(13, this, "uint*", &bufferFullMaxThreshold := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bufferFullMaxThreshold
    }

    /**
     * 
     * @returns {NDDownloadEngineNotifier} 
     */
    get_Notifier() {
        result := ComCall(14, this, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NDDownloadEngineNotifier(instance)
    }
}
