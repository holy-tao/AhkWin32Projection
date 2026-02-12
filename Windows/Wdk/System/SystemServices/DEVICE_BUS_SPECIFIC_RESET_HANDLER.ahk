#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class DEVICE_BUS_SPECIFIC_RESET_HANDLER extends IUnknown {

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
     * @param {Pointer<Void>} InterfaceContext 
     * @param {Pointer<Guid>} BusType 
     * @param {DEVICE_BUS_SPECIFIC_RESET_TYPE} ResetTypeSelected 
     * @param {Pointer<BUS_SPECIFIC_RESET_FLAGS>} Flags 
     * @param {Pointer<Void>} ResetParameters 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(InterfaceContext, BusType, ResetTypeSelected, Flags, ResetParameters) {
        InterfaceContextMarshal := InterfaceContext is VarRef ? "ptr" : "ptr"
        ResetParametersMarshal := ResetParameters is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, InterfaceContextMarshal, InterfaceContext, "ptr", BusType, "ptr", ResetTypeSelected, "ptr", Flags, ResetParametersMarshal, ResetParameters, "int")
        return result
    }
}
