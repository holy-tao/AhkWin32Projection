#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PSHED_PI_INJECT_ERROR extends IUnknown {

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
     * @param {Pointer<Void>} PluginContext 
     * @param {Integer} ErrorType 
     * @param {Integer} Parameter1 
     * @param {Integer} Parameter2 
     * @param {Integer} Parameter3 
     * @param {Integer} Parameter4 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(PluginContext, ErrorType, Parameter1, Parameter2, Parameter3, Parameter4) {
        PluginContextMarshal := PluginContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, PluginContextMarshal, PluginContext, "uint", ErrorType, "uint", Parameter1, "uint", Parameter2, "uint", Parameter3, "uint", Parameter4, "int")
        return result
    }
}
