#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\ICompositionBatchCompletedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Arguments for the [CompositionCommitBatch.Completed](compositioncommitbatch_completed.md) or [CompositionScopedBatch.Completed](compositionscopedbatch_completed.md) events.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionbatchcompletedeventargs
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionBatchCompletedEventArgs extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionBatchCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionBatchCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
