#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattLocalDescriptor.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\GattLocalDescriptor.ahk
#Include .\GattReadRequestedEventArgs.ahk
#Include .\GattWriteRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * This class defines a descriptor of a local characteristic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocaldescriptor
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattLocalDescriptor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGattLocalDescriptor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGattLocalDescriptor.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Bluetooth SIG-defined UUID for this local characteristic descriptor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocaldescriptor.uuid
     * @type {Guid} 
     */
    Uuid {
        get => this.get_Uuid()
    }

    /**
     * Gets the static value for this local characteristic descriptor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocaldescriptor.staticvalue
     * @type {IBuffer} 
     */
    StaticValue {
        get => this.get_StaticValue()
    }

    /**
     * Gets the read protection level of this local characteristic descriptor.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocaldescriptor.readprotectionlevel
     * @type {Integer} 
     */
    ReadProtectionLevel {
        get => this.get_ReadProtectionLevel()
    }

    /**
     * Gets the write protection level.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattlocaldescriptor.writeprotectionlevel
     * @type {Integer} 
     */
    WriteProtectionLevel {
        get => this.get_WriteProtectionLevel()
    }

    /**
     * An event that is triggered when a read has been requested.
     * @type {TypedEventHandler<GattLocalDescriptor, GattReadRequestedEventArgs>}
    */
    OnReadRequested {
        get {
            if(!this.HasProp("__OnReadRequested")){
                this.__OnReadRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{252dca5c-86e7-5be1-aeed-f78c6ed466ab}"),
                    GattLocalDescriptor,
                    GattReadRequestedEventArgs
                )
                this.__OnReadRequestedToken := this.add_ReadRequested(this.__OnReadRequested.iface)
            }
            return this.__OnReadRequested
        }
    }

    /**
     * An event that is triggered when a write has been requested.
     * @type {TypedEventHandler<GattLocalDescriptor, GattWriteRequestedEventArgs>}
    */
    OnWriteRequested {
        get {
            if(!this.HasProp("__OnWriteRequested")){
                this.__OnWriteRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{6cf5b169-3731-591b-ae7c-d939faaa8a71}"),
                    GattLocalDescriptor,
                    GattWriteRequestedEventArgs
                )
                this.__OnWriteRequestedToken := this.add_WriteRequested(this.__OnWriteRequested.iface)
            }
            return this.__OnWriteRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnReadRequestedToken")) {
            this.remove_ReadRequested(this.__OnReadRequestedToken)
            this.__OnReadRequested.iface.Dispose()
        }

        if(this.HasProp("__OnWriteRequestedToken")) {
            this.remove_WriteRequested(this.__OnWriteRequestedToken)
            this.__OnWriteRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Uuid() {
        if (!this.HasProp("__IGattLocalDescriptor")) {
            if ((queryResult := this.QueryInterface(IGattLocalDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalDescriptor := IGattLocalDescriptor(outPtr)
        }

        return this.__IGattLocalDescriptor.get_Uuid()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_StaticValue() {
        if (!this.HasProp("__IGattLocalDescriptor")) {
            if ((queryResult := this.QueryInterface(IGattLocalDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalDescriptor := IGattLocalDescriptor(outPtr)
        }

        return this.__IGattLocalDescriptor.get_StaticValue()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReadProtectionLevel() {
        if (!this.HasProp("__IGattLocalDescriptor")) {
            if ((queryResult := this.QueryInterface(IGattLocalDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalDescriptor := IGattLocalDescriptor(outPtr)
        }

        return this.__IGattLocalDescriptor.get_ReadProtectionLevel()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WriteProtectionLevel() {
        if (!this.HasProp("__IGattLocalDescriptor")) {
            if ((queryResult := this.QueryInterface(IGattLocalDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalDescriptor := IGattLocalDescriptor(outPtr)
        }

        return this.__IGattLocalDescriptor.get_WriteProtectionLevel()
    }

    /**
     * 
     * @param {TypedEventHandler<GattLocalDescriptor, GattReadRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReadRequested(handler) {
        if (!this.HasProp("__IGattLocalDescriptor")) {
            if ((queryResult := this.QueryInterface(IGattLocalDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalDescriptor := IGattLocalDescriptor(outPtr)
        }

        return this.__IGattLocalDescriptor.add_ReadRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReadRequested(token) {
        if (!this.HasProp("__IGattLocalDescriptor")) {
            if ((queryResult := this.QueryInterface(IGattLocalDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalDescriptor := IGattLocalDescriptor(outPtr)
        }

        return this.__IGattLocalDescriptor.remove_ReadRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<GattLocalDescriptor, GattWriteRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_WriteRequested(handler) {
        if (!this.HasProp("__IGattLocalDescriptor")) {
            if ((queryResult := this.QueryInterface(IGattLocalDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalDescriptor := IGattLocalDescriptor(outPtr)
        }

        return this.__IGattLocalDescriptor.add_WriteRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_WriteRequested(token) {
        if (!this.HasProp("__IGattLocalDescriptor")) {
            if ((queryResult := this.QueryInterface(IGattLocalDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGattLocalDescriptor := IGattLocalDescriptor(outPtr)
        }

        return this.__IGattLocalDescriptor.remove_WriteRequested(token)
    }

;@endregion Instance Methods
}
