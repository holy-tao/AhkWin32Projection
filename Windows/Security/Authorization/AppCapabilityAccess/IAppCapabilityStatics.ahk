#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\AppCapability.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authorization.AppCapabilityAccess
 * @version WindowsRuntime 1.4
 */
class IAppCapabilityStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppCapabilityStatics
     * @type {Guid}
     */
    static IID => Guid("{7c353e2a-46ee-44e5-af3d-6ad3fc49bd22}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestAccessForCapabilitiesAsync", "RequestAccessForCapabilitiesForUserAsync", "Create", "CreateWithProcessIdForUser"]

    /**
     * 
     * @param {IIterable<HSTRING>} capabilityNames 
     * @returns {IAsyncOperation<IMapView<HSTRING, Integer>>} 
     */
    RequestAccessForCapabilitiesAsync(capabilityNames) {
        result := ComCall(6, this, "ptr", capabilityNames, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IMapView.Call.Bind(IMapView, (ptr) => HSTRING({ Value: ptr }), (ptr) => IPropertyValue(ptr).GetInt32()), operation)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {IIterable<HSTRING>} capabilityNames 
     * @returns {IAsyncOperation<IMapView<HSTRING, Integer>>} 
     */
    RequestAccessForCapabilitiesForUserAsync(user_, capabilityNames) {
        result := ComCall(7, this, "ptr", user_, "ptr", capabilityNames, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IMapView.Call.Bind(IMapView, (ptr) => HSTRING({ Value: ptr }), (ptr) => IPropertyValue(ptr).GetInt32()), operation)
    }

    /**
     * Create Extended Stored Procedures
     * @param {HSTRING} capabilityName 
     * @returns {AppCapability} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(capabilityName) {
        if(capabilityName is String) {
            pin := HSTRING.Create(capabilityName)
            capabilityName := pin.Value
        }
        capabilityName := capabilityName is Win32Handle ? NumGet(capabilityName, "ptr") : capabilityName

        result := ComCall(8, this, "ptr", capabilityName, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppCapability(result_)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} capabilityName 
     * @param {Integer} pid 
     * @returns {AppCapability} 
     */
    CreateWithProcessIdForUser(user_, capabilityName, pid) {
        if(capabilityName is String) {
            pin := HSTRING.Create(capabilityName)
            capabilityName := pin.Value
        }
        capabilityName := capabilityName is Win32Handle ? NumGet(capabilityName, "ptr") : capabilityName

        result := ComCall(9, this, "ptr", user_, "ptr", capabilityName, "uint", pid, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppCapability(result_)
    }
}
