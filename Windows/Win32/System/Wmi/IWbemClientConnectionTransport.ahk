#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemClientConnectionTransport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemClientConnectionTransport
     * @type {Guid}
     */
    static IID => Guid("{a889c72a-fcc1-4a9e-af61-ed071333fb5b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "OpenAsync", "Cancel"]

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
     * @param {BSTR} strAddressType 
     * @param {Integer} dwBinaryAddressLength 
     * @param {Pointer<Integer>} abBinaryAddress 
     * @param {BSTR} strObject 
     * @param {BSTR} strUser 
     * @param {BSTR} strPassword 
     * @param {BSTR} strLocale 
     * @param {Integer} lFlags 
     * @param {IWbemContext} pCtx 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} pInterface 
     * @param {Pointer<IWbemCallResult>} pCallRes 
     * @returns {HRESULT} If the function succeeds, the return value is a handle to the backup event log.
     * 						
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-openbackupeventloga
     */
    Open(strAddressType, dwBinaryAddressLength, abBinaryAddress, strObject, strUser, strPassword, strLocale, lFlags, pCtx, riid, pInterface, pCallRes) {
        strAddressType := strAddressType is String ? BSTR.Alloc(strAddressType).Value : strAddressType
        strObject := strObject is String ? BSTR.Alloc(strObject).Value : strObject
        strUser := strUser is String ? BSTR.Alloc(strUser).Value : strUser
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword
        strLocale := strLocale is String ? BSTR.Alloc(strLocale).Value : strLocale

        abBinaryAddressMarshal := abBinaryAddress is VarRef ? "char*" : "ptr"
        pInterfaceMarshal := pInterface is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", strAddressType, "uint", dwBinaryAddressLength, abBinaryAddressMarshal, abBinaryAddress, "ptr", strObject, "ptr", strUser, "ptr", strPassword, "ptr", strLocale, "int", lFlags, "ptr", pCtx, "ptr", riid, pInterfaceMarshal, pInterface, "ptr*", pCallRes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strAddressType 
     * @param {Integer} dwBinaryAddressLength 
     * @param {Pointer<Integer>} abBinaryAddress 
     * @param {BSTR} strObject 
     * @param {BSTR} strUser 
     * @param {BSTR} strPassword 
     * @param {BSTR} strLocale 
     * @param {Integer} lFlags 
     * @param {IWbemContext} pCtx 
     * @param {Pointer<Guid>} riid 
     * @param {IWbemObjectSink} pResponseHandler 
     * @returns {HRESULT} 
     */
    OpenAsync(strAddressType, dwBinaryAddressLength, abBinaryAddress, strObject, strUser, strPassword, strLocale, lFlags, pCtx, riid, pResponseHandler) {
        strAddressType := strAddressType is String ? BSTR.Alloc(strAddressType).Value : strAddressType
        strObject := strObject is String ? BSTR.Alloc(strObject).Value : strObject
        strUser := strUser is String ? BSTR.Alloc(strUser).Value : strUser
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword
        strLocale := strLocale is String ? BSTR.Alloc(strLocale).Value : strLocale

        abBinaryAddressMarshal := abBinaryAddress is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "ptr", strAddressType, "uint", dwBinaryAddressLength, abBinaryAddressMarshal, abBinaryAddress, "ptr", strObject, "ptr", strUser, "ptr", strPassword, "ptr", strLocale, "int", lFlags, "ptr", pCtx, "ptr", riid, "ptr", pResponseHandler, "HRESULT")
        return result
    }

    /**
     * Use the Cancel-Session packet to terminate the upload session with the BITS server.
     * @remarks
     * This packet cancels an upload job if it is sent before the last fragment is sent. Cancel-Session has no effect on a file whose last fragment has already been sent. When the BITS server receives the last fragment, it writes the file to its final destination and, in the case of an upload-reply, posts the file to the server application. In the upload-reply case, the Cancel-Session packet cancels the reply portion of an upload-reply job.
     * 
     * The BITS server releases all resources and deletes all temporary files when it receives this packet.
     * 
     * The BITS client sends this packet when the user cancels the job.
     * @param {Integer} lFlags 
     * @param {IWbemObjectSink} pHandler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/Bits/cancel-session
     */
    Cancel(lFlags, pHandler) {
        result := ComCall(5, this, "int", lFlags, "ptr", pHandler, "HRESULT")
        return result
    }
}
