#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ActivationSignalDetectionConfiguration.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class IActivationSignalDetectionConfigurationCreationResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActivationSignalDetectionConfigurationCreationResult
     * @type {Guid}
     */
    static IID => Guid("{4c89bc1b-8d12-5e48-a71c-7f6bc1cd66e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_Configuration"]

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {ActivationSignalDetectionConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {ActivationSignalDetectionConfiguration} 
     */
    get_Configuration() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ActivationSignalDetectionConfiguration(value)
    }
}
