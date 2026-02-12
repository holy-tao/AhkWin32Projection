#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionFrameSourcePropertiesChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about an attempt to change properties on a frame source.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptionframesourcepropertieschangedeventargs
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionFrameSourcePropertiesChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionFrameSourcePropertiesChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionFrameSourcePropertiesChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type of change that occurred as a result of the property change request.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptionframesourcepropertieschangedeventargs.collectionchange
     * @type {Integer} 
     */
    CollectionChange {
        get => this.get_CollectionChange()
    }

    /**
     * Gets a string key indicating the location of the change in the collection.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptionframesourcepropertieschangedeventargs.key
     * @type {HSTRING} 
     */
    Key {
        get => this.get_Key()
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
    get_CollectionChange() {
        if (!this.HasProp("__IPerceptionFrameSourcePropertiesChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPerceptionFrameSourcePropertiesChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionFrameSourcePropertiesChangedEventArgs := IPerceptionFrameSourcePropertiesChangedEventArgs(outPtr)
        }

        return this.__IPerceptionFrameSourcePropertiesChangedEventArgs.get_CollectionChange()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Key() {
        if (!this.HasProp("__IPerceptionFrameSourcePropertiesChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPerceptionFrameSourcePropertiesChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionFrameSourcePropertiesChangedEventArgs := IPerceptionFrameSourcePropertiesChangedEventArgs(outPtr)
        }

        return this.__IPerceptionFrameSourcePropertiesChangedEventArgs.get_Key()
    }

;@endregion Instance Methods
}
