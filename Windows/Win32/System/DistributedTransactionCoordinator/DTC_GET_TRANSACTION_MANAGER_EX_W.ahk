#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 * @charset Unicode
 */
class DTC_GET_TRANSACTION_MANAGER_EX_W extends IUnknown {

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
     * @param {PWSTR} i_pwszHost 
     * @param {PWSTR} i_pwszTmName 
     * @param {Pointer<Guid>} i_riid 
     * @param {Integer} i_grfOptions 
     * @param {Pointer<Void>} i_pvConfigParams 
     * @param {Pointer<Pointer<Void>>} o_ppvObject 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(i_pwszHost, i_pwszTmName, i_riid, i_grfOptions, i_pvConfigParams, o_ppvObject) {
        i_pwszHost := i_pwszHost is String ? StrPtr(i_pwszHost) : i_pwszHost
        i_pwszTmName := i_pwszTmName is String ? StrPtr(i_pwszTmName) : i_pwszTmName

        i_pvConfigParamsMarshal := i_pvConfigParams is VarRef ? "ptr" : "ptr"
        o_ppvObjectMarshal := o_ppvObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", i_pwszHost, "ptr", i_pwszTmName, "ptr", i_riid, "uint", i_grfOptions, i_pvConfigParamsMarshal, i_pvConfigParams, o_ppvObjectMarshal, o_ppvObject, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
