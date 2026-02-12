#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.Foundation
 * @version v4.0.30319
 */
class FAST_IO_READ_COMPRESSED extends IUnknown {

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
     * @param {Pointer<Integer>} FileOffset 
     * @param {Integer} Length 
     * @param {Integer} LockKey 
     * @param {Pointer<Void>} Buffer_ 
     * @param {Pointer<Pointer<MDL>>} MdlChain 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @param {Pointer} CompressedDataInfo 
     * @param {Integer} CompressedDataInfoLength 
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
    Invoke(FileObject, FileOffset, Length, LockKey, Buffer_, MdlChain, IoStatus, CompressedDataInfo, CompressedDataInfoLength, DeviceObject) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
        Buffer_Marshal := Buffer_ is VarRef ? "ptr" : "ptr"
        MdlChainMarshal := MdlChain is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", FileObject, FileOffsetMarshal, FileOffset, "uint", Length, "uint", LockKey, Buffer_Marshal, Buffer_, MdlChainMarshal, MdlChain, "ptr", IoStatus, "ptr", CompressedDataInfo, "uint", CompressedDataInfoLength, "ptr", DeviceObject, "char")
        return result
    }
}
