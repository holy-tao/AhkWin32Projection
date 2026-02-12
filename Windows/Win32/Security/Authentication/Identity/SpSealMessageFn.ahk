#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Encrypts a message exchanged between a client and server.
 * @remarks
 * Messages encrypted by the sender using the <b>SpSealMessage</b> function are decrypted using the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spunsealmessagefn">SpUnsealMessage</a> function.
 * 
 * SSP/APs must implement the <b>SpSealMessage</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpSealMessage</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_user_function_table">SECPKG_USER_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spusermodeinitializefn">SpUserModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api//content/ntsecpkg/nc-ntsecpkg-spsealmessagefn
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SpSealMessageFn extends IUnknown {

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
     * @param {Pointer} ContextHandle 
     * @param {Integer} QualityOfProtection 
     * @param {Pointer<SecBufferDesc>} MessageBuffers 
     * @param {Integer} MessageSequenceNumber 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ContextHandle, QualityOfProtection, MessageBuffers, MessageSequenceNumber) {
        result := ComCall(3, this, "ptr", ContextHandle, "uint", QualityOfProtection, "ptr", MessageBuffers, "uint", MessageSequenceNumber, "int")
        return result
    }
}
