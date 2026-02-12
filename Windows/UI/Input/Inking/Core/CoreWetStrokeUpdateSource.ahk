#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreWetStrokeUpdateSource.ahk
#Include .\ICoreWetStrokeUpdateSourceStatics.ahk
#Include ..\..\..\..\Foundation\TypedEventHandler.ahk
#Include .\CoreWetStrokeUpdateSource.ahk
#Include .\CoreWetStrokeUpdateEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents the [InkPresenter](../windows.ui.input.inking/inkpresenter.md) that manages the input, processing, and rendering of ink stroke data.
 * @remarks
 * Standard [Windows.UI.Input.Inking](../windows.ui.input.inking/windows_ui_input_inking.md) events occur after ink strokes have been rendered.
 * 
 * Use the [Windows.UI.Input.Inking.Core](windows_ui_input_inking_core.md) events to process "wet" ink data before it is rendered by the [InkPresenter](coreinkindependentinputsource_inkpresenter.md). This can be useful when providing a digital stencil, such as a ruler or protractor, to constrain and modify a stroke while it is "wet", or mask select areas of the canvas from ink strokes.
 * 
 * An ink stroke always triggers either a [WetStrokeCompleted](corewetstrokeupdatesource_wetstrokecompleted.md) or a [WetStrokeCanceled](corewetstrokeupdatesource_wetstrokecanceled.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.core.corewetstrokeupdatesource
 * @namespace Windows.UI.Input.Inking.Core
 * @version WindowsRuntime 1.4
 */
class CoreWetStrokeUpdateSource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreWetStrokeUpdateSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreWetStrokeUpdateSource.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves a [CoreWetStrokeUpdateSource](corewetstrokeupdatesource.md) object for handling "wet" ink strokes prior to processing by an [InkPresenter](../windows.ui.input.inking/inkpresenter.md) object.
     * @param {InkPresenter} inkPresenter_ Object that manages the input, processing, and rendering of [InkStroke](../windows.ui.input.inking/inkstroke.md) data.
     * @returns {CoreWetStrokeUpdateSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.core.corewetstrokeupdatesource.create
     */
    static Create(inkPresenter_) {
        if (!CoreWetStrokeUpdateSource.HasProp("__ICoreWetStrokeUpdateSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Inking.Core.CoreWetStrokeUpdateSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreWetStrokeUpdateSourceStatics.IID)
            CoreWetStrokeUpdateSource.__ICoreWetStrokeUpdateSourceStatics := ICoreWetStrokeUpdateSourceStatics(factoryPtr)
        }

        return CoreWetStrokeUpdateSource.__ICoreWetStrokeUpdateSourceStatics.Create(inkPresenter_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the [InkPresenter](../windows.ui.input.inking/inkpresenter.md) object that manages the input, processing, and rendering of ink stroke data.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.core.corewetstrokeupdatesource.inkpresenter
     * @type {InkPresenter} 
     */
    InkPresenter {
        get => this.get_InkPresenter()
    }

    /**
     * Occurs when the [InkPresenter](../windows.ui.input.inking/inkpresenter.md) starts processing an ink stroke.
     * @type {TypedEventHandler<CoreWetStrokeUpdateSource, CoreWetStrokeUpdateEventArgs>}
    */
    OnWetStrokeStarting {
        get {
            if(!this.HasProp("__OnWetStrokeStarting")){
                this.__OnWetStrokeStarting := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{67ff75e8-02a4-5254-a965-0b254c7d0788}"),
                    CoreWetStrokeUpdateSource,
                    CoreWetStrokeUpdateEventArgs
                )
                this.__OnWetStrokeStartingToken := this.add_WetStrokeStarting(this.__OnWetStrokeStarting.iface)
            }
            return this.__OnWetStrokeStarting
        }
    }

    /**
     * Occurs after the [InkPresenter](../windows.ui.input.inking/inkpresenter.md) starts processing an ink stroke and before it stops processing the same stroke, indicating ink data continues to be captured.
     * @type {TypedEventHandler<CoreWetStrokeUpdateSource, CoreWetStrokeUpdateEventArgs>}
    */
    OnWetStrokeContinuing {
        get {
            if(!this.HasProp("__OnWetStrokeContinuing")){
                this.__OnWetStrokeContinuing := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{67ff75e8-02a4-5254-a965-0b254c7d0788}"),
                    CoreWetStrokeUpdateSource,
                    CoreWetStrokeUpdateEventArgs
                )
                this.__OnWetStrokeContinuingToken := this.add_WetStrokeContinuing(this.__OnWetStrokeContinuing.iface)
            }
            return this.__OnWetStrokeContinuing
        }
    }

    /**
     * Occurs when the [InkPresenter](../windows.ui.input.inking/inkpresenter.md) stops processing an ink stroke, but before the stroke is finalized ([WetStrokeCompleted](corewetstrokeupdatesource_wetstrokecompleted.md)).
     * @remarks
     * [NewInkPoints](corewetstrokeupdateeventargs_newinkpoints.md) is always empty for the [WetStrokeCompleted](corewetstrokeupdatesource_wetstrokecompleted.md) and [WetStrokeCanceled](corewetstrokeupdatesource_wetstrokecanceled.md) events.
     * 
     * [NewInkPoints](corewetstrokeupdateeventargs_newinkpoints.md) might be empty for the WetStrokeStopping event.
     * @type {TypedEventHandler<CoreWetStrokeUpdateSource, CoreWetStrokeUpdateEventArgs>}
    */
    OnWetStrokeStopping {
        get {
            if(!this.HasProp("__OnWetStrokeStopping")){
                this.__OnWetStrokeStopping := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{67ff75e8-02a4-5254-a965-0b254c7d0788}"),
                    CoreWetStrokeUpdateSource,
                    CoreWetStrokeUpdateEventArgs
                )
                this.__OnWetStrokeStoppingToken := this.add_WetStrokeStopping(this.__OnWetStrokeStopping.iface)
            }
            return this.__OnWetStrokeStopping
        }
    }

    /**
     * Occurs after the [InkPresenter](../windows.ui.input.inking/inkpresenter.md) stops processing an ink stroke ([WetStrokeStopping](corewetstrokeupdatesource_wetstrokestopping.md)) or [CoreWetStrokeDisposition](corewetstrokedisposition.md) is set to [Completed](corewetstrokedisposition.md), indicating the stroke is complete.
     * 
     * Subsequent ink input is considered a new stroke.
     * @remarks
     * An ink stroke always triggers either a WetStrokeCompleted or a [WetStrokeCanceled](corewetstrokeupdatesource_wetstrokecanceled.md) event.
     * 
     * [NewInkPoints](corewetstrokeupdateeventargs_newinkpoints.md) is always empty for the WetStrokeCompleted and [WetStrokeCanceled](corewetstrokeupdatesource_wetstrokecanceled.md) events.
     * 
     * [NewInkPoints](corewetstrokeupdateeventargs_newinkpoints.md) might be empty for the [WetStrokeStopping](corewetstrokeupdatesource_wetstrokestopping.md) event.
     * @type {TypedEventHandler<CoreWetStrokeUpdateSource, CoreWetStrokeUpdateEventArgs>}
    */
    OnWetStrokeCompleted {
        get {
            if(!this.HasProp("__OnWetStrokeCompleted")){
                this.__OnWetStrokeCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{67ff75e8-02a4-5254-a965-0b254c7d0788}"),
                    CoreWetStrokeUpdateSource,
                    CoreWetStrokeUpdateEventArgs
                )
                this.__OnWetStrokeCompletedToken := this.add_WetStrokeCompleted(this.__OnWetStrokeCompleted.iface)
            }
            return this.__OnWetStrokeCompleted
        }
    }

    /**
     * Occurs when the [InkPresenter](../windows.ui.input.inking/inkpresenter.md) stops processing an ink stroke in an unexpected way, [CoreWetStrokeDisposition](corewetstrokedisposition.md) is set to [Canceled](corewetstrokedisposition.md), or the input is invalid, indicating the stroke was not completed.
     * 
     * For example, when ink input bubbles up to another system event handler, such as a context menu.
     * @remarks
     * An ink stroke always triggers either a [WetStrokeCompleted](corewetstrokeupdatesource_wetstrokecompleted.md) or a WetStrokeCanceled event.
     * 
     * [NewInkPoints](corewetstrokeupdateeventargs_newinkpoints.md) is always empty for the [WetStrokeCompleted](corewetstrokeupdatesource_wetstrokecompleted.md) and WetStrokeCanceled events.
     * 
     * [NewInkPoints](corewetstrokeupdateeventargs_newinkpoints.md) might be empty for the [WetStrokeStopping](corewetstrokeupdatesource_wetstrokestopping.md) event.
     * @type {TypedEventHandler<CoreWetStrokeUpdateSource, CoreWetStrokeUpdateEventArgs>}
    */
    OnWetStrokeCanceled {
        get {
            if(!this.HasProp("__OnWetStrokeCanceled")){
                this.__OnWetStrokeCanceled := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{67ff75e8-02a4-5254-a965-0b254c7d0788}"),
                    CoreWetStrokeUpdateSource,
                    CoreWetStrokeUpdateEventArgs
                )
                this.__OnWetStrokeCanceledToken := this.add_WetStrokeCanceled(this.__OnWetStrokeCanceled.iface)
            }
            return this.__OnWetStrokeCanceled
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnWetStrokeStartingToken")) {
            this.remove_WetStrokeStarting(this.__OnWetStrokeStartingToken)
            this.__OnWetStrokeStarting.iface.Dispose()
        }

        if(this.HasProp("__OnWetStrokeContinuingToken")) {
            this.remove_WetStrokeContinuing(this.__OnWetStrokeContinuingToken)
            this.__OnWetStrokeContinuing.iface.Dispose()
        }

        if(this.HasProp("__OnWetStrokeStoppingToken")) {
            this.remove_WetStrokeStopping(this.__OnWetStrokeStoppingToken)
            this.__OnWetStrokeStopping.iface.Dispose()
        }

        if(this.HasProp("__OnWetStrokeCompletedToken")) {
            this.remove_WetStrokeCompleted(this.__OnWetStrokeCompletedToken)
            this.__OnWetStrokeCompleted.iface.Dispose()
        }

        if(this.HasProp("__OnWetStrokeCanceledToken")) {
            this.remove_WetStrokeCanceled(this.__OnWetStrokeCanceledToken)
            this.__OnWetStrokeCanceled.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWetStrokeUpdateSource, CoreWetStrokeUpdateEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_WetStrokeStarting(handler) {
        if (!this.HasProp("__ICoreWetStrokeUpdateSource")) {
            if ((queryResult := this.QueryInterface(ICoreWetStrokeUpdateSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWetStrokeUpdateSource := ICoreWetStrokeUpdateSource(outPtr)
        }

        return this.__ICoreWetStrokeUpdateSource.add_WetStrokeStarting(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_WetStrokeStarting(cookie) {
        if (!this.HasProp("__ICoreWetStrokeUpdateSource")) {
            if ((queryResult := this.QueryInterface(ICoreWetStrokeUpdateSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWetStrokeUpdateSource := ICoreWetStrokeUpdateSource(outPtr)
        }

        return this.__ICoreWetStrokeUpdateSource.remove_WetStrokeStarting(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWetStrokeUpdateSource, CoreWetStrokeUpdateEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_WetStrokeContinuing(handler) {
        if (!this.HasProp("__ICoreWetStrokeUpdateSource")) {
            if ((queryResult := this.QueryInterface(ICoreWetStrokeUpdateSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWetStrokeUpdateSource := ICoreWetStrokeUpdateSource(outPtr)
        }

        return this.__ICoreWetStrokeUpdateSource.add_WetStrokeContinuing(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_WetStrokeContinuing(cookie) {
        if (!this.HasProp("__ICoreWetStrokeUpdateSource")) {
            if ((queryResult := this.QueryInterface(ICoreWetStrokeUpdateSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWetStrokeUpdateSource := ICoreWetStrokeUpdateSource(outPtr)
        }

        return this.__ICoreWetStrokeUpdateSource.remove_WetStrokeContinuing(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWetStrokeUpdateSource, CoreWetStrokeUpdateEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_WetStrokeStopping(handler) {
        if (!this.HasProp("__ICoreWetStrokeUpdateSource")) {
            if ((queryResult := this.QueryInterface(ICoreWetStrokeUpdateSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWetStrokeUpdateSource := ICoreWetStrokeUpdateSource(outPtr)
        }

        return this.__ICoreWetStrokeUpdateSource.add_WetStrokeStopping(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_WetStrokeStopping(cookie) {
        if (!this.HasProp("__ICoreWetStrokeUpdateSource")) {
            if ((queryResult := this.QueryInterface(ICoreWetStrokeUpdateSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWetStrokeUpdateSource := ICoreWetStrokeUpdateSource(outPtr)
        }

        return this.__ICoreWetStrokeUpdateSource.remove_WetStrokeStopping(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWetStrokeUpdateSource, CoreWetStrokeUpdateEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_WetStrokeCompleted(handler) {
        if (!this.HasProp("__ICoreWetStrokeUpdateSource")) {
            if ((queryResult := this.QueryInterface(ICoreWetStrokeUpdateSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWetStrokeUpdateSource := ICoreWetStrokeUpdateSource(outPtr)
        }

        return this.__ICoreWetStrokeUpdateSource.add_WetStrokeCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_WetStrokeCompleted(cookie) {
        if (!this.HasProp("__ICoreWetStrokeUpdateSource")) {
            if ((queryResult := this.QueryInterface(ICoreWetStrokeUpdateSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWetStrokeUpdateSource := ICoreWetStrokeUpdateSource(outPtr)
        }

        return this.__ICoreWetStrokeUpdateSource.remove_WetStrokeCompleted(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWetStrokeUpdateSource, CoreWetStrokeUpdateEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_WetStrokeCanceled(handler) {
        if (!this.HasProp("__ICoreWetStrokeUpdateSource")) {
            if ((queryResult := this.QueryInterface(ICoreWetStrokeUpdateSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWetStrokeUpdateSource := ICoreWetStrokeUpdateSource(outPtr)
        }

        return this.__ICoreWetStrokeUpdateSource.add_WetStrokeCanceled(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_WetStrokeCanceled(cookie) {
        if (!this.HasProp("__ICoreWetStrokeUpdateSource")) {
            if ((queryResult := this.QueryInterface(ICoreWetStrokeUpdateSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWetStrokeUpdateSource := ICoreWetStrokeUpdateSource(outPtr)
        }

        return this.__ICoreWetStrokeUpdateSource.remove_WetStrokeCanceled(cookie)
    }

    /**
     * 
     * @returns {InkPresenter} 
     */
    get_InkPresenter() {
        if (!this.HasProp("__ICoreWetStrokeUpdateSource")) {
            if ((queryResult := this.QueryInterface(ICoreWetStrokeUpdateSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWetStrokeUpdateSource := ICoreWetStrokeUpdateSource(outPtr)
        }

        return this.__ICoreWetStrokeUpdateSource.get_InkPresenter()
    }

;@endregion Instance Methods
}
