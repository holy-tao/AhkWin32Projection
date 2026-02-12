#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SmartCardEmulatorConnectionProperties.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class ISmartCardEmulatorConnectionDeactivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmartCardEmulatorConnectionDeactivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{2186d8d3-c5eb-5262-43df-62a0a1b55557}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ConnectionProperties", "get_Reason"]

    /**
     * @type {SmartCardEmulatorConnectionProperties} 
     */
    ConnectionProperties {
        get => this.get_ConnectionProperties()
    }

    /**
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
    }

    /**
     * 
     * @returns {SmartCardEmulatorConnectionProperties} 
     */
    get_ConnectionProperties() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SmartCardEmulatorConnectionProperties(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Reason() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
