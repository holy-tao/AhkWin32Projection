#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PTRANSLATE_RESOURCE_HANDLER extends IUnknown {

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
     * @param {Pointer<CM_PARTIAL_RESOURCE_DESCRIPTOR>} Source 
     * @param {Integer} Direction_ 
     * @param {Integer} AlternativesCount 
     * @param {Pointer<IO_RESOURCE_DESCRIPTOR>} Alternatives 
     * @param {Pointer<DEVICE_OBJECT>} PhysicalDeviceObject 
     * @param {Pointer<CM_PARTIAL_RESOURCE_DESCRIPTOR>} Target 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Context_, Source, Direction_, AlternativesCount, Alternatives, PhysicalDeviceObject, Target) {
        Context_Marshal := Context_ is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, Context_Marshal, Context_, "ptr", Source, "int", Direction_, "uint", AlternativesCount, "ptr", Alternatives, "ptr", PhysicalDeviceObject, "ptr", Target, "int")
        return result
    }
}
