#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class PCHECK_FOR_TRAVERSE_ACCESS extends IUnknown {

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
     * @param {Pointer<Void>} NotifyContext 
     * @param {Pointer<Void>} TargetContext 
     * @param {Pointer<SECURITY_SUBJECT_CONTEXT>} SubjectContext 
     * @returns {BOOLEAN} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(NotifyContext, TargetContext, SubjectContext) {
        NotifyContextMarshal := NotifyContext is VarRef ? "ptr" : "ptr"
        TargetContextMarshal := TargetContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, NotifyContextMarshal, NotifyContext, TargetContextMarshal, TargetContext, "ptr", SubjectContext, "char")
        return result
    }
}
