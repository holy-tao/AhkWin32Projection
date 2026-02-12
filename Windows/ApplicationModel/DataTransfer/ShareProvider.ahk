#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IShareProvider.ahk
#Include .\IShareProviderFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * This class represents a custom provider which can be shared.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.shareprovider
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class ShareProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IShareProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IShareProvider.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new ShareProvider object.
     * @param {HSTRING} title The title of the share provider.
     * @param {RandomAccessStreamReference} displayIcon The display icon of the share provider.
     * @param {Color} backgroundColor The background color of the share provider.
     * @param {ShareProviderHandler} handler The handler of the share provider.
     * @returns {ShareProvider} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.shareprovider.#ctor
     */
    static Create(title, displayIcon, backgroundColor, handler) {
        if (!ShareProvider.HasProp("__IShareProviderFactory")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.ShareProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IShareProviderFactory.IID)
            ShareProvider.__IShareProviderFactory := IShareProviderFactory(factoryPtr)
        }

        return ShareProvider.__IShareProviderFactory.Create(title, displayIcon, backgroundColor, handler)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the title of the share provider.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.shareprovider.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * Gets the display icon of the share provider.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.shareprovider.displayicon
     * @type {RandomAccessStreamReference} 
     */
    DisplayIcon {
        get => this.get_DisplayIcon()
    }

    /**
     * Gets the background color of the share provider.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.shareprovider.backgroundcolor
     * @type {Color} 
     */
    BackgroundColor {
        get => this.get_BackgroundColor()
    }

    /**
     * Gets or sets the tag of the share provider.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.shareprovider.tag
     * @type {IInspectable} 
     */
    Tag {
        get => this.get_Tag()
        set => this.put_Tag(value)
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
    get_Title() {
        if (!this.HasProp("__IShareProvider")) {
            if ((queryResult := this.QueryInterface(IShareProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareProvider := IShareProvider(outPtr)
        }

        return this.__IShareProvider.get_Title()
    }

    /**
     * 
     * @returns {RandomAccessStreamReference} 
     */
    get_DisplayIcon() {
        if (!this.HasProp("__IShareProvider")) {
            if ((queryResult := this.QueryInterface(IShareProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareProvider := IShareProvider(outPtr)
        }

        return this.__IShareProvider.get_DisplayIcon()
    }

    /**
     * 
     * @returns {Color} 
     */
    get_BackgroundColor() {
        if (!this.HasProp("__IShareProvider")) {
            if ((queryResult := this.QueryInterface(IShareProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareProvider := IShareProvider(outPtr)
        }

        return this.__IShareProvider.get_BackgroundColor()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Tag() {
        if (!this.HasProp("__IShareProvider")) {
            if ((queryResult := this.QueryInterface(IShareProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareProvider := IShareProvider(outPtr)
        }

        return this.__IShareProvider.get_Tag()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Tag(value) {
        if (!this.HasProp("__IShareProvider")) {
            if ((queryResult := this.QueryInterface(IShareProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IShareProvider := IShareProvider(outPtr)
        }

        return this.__IShareProvider.put_Tag(value)
    }

;@endregion Instance Methods
}
