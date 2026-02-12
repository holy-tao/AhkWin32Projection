#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 * @version v4.0.30319
 */
class PFLT_GET_OPERATION_STATUS_CALLBACK extends IUnknown {

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
     * @param {Pointer<FLT_RELATED_OBJECTS>} FltObjects 
     * @param {Pointer<FLT_IO_PARAMETER_BLOCK>} IopbSnapshot 
     * @param {NTSTATUS} OperationStatus 
     * @param {Pointer<Void>} RequesterContext 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(FltObjects, IopbSnapshot, OperationStatus, RequesterContext) {
        RequesterContextMarshal := RequesterContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", FltObjects, "ptr", IopbSnapshot, "int", OperationStatus, RequesterContextMarshal, RequesterContext)
    }
}
