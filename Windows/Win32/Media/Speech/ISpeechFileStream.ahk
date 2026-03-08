#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISpeechBaseStream.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechFileStream extends ISpeechBaseStream{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechFileStream
     * @type {Guid}
     */
    static IID => Guid("{af67f125-ab39-4e93-b4a2-cc2e66e182a7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Close"]

    /**
     * Opens a handle to a backup event log created by the BackupEventLog function. (ANSI)
     * @remarks
     * If the backup filename specifies a remote server, the <i>lpUNCServerName</i> parameter must be <b>NULL</b>.
     * 
     * When this function is used on Windows Vista and later computers, only backup event logs that were saved with the <b>BackupEventLog</b> function on Windows Vista and later computers can be opened.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winbase.h header defines OpenBackupEventLog as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {BSTR} FileName 
     * @param {Integer} FileMode 
     * @param {VARIANT_BOOL} DoEvents 
     * @returns {HRESULT} If the function succeeds, the return value is a handle to the backup event log.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-openbackupeventloga
     */
    Open(FileName, FileMode, DoEvents) {
        FileName := FileName is String ? BSTR.Alloc(FileName).Value : FileName

        result := ComCall(12, this, "ptr", FileName, "int", FileMode, "short", DoEvents, "HRESULT")
        return result
    }

    /**
     * Use the Close-Session packet to tell the BITS server that file upload is complete and to end the session.
     * @remarks
     * The BITS server releases all resources and deletes all temporary files when it receives this packet.
     * 
     * For upload-reply jobs, you must download the reply before sending **Close-Session**. Otherwise, the reply is lost.
     * 
     * If you send this packet before uploading all fragments, the upload file is deleted; you cannot upload a partial file.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Bits/close-session
     */
    Close() {
        result := ComCall(13, this, "HRESULT")
        return result
    }
}
