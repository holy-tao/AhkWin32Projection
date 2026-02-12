#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class FAST_IO_DEVICE_CONTROL extends IUnknown {

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
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {BOOLEAN} Wait 
     * @param {Pointer<Void>} InputBuffer 
     * @param {Integer} InputBufferLength 
     * @param {Pointer<Void>} OutputBuffer 
     * @param {Integer} OutputBufferLength 
     * @param {Integer} IoControlCode 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {BOOLEAN} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(FileObject, Wait, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength, IoControlCode, IoStatus, DeviceObject) {
        InputBufferMarshal := InputBuffer is VarRef ? "ptr" : "ptr"
        OutputBufferMarshal := OutputBuffer is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", FileObject, "char", Wait, InputBufferMarshal, InputBuffer, "uint", InputBufferLength, OutputBufferMarshal, OutputBuffer, "uint", OutputBufferLength, "uint", IoControlCode, "ptr", IoStatus, "ptr", DeviceObject, "char")
        return result
    }
}
