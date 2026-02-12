#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * HDV_PCI_DEVICE_GET_DETAILS
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvPciDeviceGetDetails
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class HDV_PCI_DEVICE_GET_DETAILS extends IUnknown {

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
     * @param {Pointer<HDV_PCI_PNP_ID>} pnpId 
     * @param {Integer} probedBarsCount 
     * @param {Pointer<Integer>} probedBars 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(deviceContext, pnpId, probedBarsCount, probedBars) {
        deviceContextMarshal := deviceContext is VarRef ? "ptr" : "ptr"
        probedBarsMarshal := probedBars is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, deviceContextMarshal, deviceContext, "ptr", pnpId, "uint", probedBarsCount, probedBarsMarshal, probedBars, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
