#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * HDV_PCI_DEVICE_STOP
 * @see https://learn.microsoft.com/virtualization/api/hcs/Reference/hdv/HdvPciDeviceStop
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class HDV_PCI_DEVICE_STOP extends IUnknown {

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
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(deviceContext) {
        deviceContextMarshal := deviceContext is VarRef ? "ptr" : "ptr"

        ComCall(3, this, deviceContextMarshal, deviceContext)
    }
}
