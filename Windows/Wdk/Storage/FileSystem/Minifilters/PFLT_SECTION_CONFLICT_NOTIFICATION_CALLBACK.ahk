#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 * @version v4.0.30319
 */
class PFLT_SECTION_CONFLICT_NOTIFICATION_CALLBACK extends IUnknown {

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
     * @param {PFLT_INSTANCE} Instance 
     * @param {PFLT_CONTEXT} SectionContext 
     * @param {Pointer<FLT_CALLBACK_DATA>} Data 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Instance, SectionContext, Data) {
        Instance := Instance is Win32Handle ? NumGet(Instance, "ptr") : Instance

        result := ComCall(3, this, "ptr", Instance, "ptr", SectionContext, "ptr", Data, "int")
        return result
    }
}
