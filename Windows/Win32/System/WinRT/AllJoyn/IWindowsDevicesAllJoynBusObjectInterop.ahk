#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IInspectable.ahk

/**
 * @namespace Windows.Win32.System.WinRT.AllJoyn
 * @version v4.0.30319
 */
class IWindowsDevicesAllJoynBusObjectInterop extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsDevicesAllJoynBusObjectInterop
     * @type {Guid}
     */
    static IID => Guid("{d78aa3d5-5054-428f-99f2-ec3a5de3c3bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddPropertyGetHandler", "AddPropertySetHandler", "get_Win32Handle"]

    /**
     * 
     * @param {Pointer<Void>} context 
     * @param {HSTRING} interfaceName 
     * @param {Pointer} callback 
     * @returns {HRESULT} 
     */
    AddPropertyGetHandler(context, interfaceName, callback) {
        interfaceName := interfaceName is Win32Handle ? NumGet(interfaceName, "ptr") : interfaceName

        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, contextMarshal, context, "ptr", interfaceName, "ptr", callback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} context 
     * @param {HSTRING} interfaceName 
     * @param {Pointer} callback 
     * @returns {HRESULT} 
     */
    AddPropertySetHandler(context, interfaceName, callback) {
        interfaceName := interfaceName is Win32Handle ? NumGet(interfaceName, "ptr") : interfaceName

        contextMarshal := context is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, contextMarshal, context, "ptr", interfaceName, "ptr", callback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} value 
     * @returns {HRESULT} 
     */
    get_Win32Handle(value) {
        valueMarshal := value is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, valueMarshal, value, "HRESULT")
        return result
    }
}
