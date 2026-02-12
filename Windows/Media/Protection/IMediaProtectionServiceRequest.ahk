#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Allows a content enabler object to be exposed directly to an application rather than through a wrapper supplied by the ContentEnabler object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.imediaprotectionservicerequest
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class IMediaProtectionServiceRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaProtectionServiceRequest
     * @type {Guid}
     */
    static IID => Guid("{b1de0ea6-2094-478d-87a4-8b95200f85c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProtectionSystem", "get_Type"]

    /**
     * Allows the application to identify the content protection system being used and therefore how to interpret the protection task.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.imediaprotectionservicerequest.protectionsystem
     * @type {Guid} 
     */
    ProtectionSystem {
        get => this.get_ProtectionSystem()
    }

    /**
     * Retrieves the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the type of operation that the [IMediaProtectionServiceRequest](imediaprotectionservicerequest.md) performs.
     * @remarks
     * The possible values of Type depend on the content protection system used for the content. This can be determined by context or by inspecting the [ProtectionSystem](imediaprotectionservicerequest_protectionsystem.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.imediaprotectionservicerequest.type
     * @type {Guid} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ProtectionSystem() {
        system := Guid()
        result := ComCall(6, this, "ptr", system, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return system
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Type() {
        type := Guid()
        result := ComCall(7, this, "ptr", type, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return type
    }
}
