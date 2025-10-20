#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides the current error status for the Media Engine.
 * @remarks
 * 
  * The <b>IMFMediaError</b> interface corresponds to the <b>MediaError</b> object in HTML5.
  * 
  * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/mfmediaengine/nf-mfmediaengine-imfmediaengine-geterror">IMFMediaEngine::GetError</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediaerror
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaError extends IUnknown{
    /**
     * The interface identifier for IMFMediaError
     * @type {Guid}
     */
    static IID => Guid("{fc0e10d2-ab2a-4501-a951-06bb1075184c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {Integer} 
     */
    GetErrorCode() {
        result := ComCall(3, this, "ushort")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GetExtendedErrorCode() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} error 
     * @returns {HRESULT} 
     */
    SetErrorCode(error) {
        result := ComCall(5, this, "int", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HRESULT} error 
     * @returns {HRESULT} 
     */
    SetExtendedErrorCode(error) {
        result := ComCall(6, this, "int", error, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
