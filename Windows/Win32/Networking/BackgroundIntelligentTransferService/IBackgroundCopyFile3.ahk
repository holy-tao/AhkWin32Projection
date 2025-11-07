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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTemporaryName", "SetValidationState", "GetValidationState", "IsDownloadedFromPeer"]

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibackgroundcopyfile3-gettemporaryname
     */
    GetTemporaryName() {
        result := ComCall(8, this, "ptr*", &pFilename := 0, "HRESULT")
        return pFilename
    }

    /**
     * 
     * @param {BOOL} state 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibackgroundcopyfile3-setvalidationstate
     */
    SetValidationState(state) {
        result := ComCall(9, this, "int", state, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibackgroundcopyfile3-getvalidationstate
     */
    GetValidationState() {
        result := ComCall(10, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/bits3_0/nf-bits3_0-ibackgroundcopyfile3-isdownloadedfrompeer
     */
    IsDownloadedFromPeer() {
        result := ComCall(11, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }
}
