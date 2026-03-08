#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransactionImport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransactionImport
     * @type {Guid}
     */
    static IID => Guid("{e1cf9b5a-8745-11ce-a9ba-00aa006c3706}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Import"]

    /**
     * An application-defined callback function used with WriteEncryptedFileRaw. The system calls ImportCallback one or more times, each time to retrieve a portion of a backup file's data.
     * @remarks
     * The system calls the <b>ImportCallback</b> function until the 
     *      callback function indicates there is no more data to restore. To indicate that there is no more data to be 
     *      restored, set <i>*ulLength</i> to 0 and use a return code of 
     *      <b>ERROR_SUCCESS</b>. You can use the application-defined context block for internal tracking 
     *      of information such as the file handle and the current offset in the file.
     * @param {Integer} cbTransactionCookie 
     * @param {Pointer<Integer>} rgbTransactionCookie 
     * @param {Pointer<Guid>} piid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nc-winbase-pfe_import_func
     */
    Import(cbTransactionCookie, rgbTransactionCookie, piid) {
        rgbTransactionCookieMarshal := rgbTransactionCookie is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "uint", cbTransactionCookie, rgbTransactionCookieMarshal, rgbTransactionCookie, "ptr", piid, "ptr*", &ppvTransaction := 0, "HRESULT")
        return ppvTransaction
    }
}
