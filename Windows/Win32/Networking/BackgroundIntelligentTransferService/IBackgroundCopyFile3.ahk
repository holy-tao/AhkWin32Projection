#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyFile2.ahk

/**
 * Use this interface to retrieve the name of the temporary file that contains the downloaded content and to validate the file so that peers can request its content.
 * @see https://docs.microsoft.com/windows/win32/api//bits3_0/nn-bits3_0-ibackgroundcopyfile3
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyFile3 extends IBackgroundCopyFile2{
    /**
     * The interface identifier for IBackgroundCopyFile3
     * @type {Guid}
     */
    static IID => Guid("{659cdeaa-489e-11d9-a9cd-000d56965251}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Pointer<PWSTR>} pFilename 
     * @returns {HRESULT} 
     */
    GetTemporaryName(pFilename) {
        result := ComCall(8, this, "ptr", pFilename, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} state 
     * @returns {HRESULT} 
     */
    SetValidationState(state) {
        result := ComCall(9, this, "int", state, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pState 
     * @returns {HRESULT} 
     */
    GetValidationState(pState) {
        result := ComCall(10, this, "ptr", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pVal 
     * @returns {HRESULT} 
     */
    IsDownloadedFromPeer(pVal) {
        result := ComCall(11, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
