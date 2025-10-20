#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPDownloadItem extends IDispatch{
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
     * 
     * @param {Pointer<BSTR>} pbstrURL 
     * @returns {HRESULT} 
     */
    get_sourceURL(pbstrURL) {
        result := ComCall(7, this, "ptr", pbstrURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plSize 
     * @returns {HRESULT} 
     */
    get_size(plSize) {
        result := ComCall(8, this, "int*", plSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrType 
     * @returns {HRESULT} 
     */
    get_type(pbstrType) {
        result := ComCall(9, this, "ptr", pbstrType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plProgress 
     * @returns {HRESULT} 
     */
    get_progress(plProgress) {
        result := ComCall(10, this, "int*", plProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pwmpsdls 
     * @returns {HRESULT} 
     */
    get_downloadState(pwmpsdls) {
        result := ComCall(11, this, "int*", pwmpsdls, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    pause() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    resume() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    cancel() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
