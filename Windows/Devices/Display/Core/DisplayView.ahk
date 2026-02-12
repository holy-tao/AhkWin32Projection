#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayView.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a group of [DisplayPath](displaypath.md) objects that are logically cloned together.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayview
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayView extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayView.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the set of paths making up this [DisplayView](displayview.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayview.paths
     * @type {IVectorView<DisplayPath>} 
     */
    Paths {
        get => this.get_Paths()
    }

    /**
     * The logical content resolution of this group of cloned [DisplayPath](displaypath.md) objects. For a [DisplayView](displayview.md) in hardware clone, this will be the same value as each path's [SourceResolution](displaypath_sourceresolution.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayview.contentresolution
     * @type {IReference<SizeInt32>} 
     */
    ContentResolution {
        get => this.get_ContentResolution()
        set => this.put_ContentResolution(value)
    }

    /**
     * Reserved for future use.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayview.properties
     * @type {IMap<Guid, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<DisplayPath>} 
     */
    get_Paths() {
        if (!this.HasProp("__IDisplayView")) {
            if ((queryResult := this.QueryInterface(IDisplayView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayView := IDisplayView(outPtr)
        }

        return this.__IDisplayView.get_Paths()
    }

    /**
     * 
     * @returns {IReference<SizeInt32>} 
     */
    get_ContentResolution() {
        if (!this.HasProp("__IDisplayView")) {
            if ((queryResult := this.QueryInterface(IDisplayView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayView := IDisplayView(outPtr)
        }

        return this.__IDisplayView.get_ContentResolution()
    }

    /**
     * 
     * @param {IReference<SizeInt32>} value 
     * @returns {HRESULT} 
     */
    put_ContentResolution(value) {
        if (!this.HasProp("__IDisplayView")) {
            if ((queryResult := this.QueryInterface(IDisplayView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayView := IDisplayView(outPtr)
        }

        return this.__IDisplayView.put_ContentResolution(value)
    }

    /**
     * Sets a path in this view to be the "primary clone path" in the view, which causes clone-unaware apps to see the refresh rate and target properties of this path by default.
     * @param {DisplayPath} path_ A path that is already present in this [DisplayView](displayview.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayview.setprimarypath
     */
    SetPrimaryPath(path_) {
        if (!this.HasProp("__IDisplayView")) {
            if ((queryResult := this.QueryInterface(IDisplayView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayView := IDisplayView(outPtr)
        }

        return this.__IDisplayView.SetPrimaryPath(path_)
    }

    /**
     * 
     * @returns {IMap<Guid, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IDisplayView")) {
            if ((queryResult := this.QueryInterface(IDisplayView.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayView := IDisplayView(outPtr)
        }

        return this.__IDisplayView.get_Properties()
    }

;@endregion Instance Methods
}
