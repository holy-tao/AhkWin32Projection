#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\HSTRING.ahk
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
     * @type {Integer} 
     */
    Win32Handle {
        get => this.get_Win32Handle()
    }

    /**
     * 
     * @param {Pointer<Void>} context_ 
     * @param {HSTRING} interfaceName 
     * @param {Pointer} callback 
     * @returns {HRESULT} 
     */
    AddPropertyGetHandler(context_, interfaceName, callback) {
        if(interfaceName is String) {
            pin := HSTRING.Create(interfaceName)
            interfaceName := pin.Value
        }
        interfaceName := interfaceName is Win32Handle ? NumGet(interfaceName, "ptr") : interfaceName

        context_Marshal := context_ is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, context_Marshal, context_, "ptr", interfaceName, "ptr", callback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} context_ 
     * @param {HSTRING} interfaceName 
     * @param {Pointer} callback 
     * @returns {HRESULT} 
     */
    AddPropertySetHandler(context_, interfaceName, callback) {
        if(interfaceName is String) {
            pin := HSTRING.Create(interfaceName)
            interfaceName := pin.Value
        }
        interfaceName := interfaceName is Win32Handle ? NumGet(interfaceName, "ptr") : interfaceName

        context_Marshal := context_ is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, context_Marshal, context_, "ptr", interfaceName, "ptr", callback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Win32Handle() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
