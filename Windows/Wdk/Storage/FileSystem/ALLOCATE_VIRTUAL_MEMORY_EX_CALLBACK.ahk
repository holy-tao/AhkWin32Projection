#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class ALLOCATE_VIRTUAL_MEMORY_EX_CALLBACK extends IUnknown {

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
     * @param {HANDLE} CallbackContext 
     * @param {HANDLE} ProcessHandle 
     * @param {Pointer} BaseAddress 
     * @param {Pointer<Pointer>} RegionSize 
     * @param {Integer} AllocationType 
     * @param {Integer} PageProtection 
     * @param {Pointer<MEM_EXTENDED_PARAMETER>} ExtendedParameters 
     * @param {Integer} ExtendedParameterCount 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(CallbackContext, ProcessHandle, BaseAddress, RegionSize, AllocationType, PageProtection, ExtendedParameters, ExtendedParameterCount) {
        CallbackContext := CallbackContext is Win32Handle ? NumGet(CallbackContext, "ptr") : CallbackContext
        ProcessHandle := ProcessHandle is Win32Handle ? NumGet(ProcessHandle, "ptr") : ProcessHandle

        RegionSizeMarshal := RegionSize is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", CallbackContext, "ptr", ProcessHandle, "ptr", BaseAddress, RegionSizeMarshal, RegionSize, "uint", AllocationType, "uint", PageProtection, "ptr", ExtendedParameters, "uint", ExtendedParameterCount, "int")
        return result
    }
}
