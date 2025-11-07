#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBackgroundCopyJob.ahk

/**
 * Retrieve reply data from an upload-reply job, determine the progress of the reply data transfer to the client, request command line execution, and provide credentials for proxy and remote server authentication requests.
 * @see https://docs.microsoft.com/windows/win32/api//bits1_5/nn-bits1_5-ibackgroundcopyjob2
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBackgroundCopyJob2 extends IBackgroundCopyJob{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundCopyJob2
     * @type {Guid}
     */
    static IID => Guid("{54b50739-686f-45eb-9dff-d6a9a0faa9af}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 35

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetNotifyCmdLine", "GetNotifyCmdLine", "GetReplyProgress", "GetReplyData", "SetReplyFileName", "GetReplyFileName", "SetCredentials", "RemoveCredentials"]

    /**
     * 
     * @param {PWSTR} Program 
     * @param {PWSTR} Parameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-setnotifycmdline
     */
    SetNotifyCmdLine(Program, Parameters) {
        Program := Program is String ? StrPtr(Program) : Program
        Parameters := Parameters is String ? StrPtr(Parameters) : Parameters

        result := ComCall(35, this, "ptr", Program, "ptr", Parameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pProgram 
     * @param {Pointer<PWSTR>} pParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-getnotifycmdline
     */
    GetNotifyCmdLine(pProgram, pParameters) {
        pProgramMarshal := pProgram is VarRef ? "ptr*" : "ptr"
        pParametersMarshal := pParameters is VarRef ? "ptr*" : "ptr"

        result := ComCall(36, this, pProgramMarshal, pProgram, pParametersMarshal, pParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BG_JOB_REPLY_PROGRESS>} pProgress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-getreplyprogress
     */
    GetReplyProgress(pProgress) {
        result := ComCall(37, this, "ptr", pProgress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLength 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-getreplydata
     */
    GetReplyData(pLength) {
        pLengthMarshal := pLength is VarRef ? "uint*" : "ptr"

        result := ComCall(38, this, "ptr*", &ppBuffer := 0, pLengthMarshal, pLength, "HRESULT")
        return ppBuffer
    }

    /**
     * 
     * @param {PWSTR} ReplyFileName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-setreplyfilename
     */
    SetReplyFileName(ReplyFileName) {
        ReplyFileName := ReplyFileName is String ? StrPtr(ReplyFileName) : ReplyFileName

        result := ComCall(39, this, "ptr", ReplyFileName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-getreplyfilename
     */
    GetReplyFileName() {
        result := ComCall(40, this, "ptr*", &pReplyFileName := 0, "HRESULT")
        return pReplyFileName
    }

    /**
     * 
     * @param {Pointer<BG_AUTH_CREDENTIALS>} credentials 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-setcredentials
     */
    SetCredentials(credentials) {
        result := ComCall(41, this, "ptr", credentials, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Target 
     * @param {Integer} Scheme 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bits1_5/nf-bits1_5-ibackgroundcopyjob2-removecredentials
     */
    RemoveCredentials(Target, Scheme) {
        result := ComCall(42, this, "int", Target, "int", Scheme, "HRESULT")
        return result
    }
}
