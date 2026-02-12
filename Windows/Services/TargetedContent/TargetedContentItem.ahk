#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITargetedContentItem.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an item in a [TargetedContentCollection](targetedcontentcollection.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentitem
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class TargetedContentItem extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITargetedContentItem

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITargetedContentItem.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the string path of the TargetedContentItem object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentitem.path
     * @type {HSTRING} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * Gets the [TargetedContentItemState](targetedcontentitemstate.md) for the item.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentitem.state
     * @type {TargetedContentItemState} 
     */
    State {
        get => this.get_State()
    }

    /**
     * Gets a collection containing property names (as keys) and [TargetedContentValue](targetedcontentvalue.md) objects.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentitem.properties
     * @type {IMapView<HSTRING, TargetedContentValue>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets a TargetedContentCollection object in the TargetedContentItem object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentitem.collections
     * @type {IVectorView<TargetedContentCollection>} 
     */
    Collections {
        get => this.get_Collections()
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
    get_Path() {
        if (!this.HasProp("__ITargetedContentItem")) {
            if ((queryResult := this.QueryInterface(ITargetedContentItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentItem := ITargetedContentItem(outPtr)
        }

        return this.__ITargetedContentItem.get_Path()
    }

    /**
     * Reports the [TargetedContentInteraction](targetedcontentinteraction.md) for the item.
     * @param {Integer} interaction The type of interaction supported by the [TargetedContentItem](targetedcontentitem.md) object in a [TargetedContentContainer](targetedcontentcontainer.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentitem.reportinteraction
     */
    ReportInteraction(interaction) {
        if (!this.HasProp("__ITargetedContentItem")) {
            if ((queryResult := this.QueryInterface(ITargetedContentItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentItem := ITargetedContentItem(outPtr)
        }

        return this.__ITargetedContentItem.ReportInteraction(interaction)
    }

    /**
     * Reports Custom Interaction for the item.
     * @param {HSTRING} customInteractionName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentitem.reportcustominteraction
     */
    ReportCustomInteraction(customInteractionName) {
        if (!this.HasProp("__ITargetedContentItem")) {
            if ((queryResult := this.QueryInterface(ITargetedContentItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentItem := ITargetedContentItem(outPtr)
        }

        return this.__ITargetedContentItem.ReportCustomInteraction(customInteractionName)
    }

    /**
     * 
     * @returns {TargetedContentItemState} 
     */
    get_State() {
        if (!this.HasProp("__ITargetedContentItem")) {
            if ((queryResult := this.QueryInterface(ITargetedContentItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentItem := ITargetedContentItem(outPtr)
        }

        return this.__ITargetedContentItem.get_State()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, TargetedContentValue>} 
     */
    get_Properties() {
        if (!this.HasProp("__ITargetedContentItem")) {
            if ((queryResult := this.QueryInterface(ITargetedContentItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentItem := ITargetedContentItem(outPtr)
        }

        return this.__ITargetedContentItem.get_Properties()
    }

    /**
     * 
     * @returns {IVectorView<TargetedContentCollection>} 
     */
    get_Collections() {
        if (!this.HasProp("__ITargetedContentItem")) {
            if ((queryResult := this.QueryInterface(ITargetedContentItem.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentItem := ITargetedContentItem(outPtr)
        }

        return this.__ITargetedContentItem.get_Collections()
    }

;@endregion Instance Methods
}
