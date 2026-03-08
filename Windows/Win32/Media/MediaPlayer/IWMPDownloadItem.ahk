#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPDownloadItem extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPDownloadItem
     * @type {Guid}
     */
    static IID => Guid("{c9470e8e-3f6b-46a9-a0a9-452815c34297}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_sourceURL", "get_size", "get_type", "get_progress", "get_downloadState", "pause", "resume", "cancel"]

    /**
     */
    sourceURL {
        get => this.get_sourceURL()
    }

    /**
     */
    size {
        get => this.get_size()
    }

    /**
     */
    type {
        get => this.get_type()
    }

    /**
     */
    progress {
        get => this.get_progress()
    }

    /**
     */
    downloadState {
        get => this.get_downloadState()
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrURL 
     * @returns {HRESULT} 
     */
    get_sourceURL(pbstrURL) {
        result := ComCall(7, this, "ptr", pbstrURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plSize 
     * @returns {HRESULT} 
     */
    get_size(plSize) {
        plSizeMarshal := plSize is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plSizeMarshal, plSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrType 
     * @returns {HRESULT} 
     */
    get_type(pbstrType) {
        result := ComCall(9, this, "ptr", pbstrType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plProgress 
     * @returns {HRESULT} 
     */
    get_progress(plProgress) {
        plProgressMarshal := plProgress is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plProgressMarshal, plProgress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwmpsdls 
     * @returns {HRESULT} 
     */
    get_downloadState(pwmpsdls) {
        pwmpsdlsMarshal := pwmpsdls is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pwmpsdlsMarshal, pwmpsdls, "HRESULT")
        return result
    }

    /**
     * The pause command pauses playing or recording.
     * @remarks
     * With the MCICDA, MCISEQ, and MCIPIONR drivers, the pause command works the same as the [stop](stop.md) command.
     * @returns {HRESULT} <span id="lpszDeviceID"></span><span id="lpszdeviceid"></span><span id="LPSZDEVICEID"></span>*lpszDeviceID*
     * 
     * Identifier of an MCI device. This identifier or alias is assigned when the device is opened.
     * 
     * 
     * <span id="lpszFlags"></span><span id="lpszflags"></span><span id="LPSZFLAGS"></span>*lpszFlags*
     * 
     * Can be "wait", "notify", or both. For digital-video and VCR devices, "test" can also be specified. For more information about these flags, see [The Wait, Notify, and Test Flags](the-wait-notify-and-test-flags.md).
     * 
     * 
     * 
     * Returns zero if successful or an error otherwise.
     * @see https://learn.microsoft.com/windows/win32/Multimedia/pause
     */
    pause() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * The resume command continues playing or recording on a device that has been paused using the pause command.
     * @returns {HRESULT} <span id="lpszDeviceID"></span><span id="lpszdeviceid"></span><span id="LPSZDEVICEID"></span>*lpszDeviceID*
     * 
     * Identifier of an MCI device. This identifier or alias is assigned when the device is opened.
     * 
     * 
     * <span id="lpszFlags"></span><span id="lpszflags"></span><span id="LPSZFLAGS"></span>*lpszFlags*
     * 
     * Can be "wait", "notify", or both. For digital-video and VCR devices, "test" can also be specified. For more information about these flags, see [The Wait, Notify, and Test Flags](the-wait-notify-and-test-flags.md).
     * 
     * 
     * 
     * Returns zero if successful or an error otherwise.
     * @see https://learn.microsoft.com/windows/win32/Multimedia/resume
     */
    resume() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    cancel() {
        result := ComCall(14, this, "HRESULT")
        return result
    }
}
