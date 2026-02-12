#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialEntityRemovedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Event data for spatial entity removed events.
 * @remarks
 * > [!IMPORTANT]
 * > The [SpatialEntityStore](spatialentitystore.md) approach of synchronizing spatial anchors between devices is not currently supported.  Consider using [Azure Spatial Anchors](/azure/spatial-anchors) instead.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialentityremovedeventargs
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialEntityRemovedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialEntityRemovedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialEntityRemovedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the spatial entity that was removed.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.spatialentityremovedeventargs.entity
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
        if (!this.HasProp("__ISpatialEntityRemovedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialEntityRemovedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialEntityRemovedEventArgs := ISpatialEntityRemovedEventArgs(outPtr)
        }

        return this.__ISpatialEntityRemovedEventArgs.get_Entity()
    }

;@endregion Instance Methods
}
