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
     * 
     * @param {PWSTR} Program 
     * @param {PWSTR} Parameters 
     * @returns {HRESULT} 
     */
    SetNotifyCmdLine(Program, Parameters) {
        Program := Program is String ? StrPtr(Program) : Program
        Parameters := Parameters is String ? StrPtr(Parameters) : Parameters

        result := ComCall(35, this, "ptr", Program, "ptr", Parameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pProgram 
     * @param {Pointer<PWSTR>} pParameters 
     * @returns {HRESULT} 
     */
    GetNotifyCmdLine(pProgram, pParameters) {
        result := ComCall(36, this, "ptr", pProgram, "ptr", pParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BG_JOB_REPLY_PROGRESS>} pProgress 
     * @returns {HRESULT} 
     */
    GetReplyProgress(pProgress) {
        result := ComCall(37, this, "ptr", pProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} ppBuffer 
     * @param {Pointer<UInt64>} pLength 
     * @returns {HRESULT} 
     */
    GetReplyData(ppBuffer, pLength) {
        result := ComCall(38, this, "char*", ppBuffer, "uint*", pLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} ReplyFileName 
     * @returns {HRESULT} 
     */
    SetReplyFileName(ReplyFileName) {
        ReplyFileName := ReplyFileName is String ? StrPtr(ReplyFileName) : ReplyFileName

        result := ComCall(39, this, "ptr", ReplyFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pReplyFileName 
     * @returns {HRESULT} 
     */
    GetReplyFileName(pReplyFileName) {
        result := ComCall(40, this, "ptr", pReplyFileName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BG_AUTH_CREDENTIALS>} credentials 
     * @returns {HRESULT} 
     */
    SetCredentials(credentials) {
        result := ComCall(41, this, "ptr", credentials, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Target 
     * @param {Integer} Scheme 
     * @returns {HRESULT} 
     */
    RemoveCredentials(Target, Scheme) {
        result := ComCall(42, this, "int", Target, "int", Scheme, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
