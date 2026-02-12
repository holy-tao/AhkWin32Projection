#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class HANDLER_FUNCTION_EX extends IUnknown {

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
     * @param {Integer} dwControl 
     * @param {Integer} dwEventType 
     * @param {Pointer<Void>} lpEventData 
     * @param {Pointer<Void>} lpContext 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwControl, dwEventType, lpEventData, lpContext) {
        lpEventDataMarshal := lpEventData is VarRef ? "ptr" : "ptr"
        lpContextMarshal := lpContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "uint", dwControl, "uint", dwEventType, lpEventDataMarshal, lpEventData, lpContextMarshal, lpContext, "uint")
        return result
    }
}
