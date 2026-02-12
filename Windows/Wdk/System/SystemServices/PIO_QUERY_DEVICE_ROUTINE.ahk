#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PIO_QUERY_DEVICE_ROUTINE extends IUnknown {

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
     * @param {Pointer<Void>} Context_ 
     * @param {Pointer<UNICODE_STRING>} PathName_ 
     * @param {Integer} BusType 
     * @param {Integer} BusNumber 
     * @param {Pointer<Pointer<KEY_VALUE_FULL_INFORMATION>>} BusInformation 
     * @param {Integer} ControllerType 
     * @param {Integer} ControllerNumber 
     * @param {Pointer<Pointer<KEY_VALUE_FULL_INFORMATION>>} ControllerInformation 
     * @param {Integer} PeripheralType 
     * @param {Integer} PeripheralNumber 
     * @param {Pointer<Pointer<KEY_VALUE_FULL_INFORMATION>>} PeripheralInformation 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Context_, PathName_, BusType, BusNumber, BusInformation, ControllerType, ControllerNumber, ControllerInformation, PeripheralType, PeripheralNumber, PeripheralInformation) {
        Context_Marshal := Context_ is VarRef ? "ptr" : "ptr"
        BusInformationMarshal := BusInformation is VarRef ? "ptr*" : "ptr"
        ControllerInformationMarshal := ControllerInformation is VarRef ? "ptr*" : "ptr"
        PeripheralInformationMarshal := PeripheralInformation is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, Context_Marshal, Context_, "ptr", PathName_, "int", BusType, "uint", BusNumber, BusInformationMarshal, BusInformation, "int", ControllerType, "uint", ControllerNumber, ControllerInformationMarshal, ControllerInformation, "int", PeripheralType, "uint", PeripheralNumber, PeripheralInformationMarshal, PeripheralInformation, "int")
        return result
    }
}
