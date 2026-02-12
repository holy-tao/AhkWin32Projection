#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContentPrefetchTrigger.ahk
#Include .\IContentPrefetchTriggerFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the ability to run custom handlers when prefetching web resources.
 * @remarks
 * Developers can attach a handler to preload and cache web content so an app can launch and have its content refreshed and up to date. Accessing cached content helps reduce app activation time by not having to queue costly web requests.
 * 
 * In addition to custom tasks, the existing [ContentPrefetcher](../windows.networking.backgroundtransfer/contentprefetcher.md) API is still available and can be used instead of the custom task when the prerequisite work only involves preloading and caching content from a fixed or dynamic set of URIs.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.contentprefetchtrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class ContentPrefetchTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContentPrefetchTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContentPrefetchTrigger.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [ContentPrefetchTrigger](contentprefetchtrigger.md) class using a specified time interval.
     * @param {TimeSpan} waitInterval Interval before next allowed content prefetch.
     * @returns {ContentPrefetchTrigger} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.contentprefetchtrigger.#ctor
     */
    static Create(waitInterval) {
        if (!ContentPrefetchTrigger.HasProp("__IContentPrefetchTriggerFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.ContentPrefetchTrigger")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPrefetchTriggerFactory.IID)
            ContentPrefetchTrigger.__IContentPrefetchTriggerFactory := IContentPrefetchTriggerFactory(factoryPtr)
        }

        return ContentPrefetchTrigger.__IContentPrefetchTriggerFactory.Create(waitInterval)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Retrieves the time interval for prefetching web content.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.contentprefetchtrigger.waitinterval
     * @type {TimeSpan} 
     */
    WaitInterval {
        get => this.get_WaitInterval()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ContentPrefetchTrigger](contentprefetchtrigger.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.ContentPrefetchTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_WaitInterval() {
        if (!this.HasProp("__IContentPrefetchTrigger")) {
            if ((queryResult := this.QueryInterface(IContentPrefetchTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentPrefetchTrigger := IContentPrefetchTrigger(outPtr)
        }

        return this.__IContentPrefetchTrigger.get_WaitInterval()
    }

;@endregion Instance Methods
}
