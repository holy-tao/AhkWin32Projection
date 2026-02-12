#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Queries the subject interface packages (SIPs) listed in the registry to determine which SIP handles the file type. (pfnIsFileSupported)
 * @remarks
 * If the SIP supports the file type passed by <i>hfile</i>, the function returns <b>TRUE</b>, and sets <i>pgSubject</i> to the GUID that identifies the SIP for handling the file type.
 * 
 * Each SIP implements its own version of the function that determines whether the file type is supported. The specific name of the function may vary depending on the implementation of the SIP, but the signature of the function will match that of the [SIP_ADD_NEWPROVIDER](/windows/desktop/api/mssip/ns-mssip-sip_add_newprovider) structure.
 * @see https://learn.microsoft.com/windows/win32/api//content/mssip/nc-mssip-pfnisfilesupported
 * @namespace Windows.Win32.Security.Cryptography.Sip
 * @version v4.0.30319
 */
class pfnIsFileSupported extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HANDLE} hFile 
     * @param {Pointer<Guid>} pgSubject 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hFile, pgSubject) {
        hFile := hFile is Win32Handle ? NumGet(hFile, "ptr") : hFile

        result := ComCall(3, this, "ptr", hFile, "ptr", pgSubject, "int")
        return result
    }
}
