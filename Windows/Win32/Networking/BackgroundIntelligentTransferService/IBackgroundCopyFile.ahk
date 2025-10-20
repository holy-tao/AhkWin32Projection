#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IBackgroundCopyFile contains information about a file that is part of a job. For example, you can use IBackgroundCopyFile methods to retrieve the local and remote names of the file and transfer progress information.
 * @see https://docs.microsoft.com/windows/win32/api//bits/nn-bits-ibackgroundcopyfile
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyFile extends IUnknown{
    /**
     * The interface identifier for IBackgroundCopyFile
     * @type {Guid}
     */
    static IID => Guid("{01b7bd23-fb88-4a77-8490-5891d3e4653a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} pVal 
     * @returns {HRESULT} 
     */
    GetRemoteName(pVal) {
        result := ComCall(3, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pVal 
     * @returns {HRESULT} 
     */
    GetLocalName(pVal) {
        result := ComCall(4, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BG_FILE_PROGRESS>} pVal 
     * @returns {HRESULT} 
     */
    GetProgress(pVal) {
        result := ComCall(5, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
