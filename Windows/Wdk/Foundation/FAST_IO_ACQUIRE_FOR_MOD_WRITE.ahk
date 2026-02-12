#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class FAST_IO_ACQUIRE_FOR_MOD_WRITE extends IUnknown {

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
     * @param {Pointer<Integer>} EndingOffset 
     * @param {Pointer<Pointer<ERESOURCE>>} ResourceToRelease 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(FileObject, EndingOffset, ResourceToRelease, DeviceObject) {
        EndingOffsetMarshal := EndingOffset is VarRef ? "int64*" : "ptr"
        ResourceToReleaseMarshal := ResourceToRelease is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", FileObject, EndingOffsetMarshal, EndingOffset, ResourceToReleaseMarshal, ResourceToRelease, "ptr", DeviceObject, "int")
        return result
    }
}
