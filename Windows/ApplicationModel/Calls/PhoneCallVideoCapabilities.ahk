#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneCallVideoCapabilities.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the video call capabilities for a [PhoneLine](phoneline.md) instance.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallvideocapabilities
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallVideoCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneCallVideoCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneCallVideoCapabilities.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets whether this [PhoneLine](phoneline.md) instance supports video calls.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallvideocapabilities.isvideocallingcapable
     * @type {Boolean} 
     */
    IsVideoCallingCapable {
        get => this.get_IsVideoCallingCapable()
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
    get_IsVideoCallingCapable() {
        if (!this.HasProp("__IPhoneCallVideoCapabilities")) {
            if ((queryResult := this.QueryInterface(IPhoneCallVideoCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallVideoCapabilities := IPhoneCallVideoCapabilities(outPtr)
        }

        return this.__IPhoneCallVideoCapabilities.get_IsVideoCallingCapable()
    }

;@endregion Instance Methods
}
