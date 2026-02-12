#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISemanticZoomLocation.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Communicates information for items and view state in a [SemanticZoom](semanticzoom.md), such that hosts for scrolling and virtualization (such as [ListViewBase](listviewbase.md)) can get correct item and bounds information.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.semanticzoomlocation
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SemanticZoomLocation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISemanticZoomLocation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISemanticZoomLocation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the display item as it exists in the current view of a [SemanticZoom](semanticzoom.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.semanticzoomlocation.item
     * @type {IInspectable} 
     */
    Item {
        get => this.get_Item()
        set => this.put_Item(value)
    }

    /**
     * Gets or sets the sizing bounds of the item as it exists in the current view of a [SemanticZoom](semanticzoom.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.semanticzoomlocation.bounds
     * @type {RECT} 
     */
    Bounds {
        get => this.get_Bounds()
        set => this.put_Bounds(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SemanticZoomLocation](semanticzoomlocation.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SemanticZoomLocation")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Item() {
        if (!this.HasProp("__ISemanticZoomLocation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomLocation := ISemanticZoomLocation(outPtr)
        }

        return this.__ISemanticZoomLocation.get_Item()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Item(value) {
        if (!this.HasProp("__ISemanticZoomLocation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomLocation := ISemanticZoomLocation(outPtr)
        }

        return this.__ISemanticZoomLocation.put_Item(value)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Bounds() {
        if (!this.HasProp("__ISemanticZoomLocation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomLocation := ISemanticZoomLocation(outPtr)
        }

        return this.__ISemanticZoomLocation.get_Bounds()
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_Bounds(value) {
        if (!this.HasProp("__ISemanticZoomLocation")) {
            if ((queryResult := this.QueryInterface(ISemanticZoomLocation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISemanticZoomLocation := ISemanticZoomLocation(outPtr)
        }

        return this.__ISemanticZoomLocation.put_Bounds(value)
    }

;@endregion Instance Methods
}
