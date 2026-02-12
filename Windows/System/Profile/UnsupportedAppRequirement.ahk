#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUnsupportedAppRequirement.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a reason why a particular [App Capability](/windows/uwp/packaging/app-capability-declarations) is not supported on a particular device
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.unsupportedapprequirement
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class UnsupportedAppRequirement extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUnsupportedAppRequirement

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUnsupportedAppRequirement.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The name of the [App Capability](/windows/uwp/packaging/app-capability-declarations) that is not supported
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.unsupportedapprequirement.requirement
     * @type {HSTRING} 
     */
    Requirement {
        get => this.get_Requirement()
    }

    /**
     * An [UnsupportedAppRequirementReasons](unsupportedapprequirementreasons.md) object that explains why a particular [App Capability](/windows/uwp/packaging/app-capability-declarations) is unsupported on the current device
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.unsupportedapprequirement.reasons
     * @type {Integer} 
     */
    Reasons {
        get => this.get_Reasons()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Requirement() {
        if (!this.HasProp("__IUnsupportedAppRequirement")) {
            if ((queryResult := this.QueryInterface(IUnsupportedAppRequirement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUnsupportedAppRequirement := IUnsupportedAppRequirement(outPtr)
        }

        return this.__IUnsupportedAppRequirement.get_Requirement()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Reasons() {
        if (!this.HasProp("__IUnsupportedAppRequirement")) {
            if ((queryResult := this.QueryInterface(IUnsupportedAppRequirement.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUnsupportedAppRequirement := IUnsupportedAppRequirement(outPtr)
        }

        return this.__IUnsupportedAppRequirement.get_Reasons()
    }

;@endregion Instance Methods
}
