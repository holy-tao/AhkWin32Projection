#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetShell
 * @version v4.0.30319
 */
class PFN_HANDLE_CMD extends IUnknown {

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
     * @param {PWSTR} pwszMachine 
     * @param {Pointer<PWSTR>} ppwcArguments 
     * @param {Integer} dwCurrentIndex 
     * @param {Integer} dwArgCount 
     * @param {Integer} dwFlags 
     * @param {Pointer<Void>} pvData 
     * @param {Pointer<BOOL>} pbDone 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pwszMachine, ppwcArguments, dwCurrentIndex, dwArgCount, dwFlags, pvData, pbDone) {
        pwszMachine := pwszMachine is String ? StrPtr(pwszMachine) : pwszMachine

        ppwcArgumentsMarshal := ppwcArguments is VarRef ? "ptr*" : "ptr"
        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"
        pbDoneMarshal := pbDone is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pwszMachine, ppwcArgumentsMarshal, ppwcArguments, "uint", dwCurrentIndex, "uint", dwArgCount, "uint", dwFlags, pvDataMarshal, pvData, pbDoneMarshal, pbDone, "uint")
        return result
    }
}
