#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialEntityAddedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Event data for spatial entity added events.
 * @remarks
 * > [!IMPORTANT]
 * > The [SpatialEntityStore](spatialentitystore.md) approach of synchronizing spatial anchors between devices is not currently supported.  Consider using [Azure Spatial Anchors](/azure/spatial-anchors) instead.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialentityaddedeventargs
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialEntityAddedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialEntityAddedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialEntityAddedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the spatial entity that was added.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialentityaddedeventargs.entity
     * @type {SpatialEntity} 
     */
    Entity {
        get => this.get_Entity()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SpatialEntity} 
     */
    get_Entity() {
        if (!this.HasProp("__ISpatialEntityAddedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialEntityAddedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialEntityAddedEventArgs := ISpatialEntityAddedEventArgs(outPtr)
        }

        return this.__ISpatialEntityAddedEventArgs.get_Entity()
    }

;@endregion Instance Methods
}
