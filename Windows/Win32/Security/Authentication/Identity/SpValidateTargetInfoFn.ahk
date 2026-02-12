#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Validates that the specified SECPKG_TARGETINFO structure represents a valid target.
 * @remarks
 * SSP/APs must implement the <b>SpValidateTargetInfo</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpValidateTargetInfo</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api//content/ntsecpkg/nc-ntsecpkg-spvalidatetargetinfofn
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SpValidateTargetInfoFn extends IUnknown {

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
     * @param {Pointer<Pointer<Void>>} ClientRequest 
     * @param {Pointer} ProtocolSubmitBuffer 
     * @param {Pointer<Void>} ClientBufferBase 
     * @param {Integer} SubmitBufferLength 
     * @param {Pointer<SECPKG_TARGETINFO>} TargetInfo 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ClientRequest, ProtocolSubmitBuffer, ClientBufferBase, SubmitBufferLength, TargetInfo) {
        ClientRequestMarshal := ClientRequest is VarRef ? "ptr*" : "ptr"
        ClientBufferBaseMarshal := ClientBufferBase is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, ClientRequestMarshal, ClientRequest, "ptr", ProtocolSubmitBuffer, ClientBufferBaseMarshal, ClientBufferBase, "uint", SubmitBufferLength, "ptr", TargetInfo, "int")
        return result
    }
}
