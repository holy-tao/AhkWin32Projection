#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\BG_FILE_PROGRESS.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IBackgroundCopyFile contains information about a file that is part of a job. For example, you can use IBackgroundCopyFile methods to retrieve the local and remote names of the file and transfer progress information.
 * @see https://docs.microsoft.com/windows/win32/api//bits/nn-bits-ibackgroundcopyfile
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyFile extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRemoteName", "GetLocalName", "GetProgress"]

    /**
     * Retrieves the remote name of the file.
     * @returns {PWSTR} Null-terminated string that contains the remote name of the file to transfer. The name is fully qualified. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppName</i> when done.
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyfile-getremotename
     */
    GetRemoteName() {
        result := ComCall(3, this, "ptr*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the local name of the file.
     * @returns {PWSTR} Null-terminated string that contains the name of the file on the client. The name is fully qualified. Call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function to free <i>ppName</i> when done.
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyfile-getlocalname
     */
    GetLocalName() {
        result := ComCall(4, this, "ptr*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Retrieves information on the progress of the file transfer.
     * @returns {BG_FILE_PROGRESS} Structure whose members indicate the progress of the file transfer. For details on the type of progress information available, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits/ns-bits-bg_file_progress">BG_FILE_PROGRESS</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//bits/nf-bits-ibackgroundcopyfile-getprogress
     */
    GetProgress() {
        pVal := BG_FILE_PROGRESS()
        result := ComCall(5, this, "ptr", pVal, "HRESULT")
        return pVal
    }
}
