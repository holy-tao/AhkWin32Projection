#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Performs an operation that applies to a resource type.
 * @remarks
 * Some control codes should be handled by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dlls">resource DLL</a>, 
 *      while others should be left to the Resource Monitor. For effective implementation strategies of the 
 *      <b>ResourceTypeControl</b> entry-point function, see 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/implementing-resourcetypecontrol">Implementing ResourceTypeControl</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/resapi/nc-resapi-presource_type_control_routine
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PRESOURCE_TYPE_CONTROL_ROUTINE extends IUnknown {

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
     * @param {Integer} ControlCode 
     * @param {Pointer<Void>} InBuffer 
     * @param {Integer} InBufferSize 
     * @param {Pointer<Void>} OutBuffer 
     * @param {Integer} OutBufferSize 
     * @param {Pointer<Integer>} BytesReturned 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ResourceTypeName, ControlCode, InBuffer, InBufferSize, OutBuffer, OutBufferSize, BytesReturned) {
        ResourceTypeName := ResourceTypeName is String ? StrPtr(ResourceTypeName) : ResourceTypeName

        InBufferMarshal := InBuffer is VarRef ? "ptr" : "ptr"
        OutBufferMarshal := OutBuffer is VarRef ? "ptr" : "ptr"
        BytesReturnedMarshal := BytesReturned is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", ResourceTypeName, "uint", ControlCode, InBufferMarshal, InBuffer, "uint", InBufferSize, OutBufferMarshal, OutBuffer, "uint", OutBufferSize, BytesReturnedMarshal, BytesReturned, "uint")
        return result
    }
}
