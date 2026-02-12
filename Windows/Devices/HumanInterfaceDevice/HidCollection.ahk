#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHidCollection.ahk
#Include ..\..\..\Guid.ahk

/**
 * Retrieves the collection information for a group of related controls.
  * 
  * The HID protocol uses collections to group a set of controls that are similar to one another, or, are related by physical or operational proximity.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidcollection
 * @namespace Windows.Devices.HumanInterfaceDevice
 * @version WindowsRuntime 1.4
 */
class HidCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHidCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHidCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier for a collection of HID controls.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidcollection.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the collection type.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidcollection.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets the usage page for the given control collection.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidcollection.usagepage
     * @type {Integer} 
     */
    UsagePage {
        get => this.get_UsagePage()
    }

    /**
     * Gets the usage identifier for the given control collection.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidcollection.usageid
     * @type {Integer} 
     */
    UsageId {
        get => this.get_UsageId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        if (!this.HasProp("__IHidCollection")) {
            if ((queryResult := this.QueryInterface(IHidCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidCollection := IHidCollection(outPtr)
        }

        return this.__IHidCollection.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        if (!this.HasProp("__IHidCollection")) {
            if ((queryResult := this.QueryInterface(IHidCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidCollection := IHidCollection(outPtr)
        }

        return this.__IHidCollection.get_Type()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsagePage() {
        if (!this.HasProp("__IHidCollection")) {
            if ((queryResult := this.QueryInterface(IHidCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidCollection := IHidCollection(outPtr)
        }

        return this.__IHidCollection.get_UsagePage()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UsageId() {
        if (!this.HasProp("__IHidCollection")) {
            if ((queryResult := this.QueryInterface(IHidCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidCollection := IHidCollection(outPtr)
        }

        return this.__IHidCollection.get_UsageId()
    }

;@endregion Instance Methods
}
