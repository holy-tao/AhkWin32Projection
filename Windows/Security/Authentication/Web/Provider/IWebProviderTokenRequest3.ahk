#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Web.Provider
 * @version WindowsRuntime 1.4
 */
class IWebProviderTokenRequest3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebProviderTokenRequest3
     * @type {Guid}
     */
    static IID => Guid("{1b2716aa-4289-446e-9256-dafb6f66a51e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ApplicationPackageFamilyName", "get_ApplicationProcessName", "CheckApplicationForCapabilityAsync"]

    /**
     * @type {HSTRING} 
     */
    ApplicationPackageFamilyName {
        get => this.get_ApplicationPackageFamilyName()
    }

    /**
     * @type {HSTRING} 
     */
    ApplicationProcessName {
        get => this.get_ApplicationProcessName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ApplicationPackageFamilyName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ApplicationProcessName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} capabilityName 
     * @returns {IAsyncOperation<Boolean>} 
     */
    CheckApplicationForCapabilityAsync(capabilityName) {
        if(capabilityName is String) {
            pin := HSTRING.Create(capabilityName)
            capabilityName := pin.Value
        }
        capabilityName := capabilityName is Win32Handle ? NumGet(capabilityName, "ptr") : capabilityName

        result := ComCall(8, this, "ptr", capabilityName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
