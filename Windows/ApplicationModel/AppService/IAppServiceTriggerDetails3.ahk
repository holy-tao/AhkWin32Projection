#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.AppService
 * @version WindowsRuntime 1.4
 */
class IAppServiceTriggerDetails3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppServiceTriggerDetails3
     * @type {Guid}
     */
    static IID => Guid("{fbd71e21-7939-4e68-9e3c-7780147aabb6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CheckCallerForCapabilityAsync"]

    /**
     * 
     * @param {HSTRING} capabilityName 
     * @returns {IAsyncOperation<Boolean>} 
     */
    CheckCallerForCapabilityAsync(capabilityName) {
        if(capabilityName is String) {
            pin := HSTRING.Create(capabilityName)
            capabilityName := pin.Value
        }
        capabilityName := capabilityName is Win32Handle ? NumGet(capabilityName, "ptr") : capabilityName

        result := ComCall(6, this, "ptr", capabilityName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetBoolean(), operation)
    }
}
