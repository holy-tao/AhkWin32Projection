#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHardwareToken.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a token that contains a hardware based identification that is sufficiently unique.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.profile.hardwaretoken
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class HardwareToken extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHardwareToken

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHardwareToken.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the hardware identifier that identifies the device.
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.hardwaretoken.id
     * @type {IBuffer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the digital signature of hardware [Id](hardwaretoken_id.md) that helps verify the authenticity of returned [Id](hardwaretoken_id.md).
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.hardwaretoken.signature
     * @type {IBuffer} 
     */
    Signature {
        get => this.get_Signature()
    }

    /**
     * Gets the certificate that is used to sign the [Id](hardwaretoken_id.md) and is used to help verify the authenticity of the [Id](hardwaretoken_id.md).
     * @see https://learn.microsoft.com/uwp/api/windows.system.profile.hardwaretoken.certificate
     * @type {IBuffer} 
     */
    Certificate {
        get => this.get_Certificate()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Id() {
        if (!this.HasProp("__IHardwareToken")) {
            if ((queryResult := this.QueryInterface(IHardwareToken.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHardwareToken := IHardwareToken(outPtr)
        }

        return this.__IHardwareToken.get_Id()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Signature() {
        if (!this.HasProp("__IHardwareToken")) {
            if ((queryResult := this.QueryInterface(IHardwareToken.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHardwareToken := IHardwareToken(outPtr)
        }

        return this.__IHardwareToken.get_Signature()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Certificate() {
        if (!this.HasProp("__IHardwareToken")) {
            if ((queryResult := this.QueryInterface(IHardwareToken.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHardwareToken := IHardwareToken(outPtr)
        }

        return this.__IHardwareToken.get_Certificate()
    }

;@endregion Instance Methods
}
