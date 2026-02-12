#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Starts a call to a resource control code. The PBEGIN_RESCALL_ROUTINE type defines a pointer to this callback function.
 * @see https://learn.microsoft.com/windows/win32/api//content/resapi/nc-resapi-pbegin_rescall_routine
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PBEGIN_RESCALL_ROUTINE extends IUnknown {

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
     * @param {Pointer<Void>} Resource 
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
    Invoke(Resource, ControlCode, InBuffer, InBufferSize, OutBuffer, OutBufferSize, BytesReturned, context_, ReturnedAsynchronously) {
        ResourceMarshal := Resource is VarRef ? "ptr" : "ptr"
        InBufferMarshal := InBuffer is VarRef ? "ptr" : "ptr"
        OutBufferMarshal := OutBuffer is VarRef ? "ptr" : "ptr"
        BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"
        ReturnedAsynchronouslyMarshal := ReturnedAsynchronously is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, ResourceMarshal, Resource, "uint", ControlCode, InBufferMarshal, InBuffer, "uint", InBufferSize, OutBufferMarshal, OutBuffer, "uint", OutBufferSize, BytesReturnedMarshal, BytesReturned, "int64", context_, ReturnedAsynchronouslyMarshal, ReturnedAsynchronously, "uint")
        return result
    }
}
