#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PBEGIN_RESTYPECALL_AS_USER_ROUTINE extends IUnknown {

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
     * @param {PWSTR} ResourceTypeName 
     * @param {HANDLE} TokenHandle 
     * @param {Integer} ControlCode 
     * @param {Pointer<Void>} InBuffer 
     * @param {Integer} InBufferSize 
     * @param {Pointer<Void>} OutBuffer 
     * @param {Integer} OutBufferSize 
     * @param {Pointer<Integer>} BytesReturned 
     * @param {Integer} context_ 
     * @param {Pointer<BOOL>} ReturnedAsynchronously 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ResourceTypeName, TokenHandle, ControlCode, InBuffer, InBufferSize, OutBuffer, OutBufferSize, BytesReturned, context_, ReturnedAsynchronously) {
        ResourceTypeName := ResourceTypeName is String ? StrPtr(ResourceTypeName) : ResourceTypeName
        TokenHandle := TokenHandle is Win32Handle ? NumGet(TokenHandle, "ptr") : TokenHandle

        InBufferMarshal := InBuffer is VarRef ? "ptr" : "ptr"
        OutBufferMarshal := OutBuffer is VarRef ? "ptr" : "ptr"
        BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"
        ReturnedAsynchronouslyMarshal := ReturnedAsynchronously is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", ResourceTypeName, "ptr", TokenHandle, "uint", ControlCode, InBufferMarshal, InBuffer, "uint", InBufferSize, OutBufferMarshal, OutBuffer, "uint", OutBufferSize, BytesReturnedMarshal, BytesReturned, "int64", context_, ReturnedAsynchronouslyMarshal, ReturnedAsynchronously, "uint")
        return result
    }
}
