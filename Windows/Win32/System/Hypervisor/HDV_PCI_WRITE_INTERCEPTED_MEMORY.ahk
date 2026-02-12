#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * HDV_PCI_WRITE_INTERCEPTED_MEMORY
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvPciWriteInterceptedMemory
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class HDV_PCI_WRITE_INTERCEPTED_MEMORY extends IUnknown {

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
     * @param {Pointer<Void>} deviceContext 
     * @param {Integer} barIndex 
     * @param {Integer} offset 
     * @param {Integer} length 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(deviceContext, barIndex, offset, length, value) {
        deviceContextMarshal := deviceContext is VarRef ? "ptr" : "ptr"
        valueMarshal := value is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, deviceContextMarshal, deviceContext, "int", barIndex, "uint", offset, "uint", length, valueMarshal, value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
