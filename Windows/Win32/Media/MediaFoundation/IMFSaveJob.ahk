#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Persists media data from a source byte stream to an application-provided byte stream.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsavejob
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSaveJob extends IUnknown{
    /**
     * The interface identifier for IMFSaveJob
     * @type {Guid}
     */
    static IID => Guid("{e9931663-80bf-4c6e-98af-5dcf58747d1f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IMFByteStream>} pStream 
     * @param {Pointer<IMFAsyncCallback>} pCallback 
     * @param {Pointer<IUnknown>} pState 
     * @returns {HRESULT} 
     */
    BeginSave(pStream, pCallback, pState) {
        result := ComCall(3, this, "ptr", pStream, "ptr", pCallback, "ptr", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFAsyncResult>} pResult 
     * @returns {HRESULT} 
     */
    EndSave(pResult) {
        result := ComCall(4, this, "ptr", pResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CancelSave() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwPercentComplete 
     * @returns {HRESULT} 
     */
    GetProgress(pdwPercentComplete) {
        result := ComCall(6, this, "uint*", pdwPercentComplete, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
