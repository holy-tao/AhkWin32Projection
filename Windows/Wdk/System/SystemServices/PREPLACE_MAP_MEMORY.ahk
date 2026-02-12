#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PREPLACE_MAP_MEMORY extends IUnknown {

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
     * @param {Integer} TargetPhysicalAddress 
     * @param {Integer} SparePhysicalAddress 
     * @param {Pointer<Integer>} NumberOfBytes 
     * @param {Pointer<Pointer<Void>>} TargetAddress 
     * @param {Pointer<Pointer<Void>>} SpareAddress 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(TargetPhysicalAddress, SparePhysicalAddress, NumberOfBytes, TargetAddress, SpareAddress) {
        NumberOfBytesMarshal := NumberOfBytes is VarRef ? "int64*" : "ptr"
        TargetAddressMarshal := TargetAddress is VarRef ? "ptr*" : "ptr"
        SpareAddressMarshal := SpareAddress is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "int64", TargetPhysicalAddress, "int64", SparePhysicalAddress, NumberOfBytesMarshal, NumberOfBytes, TargetAddressMarshal, TargetAddress, SpareAddressMarshal, SpareAddress, "int")
        return result
    }
}
