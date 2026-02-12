#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UStringCaseMapper extends IUnknown {

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
     * @param {Pointer<UCaseMap>} csm 
     * @param {Pointer<Integer>} dest 
     * @param {Integer} destCapacity 
     * @param {Pointer<Integer>} src 
     * @param {Integer} srcLength 
     * @param {Pointer<Integer>} pErrorCode 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(csm, dest, destCapacity, src, srcLength, pErrorCode) {
        destMarshal := dest is VarRef ? "ushort*" : "ptr"
        srcMarshal := src is VarRef ? "ushort*" : "ptr"
        pErrorCodeMarshal := pErrorCode is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", csm, destMarshal, dest, "int", destCapacity, srcMarshal, src, "int", srcLength, pErrorCodeMarshal, pErrorCode, "int")
        return result
    }
}
