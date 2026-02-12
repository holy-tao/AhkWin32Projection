#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITargetedContentCollection.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a collection of items or sub-collections in a [TargetedContentContainer](targetedcontentcontainer.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentcollection
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class TargetedContentCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITargetedContentCollection

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITargetedContentCollection.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ID of the Collection.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentcollection.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the path to an item in the content collection.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentcollection.path
     * @type {HSTRING} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * Gets a dictionary of property name keys and [TargetedContentValue](targetedcontentvalue.md) objects in the content collection.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentcollection.properties
     * @type {IMapView<HSTRING, TargetedContentValue>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets a collection of [TargetedContentCollection](targetedcontentcollection.md) objects in this content collection.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentcollection.collections
     * @type {IVectorView<TargetedContentCollection>} 
     */
    Collections {
        get => this.get_Collections()
    }

    /**
     * Gets a collection of [TargetedContentItem](targetedcontentitem.md) objects.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentcollection.items
     * @type {IVectorView<TargetedContentItem>} 
     */
    Items {
        get => this.get_Items()
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
    get_Id() {
        if (!this.HasProp("__ITargetedContentCollection")) {
            if ((queryResult := this.QueryInterface(ITargetedContentCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentCollection := ITargetedContentCollection(outPtr)
        }

        return this.__ITargetedContentCollection.get_Id()
    }

    /**
     * Reports interaction types for a [TargetedContentCollection](targetedcontentcollection.md) object.
     * @param {Integer} interaction The type of interaction supported by the [TargetedContentCollection](targetedcontentcollection.md) object in a [TargetedContentContainer](targetedcontentcontainer.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentcollection.reportinteraction
     */
    ReportInteraction(interaction) {
        if (!this.HasProp("__ITargetedContentCollection")) {
            if ((queryResult := this.QueryInterface(ITargetedContentCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentCollection := ITargetedContentCollection(outPtr)
        }

        return this.__ITargetedContentCollection.ReportInteraction(interaction)
    }

    /**
     * Reports custom interaction for a TargetedContentCollection object.
     * @param {HSTRING} customInteractionName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentcollection.reportcustominteraction
     */
    ReportCustomInteraction(customInteractionName) {
        if (!this.HasProp("__ITargetedContentCollection")) {
            if ((queryResult := this.QueryInterface(ITargetedContentCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentCollection := ITargetedContentCollection(outPtr)
        }

        return this.__ITargetedContentCollection.ReportCustomInteraction(customInteractionName)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Path() {
        if (!this.HasProp("__ITargetedContentCollection")) {
            if ((queryResult := this.QueryInterface(ITargetedContentCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentCollection := ITargetedContentCollection(outPtr)
        }

        return this.__ITargetedContentCollection.get_Path()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, TargetedContentValue>} 
     */
    get_Properties() {
        if (!this.HasProp("__ITargetedContentCollection")) {
            if ((queryResult := this.QueryInterface(ITargetedContentCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentCollection := ITargetedContentCollection(outPtr)
        }

        return this.__ITargetedContentCollection.get_Properties()
    }

    /**
     * 
     * @returns {IVectorView<TargetedContentCollection>} 
     */
    get_Collections() {
        if (!this.HasProp("__ITargetedContentCollection")) {
            if ((queryResult := this.QueryInterface(ITargetedContentCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentCollection := ITargetedContentCollection(outPtr)
        }

        return this.__ITargetedContentCollection.get_Collections()
    }

    /**
     * 
     * @returns {IVectorView<TargetedContentItem>} 
     */
    get_Items() {
        if (!this.HasProp("__ITargetedContentCollection")) {
            if ((queryResult := this.QueryInterface(ITargetedContentCollection.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentCollection := ITargetedContentCollection(outPtr)
        }

        return this.__ITargetedContentCollection.get_Items()
    }

;@endregion Instance Methods
}
