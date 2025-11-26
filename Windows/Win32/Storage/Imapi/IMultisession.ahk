#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDiscRecorder2.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Base interface containing properties common to derived multisession interfaces.
 * @remarks
 * 
 * If more than one multi-session interface exist, the application can let <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifilesystemimage">IFileSystemImage</a> choose a compatible multi-session interface to use  or the application can specify the multi-session interface to use by setting the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nf-imapi2-imultisession-put_inuse">put_InUse</a> property to VARIANT_TRUE.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2/nn-imapi2-imultisession
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IMultisession extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMultisession
     * @type {Guid}
     */
    static IID => Guid("{27354150-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsSupportedOnCurrentMediaState", "put_InUse", "get_InUse", "get_ImportRecorder"]

    /**
     * @type {VARIANT_BOOL} 
     */
    IsSupportedOnCurrentMediaState {
        get => this.get_IsSupportedOnCurrentMediaState()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    InUse {
        get => this.get_InUse()
        set => this.put_InUse(value)
    }

    /**
     * @type {IDiscRecorder2} 
     */
    ImportRecorder {
        get => this.get_ImportRecorder()
    }

    /**
     * Determines if the multi-session type can write to the current optical media.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if the multi-session interface can write to the current optical media in its current state. Otherwise, VARIANT_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-imultisession-get_issupportedoncurrentmediastate
     */
    get_IsSupportedOnCurrentMediaState() {
        result := ComCall(7, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Determines if this multi-session interface is the one you should use on the current media.
     * @param {VARIANT_BOOL} value Set to VARIANT_TRUE if this multi-session interface is the one you should use to write to the current media. Otherwise, VARIANT_FALSE.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-imultisession-put_inuse
     */
    put_InUse(value) {
        result := ComCall(8, this, "short", value, "HRESULT")
        return result
    }

    /**
     * Determines if this multi-session interface is the one you should use on the current media.
     * @returns {VARIANT_BOOL} Is VARIANT_TRUE if this multi-session interface is the one you should use to write to the  current media. Otherwise, VARIANT_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-imultisession-get_inuse
     */
    get_InUse() {
        result := ComCall(9, this, "short*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Retrieves the disc recorder to use to import one or more previous sessions.
     * @returns {IDiscRecorder2} An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscrecorder2">IDiscRecorder2</a> interface that identifies the device that contains one or more session images to import.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2/nf-imapi2-imultisession-get_importrecorder
     */
    get_ImportRecorder() {
        result := ComCall(10, this, "ptr*", &value := 0, "HRESULT")
        return IDiscRecorder2(value)
    }
}
