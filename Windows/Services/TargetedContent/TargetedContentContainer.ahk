#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITargetedContentContainer.ahk
#Include .\ITargetedContentContainerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a container for all the content in a TargetedContentSubscription object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentcontainer
 * @namespace Windows.Services.TargetedContent
 * @version WindowsRuntime 1.4
 */
class TargetedContentContainer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITargetedContentContainer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITargetedContentContainer.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns a TargetedContentContainer object for specified ContentId.
     * @param {HSTRING} contentId 
     * @returns {IAsyncOperation<TargetedContentContainer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentcontainer.getasync
     */
    static GetAsync(contentId) {
        if (!TargetedContentContainer.HasProp("__ITargetedContentContainerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.TargetedContent.TargetedContentContainer")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITargetedContentContainerStatics.IID)
            TargetedContentContainer.__ITargetedContentContainerStatics := ITargetedContentContainerStatics(factoryPtr)
        }

        return TargetedContentContainer.__ITargetedContentContainerStatics.GetAsync(contentId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the ID for the TargetedContainerContainer object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentcontainer.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * The time the content was last updated.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentcontainer.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the [TargetedContentAvailability](targetedcontentavailability.md) for the content in a [TargetedContentContainer](targetedcontentcontainer.md).
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentcontainer.availability
     * @type {Integer} 
     */
    Availability {
        get => this.get_Availability()
    }

    /**
     * Gets a [TargetedContentCollection](targetedcontentcollection.md) for a [TargetedContentContainer](targetedcontentcontainer.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentcontainer.content
     * @type {TargetedContentCollection} 
     */
    Content {
        get => this.get_Content()
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
        if (!this.HasProp("__ITargetedContentContainer")) {
            if ((queryResult := this.QueryInterface(ITargetedContentContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentContainer := ITargetedContentContainer(outPtr)
        }

        return this.__ITargetedContentContainer.get_Id()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__ITargetedContentContainer")) {
            if ((queryResult := this.QueryInterface(ITargetedContentContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentContainer := ITargetedContentContainer(outPtr)
        }

        return this.__ITargetedContentContainer.get_Timestamp()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Availability() {
        if (!this.HasProp("__ITargetedContentContainer")) {
            if ((queryResult := this.QueryInterface(ITargetedContentContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentContainer := ITargetedContentContainer(outPtr)
        }

        return this.__ITargetedContentContainer.get_Availability()
    }

    /**
     * 
     * @returns {TargetedContentCollection} 
     */
    get_Content() {
        if (!this.HasProp("__ITargetedContentContainer")) {
            if ((queryResult := this.QueryInterface(ITargetedContentContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentContainer := ITargetedContentContainer(outPtr)
        }

        return this.__ITargetedContentContainer.get_Content()
    }

    /**
     * Gets the TargetedContentObject object in the TargetedContentContainer object.
     * @param {HSTRING} path_ 
     * @returns {TargetedContentObject} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.targetedcontent.targetedcontentcontainer.selectsingleobject
     */
    SelectSingleObject(path_) {
        if (!this.HasProp("__ITargetedContentContainer")) {
            if ((queryResult := this.QueryInterface(ITargetedContentContainer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetedContentContainer := ITargetedContentContainer(outPtr)
        }

        return this.__ITargetedContentContainer.SelectSingleObject(path_)
    }

;@endregion Instance Methods
}
