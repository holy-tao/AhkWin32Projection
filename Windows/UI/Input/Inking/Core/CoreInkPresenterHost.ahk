#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreInkPresenterHost.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents an object that hosts an InkPresenter without the need for an InkCanvas control.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.core.coreinkpresenterhost
 * @namespace Windows.UI.Input.Inking.Core
 * @version WindowsRuntime 1.4
 */
class CoreInkPresenterHost extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreInkPresenterHost

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreInkPresenterHost.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a reference to the [InkPresenter](../windows.ui.input.inking/inkpresenter.md) associatiated with this [CoreInkPresenterHost](coreinkpresenterhost.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.core.coreinkpresenterhost.inkpresenter
     * @type {InkPresenter} 
     */
    InkPresenter {
        get => this.get_InkPresenter()
    }

    /**
     * Gets or sets the root visual container that the CoreInkPresenterHost draws to.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.core.coreinkpresenterhost.rootvisual
     * @type {ContainerVisual} 
     */
    RootVisual {
        get => this.get_RootVisual()
        set => this.put_RootVisual(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new [CoreInkPresenterHost](coreinkpresenterhost.md) object that is used to manage an [InkPresenter](../windows.ui.input.inking/inkpresenter.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Inking.Core.CoreInkPresenterHost")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {InkPresenter} 
     */
    get_InkPresenter() {
        if (!this.HasProp("__ICoreInkPresenterHost")) {
            if ((queryResult := this.QueryInterface(ICoreInkPresenterHost.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInkPresenterHost := ICoreInkPresenterHost(outPtr)
        }

        return this.__ICoreInkPresenterHost.get_InkPresenter()
    }

    /**
     * 
     * @returns {ContainerVisual} 
     */
    get_RootVisual() {
        if (!this.HasProp("__ICoreInkPresenterHost")) {
            if ((queryResult := this.QueryInterface(ICoreInkPresenterHost.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInkPresenterHost := ICoreInkPresenterHost(outPtr)
        }

        return this.__ICoreInkPresenterHost.get_RootVisual()
    }

    /**
     * 
     * @param {ContainerVisual} value 
     * @returns {HRESULT} 
     */
    put_RootVisual(value) {
        if (!this.HasProp("__ICoreInkPresenterHost")) {
            if ((queryResult := this.QueryInterface(ICoreInkPresenterHost.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInkPresenterHost := ICoreInkPresenterHost(outPtr)
        }

        return this.__ICoreInkPresenterHost.put_RootVisual(value)
    }

;@endregion Instance Methods
}
