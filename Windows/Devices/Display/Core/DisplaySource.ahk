#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplaySource.ahk
#Include .\IDisplaySource2.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\DisplaySource.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides ownership of a source, allowing the owner to present frames.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaysource
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplaySource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplaySource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplaySource.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the adapter ID associated with this [DisplaySource](displaysource.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaysource.adapterid
     * @type {DisplayAdapterId} 
     */
    AdapterId {
        get => this.get_AdapterId()
    }

    /**
     * Gets an adapter-relative identifier for this source.
     * @remarks
     * This value can be used for interop with legacy Display Config APIs.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaysource.sourceid
     * @type {Integer} 
     */
    SourceId {
        get => this.get_SourceId()
    }

    /**
     * Get the current status for the [DisplaySource](displaysource.md).
     * 
     * You can use the [DisplaySource.StatusChanged](displaysource_statuschanged.md) event to determine when the status has changed.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaysource.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * An event that's raised when the value of the [DisplaySource.Status](displaysource_status.md) property changes. Knowledge of [DisplaySource](displaysource.md) status gives you visibility into system state transitions, and gives you the opportunity to handle those state changes.
     * @type {TypedEventHandler<DisplaySource, IInspectable>}
    */
    OnStatusChanged {
        get {
            if(!this.HasProp("__OnStatusChanged")){
                this.__OnStatusChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{65f431e8-efc4-552f-8404-321531583839}"),
                    DisplaySource,
                    IInspectable
                )
                this.__OnStatusChangedToken := this.add_StatusChanged(this.__OnStatusChanged.iface)
            }
            return this.__OnStatusChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnStatusChangedToken")) {
            this.remove_StatusChanged(this.__OnStatusChangedToken)
            this.__OnStatusChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {DisplayAdapterId} 
     */
    get_AdapterId() {
        if (!this.HasProp("__IDisplaySource")) {
            if ((queryResult := this.QueryInterface(IDisplaySource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplaySource := IDisplaySource(outPtr)
        }

        return this.__IDisplaySource.get_AdapterId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SourceId() {
        if (!this.HasProp("__IDisplaySource")) {
            if ((queryResult := this.QueryInterface(IDisplaySource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplaySource := IDisplaySource(outPtr)
        }

        return this.__IDisplaySource.get_SourceId()
    }

    /**
     * Retrieves dynamic metadata from the source.
     * @param {Guid} Key 
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaysource.getmetadata
     */
    GetMetadata(Key) {
        if (!this.HasProp("__IDisplaySource")) {
            if ((queryResult := this.QueryInterface(IDisplaySource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplaySource := IDisplaySource(outPtr)
        }

        return this.__IDisplaySource.GetMetadata(Key)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IDisplaySource2")) {
            if ((queryResult := this.QueryInterface(IDisplaySource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplaySource2 := IDisplaySource2(outPtr)
        }

        return this.__IDisplaySource2.get_Status()
    }

    /**
     * 
     * @param {TypedEventHandler<DisplaySource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusChanged(handler) {
        if (!this.HasProp("__IDisplaySource2")) {
            if ((queryResult := this.QueryInterface(IDisplaySource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplaySource2 := IDisplaySource2(outPtr)
        }

        return this.__IDisplaySource2.add_StatusChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StatusChanged(token) {
        if (!this.HasProp("__IDisplaySource2")) {
            if ((queryResult := this.QueryInterface(IDisplaySource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplaySource2 := IDisplaySource2(outPtr)
        }

        return this.__IDisplaySource2.remove_StatusChanged(token)
    }

;@endregion Instance Methods
}
