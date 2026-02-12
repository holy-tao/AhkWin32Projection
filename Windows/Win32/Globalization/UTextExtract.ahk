#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class UTextExtract extends IUnknown {

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
     * @param {Pointer<UText>} ut 
     * @param {Integer} nativeStart 
     * @param {Integer} nativeLimit 
     * @param {Pointer<Integer>} dest 
     * @param {Integer} destCapacity 
     * @param {Pointer<Integer>} status_ 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ut, nativeStart, nativeLimit, dest, destCapacity, status_) {
        destMarshal := dest is VarRef ? "ushort*" : "ptr"
        status_Marshal := status_ is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", ut, "int64", nativeStart, "int64", nativeLimit, destMarshal, dest, "int", destCapacity, status_Marshal, status_, "int")
        return result
    }
}
