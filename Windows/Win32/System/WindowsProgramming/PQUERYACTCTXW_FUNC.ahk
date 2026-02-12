#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class PQUERYACTCTXW_FUNC extends IUnknown {

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
     * @param {Integer} dwFlags 
     * @param {HANDLE} hActCtx 
     * @param {Pointer<Void>} pvSubInstance 
     * @param {Integer} ulInfoClass 
     * @param {Pointer} pvBuffer 
     * @param {Pointer} cbBuffer 
     * @param {Pointer<Pointer>} pcbWrittenOrRequired 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(dwFlags, hActCtx, pvSubInstance, ulInfoClass, pvBuffer, cbBuffer, pcbWrittenOrRequired) {
        hActCtx := hActCtx is Win32Handle ? NumGet(hActCtx, "ptr") : hActCtx

        pvSubInstanceMarshal := pvSubInstance is VarRef ? "ptr" : "ptr"
        pcbWrittenOrRequiredMarshal := pcbWrittenOrRequired is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "uint", dwFlags, "ptr", hActCtx, pvSubInstanceMarshal, pvSubInstance, "uint", ulInfoClass, "ptr", pvBuffer, "ptr", cbBuffer, pcbWrittenOrRequiredMarshal, pcbWrittenOrRequired, "int")
        return result
    }
}
