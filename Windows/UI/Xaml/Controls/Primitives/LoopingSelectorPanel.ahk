#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Canvas.ahk
#Include .\ILoopingSelectorPanel.ahk
#Include .\IScrollSnapPointsInfo.ahk
#Include ..\..\..\..\Foundation\EventHandler.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * A panel for positioning and arranging child [LoopingSelector](loopingselector.md) elements.
 * @remarks
 * <!--No XAML syntax for this class. Can't be used as a XAML element because there is no public constructor. Not actually sure what scenarios require that the class is public.-->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.loopingselectorpanel
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class LoopingSelectorPanel extends Canvas {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILoopingSelectorPanel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILoopingSelectorPanel.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that determines whether the horizontal snap points for the [LoopingSelectorPanel](loopingselectorpanel.md) are equidistant from each other.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.loopingselectorpanel.arehorizontalsnappointsregular
     * @type {Boolean} 
     */
    AreHorizontalSnapPointsRegular {
        get => this.get_AreHorizontalSnapPointsRegular()
    }

    /**
     * Gets a value that determines whether the vertical snap points for the [LoopingSelectorPanel](loopingselectorpanel.md) are equidistant from each other.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.loopingselectorpanel.areverticalsnappointsregular
     * @type {Boolean} 
     */
    AreVerticalSnapPointsRegular {
        get => this.get_AreVerticalSnapPointsRegular()
    }

    /**
     * Occurs when the horizontal snap points change.
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
     * Occurs when the vertical snap points change.
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
    __New(ptr) {
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
     * Returns a read-only collection of numbers that represent the irregular snap points for the specified orientation.
     * @param {Integer} orientation_ The orientation of the requested snap points.
     * @param {Integer} alignment The alignment used by the caller when applying the requested snap points.
     * @returns {IVectorView<Float>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.loopingselectorpanel.getirregularsnappoints
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
     * Returns a read-only collection of numbers that represent the regular snap points for the specified orientation.
     * @param {Integer} orientation_ The orientation of the requested snap points.
     * @param {Integer} alignment The alignment used by the caller when applying the requested snap points.
     * @param {Pointer<Single>} offset The offset of the first snap point.
     * @returns {Float} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.loopingselectorpanel.getregularsnappoints
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
