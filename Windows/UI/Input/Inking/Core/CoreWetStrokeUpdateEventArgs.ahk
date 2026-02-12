#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreWetStrokeUpdateEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Contains ink stroke event data for an [InkPresenter](../windows.ui.input.inking/inkpresenter.md) object.
 * @remarks
 * An ink stroke always triggers either a [WetStrokeCompleted](corewetstrokeupdatesource_wetstrokecompleted.md) or a [WetStrokeCanceled](corewetstrokeupdatesource_wetstrokecanceled.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.core.corewetstrokeupdateeventargs
 * @namespace Windows.UI.Input.Inking.Core
 * @version WindowsRuntime 1.4
 */
class CoreWetStrokeUpdateEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreWetStrokeUpdateEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreWetStrokeUpdateEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the collection of [InkPoint](../windows.ui.input.inking/inkpoint.md) objects processed since the last event.
     * @remarks
     * NewInkPoints is always empty for the [WetStrokeCompleted](corewetstrokeupdatesource_wetstrokecompleted.md) and [WetStrokeCanceled](corewetstrokeupdatesource_wetstrokecanceled.md) events.
     * 
     * NewInkPoints might be empty for the [WetStrokeStopping](corewetstrokeupdatesource_wetstrokestopping.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.core.corewetstrokeupdateeventargs.newinkpoints
     * @type {IVector<InkPoint>} 
     */
    NewInkPoints {
        get => this.get_NewInkPoints()
    }

    /**
     * Gets a unique identifier for the input pointer.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.core.corewetstrokeupdateeventargs.pointerid
     * @type {Integer} 
     */
    PointerId {
        get => this.get_PointerId()
    }

    /**
     * Gets or sets the pre-rendered state of the "wet" ink stroke.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.core.corewetstrokeupdateeventargs.disposition
     * @type {Integer} 
     */
    Disposition {
        get => this.get_Disposition()
        set => this.put_Disposition(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVector<InkPoint>} 
     */
    get_NewInkPoints() {
        if (!this.HasProp("__ICoreWetStrokeUpdateEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreWetStrokeUpdateEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWetStrokeUpdateEventArgs := ICoreWetStrokeUpdateEventArgs(outPtr)
        }

        return this.__ICoreWetStrokeUpdateEventArgs.get_NewInkPoints()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PointerId() {
        if (!this.HasProp("__ICoreWetStrokeUpdateEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreWetStrokeUpdateEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWetStrokeUpdateEventArgs := ICoreWetStrokeUpdateEventArgs(outPtr)
        }

        return this.__ICoreWetStrokeUpdateEventArgs.get_PointerId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Disposition() {
        if (!this.HasProp("__ICoreWetStrokeUpdateEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreWetStrokeUpdateEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWetStrokeUpdateEventArgs := ICoreWetStrokeUpdateEventArgs(outPtr)
        }

        return this.__ICoreWetStrokeUpdateEventArgs.get_Disposition()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Disposition(value) {
        if (!this.HasProp("__ICoreWetStrokeUpdateEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreWetStrokeUpdateEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWetStrokeUpdateEventArgs := ICoreWetStrokeUpdateEventArgs(outPtr)
        }

        return this.__ICoreWetStrokeUpdateEventArgs.put_Disposition(value)
    }

;@endregion Instance Methods
}
