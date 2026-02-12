#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreTextCompositionCompletedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [CompositionCompleted](coretexteditcontext_compositioncompleted.md) event.
 * @remarks
 * An object of this type is passed as an argument to a handler for the [CompositionCompleted](coretexteditcontext_compositioncompleted.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextcompositioncompletedeventargs
 * @namespace Windows.UI.Text.Core
 * @version WindowsRuntime 1.4
 */
class CoreTextCompositionCompletedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreTextCompositionCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreTextCompositionCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether the operation is canceled.
     * @remarks
     * If the app defers the operation, it is possible for it to be canceled before the app responds to it. For this reason, you should read this property, only once, immediately before responding to a deferred operation. 
     * 
     * > [!NOTE]
     * > The "getter" for the **IsCanceled** property notifies Windows that the app is beginning the deferred operation. You should consider reading this property as a required step before you perform the deferred operation. Use the pattern shown in the example when reading **IsCanceled**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextcompositioncompletedeventargs.iscanceled
     * @type {Boolean} 
     */
    IsCanceled {
        get => this.get_IsCanceled()
    }

    /**
     * Gets a collection of [CoreTextCompositionSegment](coretextcompositionsegment.md) objects representing the segments in the composition string. Applications can use this property, for example, to get the pre-conversion string for each composition segment.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextcompositioncompletedeventargs.compositionsegments
     * @type {IVectorView<CoreTextCompositionSegment>} 
     */
    CompositionSegments {
        get => this.get_CompositionSegments()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCanceled() {
        if (!this.HasProp("__ICoreTextCompositionCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextCompositionCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextCompositionCompletedEventArgs := ICoreTextCompositionCompletedEventArgs(outPtr)
        }

        return this.__ICoreTextCompositionCompletedEventArgs.get_IsCanceled()
    }

    /**
     * 
     * @returns {IVectorView<CoreTextCompositionSegment>} 
     */
    get_CompositionSegments() {
        if (!this.HasProp("__ICoreTextCompositionCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextCompositionCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextCompositionCompletedEventArgs := ICoreTextCompositionCompletedEventArgs(outPtr)
        }

        return this.__ICoreTextCompositionCompletedEventArgs.get_CompositionSegments()
    }

    /**
     * Requests that the operation be delayed. Call this method if your text input control is hosted on a worker thread rather than on the UI thread.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.text.core.coretextcompositioncompletedeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__ICoreTextCompositionCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreTextCompositionCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreTextCompositionCompletedEventArgs := ICoreTextCompositionCompletedEventArgs(outPtr)
        }

        return this.__ICoreTextCompositionCompletedEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
