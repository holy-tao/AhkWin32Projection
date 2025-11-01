#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-imultisession-get_issupportedoncurrentmediastate
     */
    get_IsSupportedOnCurrentMediaState(value) {
        result := ComCall(7, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-imultisession-put_inuse
     */
    put_InUse(value) {
        result := ComCall(8, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-imultisession-get_inuse
     */
    get_InUse(value) {
        result := ComCall(9, this, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDiscRecorder2>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-imultisession-get_importrecorder
     */
    get_ImportRecorder(value) {
        result := ComCall(10, this, "ptr*", value, "HRESULT")
        return result
    }
}
