#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneLineConfiguration.ahk
#Include ..\..\..\Guid.ahk

/**
 * A collection of properties providing information about a phone line.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelineconfiguration
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneLineConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneLineConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneLineConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets whether video calls are enabled over this phone line.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelineconfiguration.isvideocallingenabled
     * @type {Boolean} 
     */
    IsVideoCallingEnabled {
        get => this.get_IsVideoCallingEnabled()
    }

    /**
     * Gets the extended properties for this phone line.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelineconfiguration.extendedproperties
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    ExtendedProperties {
        get => this.get_ExtendedProperties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVideoCallingEnabled() {
        if (!this.HasProp("__IPhoneLineConfiguration")) {
            if ((queryResult := this.QueryInterface(IPhoneLineConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineConfiguration := IPhoneLineConfiguration(outPtr)
        }

        return this.__IPhoneLineConfiguration.get_IsVideoCallingEnabled()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_ExtendedProperties() {
        if (!this.HasProp("__IPhoneLineConfiguration")) {
            if ((queryResult := this.QueryInterface(IPhoneLineConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneLineConfiguration := IPhoneLineConfiguration(outPtr)
        }

        return this.__IPhoneLineConfiguration.get_ExtendedProperties()
    }

;@endregion Instance Methods
}
