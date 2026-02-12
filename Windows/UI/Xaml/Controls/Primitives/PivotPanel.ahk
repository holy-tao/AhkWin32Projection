#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Panel.ahk
#Include .\IPivotPanel.ahk
#Include .\IScrollSnapPointsInfo.ahk
#Include ..\..\..\..\Foundation\EventHandler.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Displays the items in a [Pivot](../windows.ui.xaml.controls/pivot.md) control.
 * @remarks
 * The XAML usage shown is for adjusting the XAML template for a [Pivot](../windows.ui.xaml.controls/pivot.md) control (or derived type). A PivotPanel element is the main content area (wrapped by a [ScrollViewer](../windows.ui.xaml.controls/scrollviewer.md)) in the default template XAML for [Pivot](../windows.ui.xaml.controls/pivot.md). PivotPanel isn't typically used for general XAML UI composition.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.pivotpanel
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class PivotPanel extends Panel {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPivotPanel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPivotPanel.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * This property is reserved for internal use and is not intended to be used in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.pivotpanel.arehorizontalsnappointsregular
     * @type {Boolean} 
     */
    AreHorizontalSnapPointsRegular {
        get => this.get_AreHorizontalSnapPointsRegular()
    }

    /**
     * This property is reserved for internal use and is not intended to be used in your code.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.pivotpanel.areverticalsnappointsregular
     * @type {Boolean} 
     */
    AreVerticalSnapPointsRegular {
        get => this.get_AreVerticalSnapPointsRegular()
    }

    /**
     * This property is reserved for internal use and is not intended to be used in your code.
     * @type {EventHandler<IInspectable>}
    */
    OnHorizontalSnapPointsChanged {
        get {
            if(!this.HasProp("__OnHorizontalSnapPointsChanged")){
                this.__OnHorizontalSnapPointsChanged := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnHorizontalSnapPointsChangedToken := this.add_HorizontalSnapPointsChanged(this.__OnHorizontalSnapPointsChanged.iface)
            }
            return this.__OnHorizontalSnapPointsChanged
        }
    }

    /**
     * This property is reserved for internal use and is not intended to be used in your code.
     * @type {EventHandler<IInspectable>}
    */
    OnVerticalSnapPointsChanged {
        get {
            if(!this.HasProp("__OnVerticalSnapPointsChanged")){
                this.__OnVerticalSnapPointsChanged := WinRTEventHandler(
                    EventHandler,
                    Guid("{074764f2-f0c0-5200-af2f-70e07638e4a7}"),
                    IInspectable,
                    IInspectable
                )
                this.__OnVerticalSnapPointsChangedToken := this.add_VerticalSnapPointsChanged(this.__OnVerticalSnapPointsChanged.iface)
            }
            return this.__OnVerticalSnapPointsChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [PivotPanel](pivotpanel.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.PivotPanel")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnHorizontalSnapPointsChangedToken")) {
            this.remove_HorizontalSnapPointsChanged(this.__OnHorizontalSnapPointsChangedToken)
            this.__OnHorizontalSnapPointsChanged.iface.Dispose()
        }

        if(this.HasProp("__OnVerticalSnapPointsChangedToken")) {
            this.remove_VerticalSnapPointsChanged(this.__OnVerticalSnapPointsChangedToken)
            this.__OnVerticalSnapPointsChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreHorizontalSnapPointsRegular() {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.get_AreHorizontalSnapPointsRegular()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AreVerticalSnapPointsRegular() {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.get_AreVerticalSnapPointsRegular()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_HorizontalSnapPointsChanged(handler) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.add_HorizontalSnapPointsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_HorizontalSnapPointsChanged(token) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.remove_HorizontalSnapPointsChanged(token)
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VerticalSnapPointsChanged(handler) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.add_VerticalSnapPointsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VerticalSnapPointsChanged(token) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.remove_VerticalSnapPointsChanged(token)
    }

    /**
     * This property is reserved for internal use and is not intended to be used in your code.
     * @param {Integer} orientation_ Reserved.
     * @param {Integer} alignment Reserved.
     * @returns {IVectorView<Float>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.pivotpanel.getirregularsnappoints
     */
    GetIrregularSnapPoints(orientation_, alignment) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.GetIrregularSnapPoints(orientation_, alignment)
    }

    /**
     * This property is reserved for internal use and is not intended to be used in your code.
     * @param {Integer} orientation_ Reserved.
     * @param {Integer} alignment Reserved.
     * @param {Pointer<Single>} offset Reserved.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.pivotpanel.getregularsnappoints
     */
    GetRegularSnapPoints(orientation_, alignment, offset) {
        if (!this.HasProp("__IScrollSnapPointsInfo")) {
            if ((queryResult := this.QueryInterface(IScrollSnapPointsInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScrollSnapPointsInfo := IScrollSnapPointsInfo(outPtr)
        }

        return this.__IScrollSnapPointsInfo.GetRegularSnapPoints(orientation_, alignment, offset)
    }

;@endregion Instance Methods
}
