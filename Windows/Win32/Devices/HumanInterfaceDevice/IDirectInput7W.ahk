#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirectInput2W.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 * @charset Unicode
 */
class IDirectInput7W extends IDirectInput2W{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectInput7W
     * @type {Guid}
     */
    static IID => Guid("{9a4cb685-236d-11d3-8e9d-00c04f6844ae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDeviceEx"]

    /**
     * 
     * @param {Pointer<Guid>} param0 
     * @param {Pointer<Guid>} param1 
     * @param {Pointer<Pointer<Void>>} param2 
     * @param {IUnknown} param3 
     * @returns {HRESULT} 
     */
    CreateDeviceEx(param0, param1, param2, param3) {
        result := ComCall(9, this, "ptr", param0, "ptr", param1, "ptr*", param2, "ptr", param3, "HRESULT")
        return result
    }
}
