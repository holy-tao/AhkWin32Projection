#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHandwritingViewCandidatesChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [HandwritingView.CandidatesChanged](handwritingview_candidateschanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.handwritingviewcandidateschangedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class HandwritingViewCandidatesChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHandwritingViewCandidatesChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHandwritingViewCandidatesChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current auto-completion candidate session ID.
     * @remarks
     * Use the session ID to retrieve all auto-completion candidates in the session from the [HandwritingView](handwritingview.md), and notify the [HandwritingView](handwritingview.md) which candidate in the session was selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.handwritingviewcandidateschangedeventargs.candidatessessionid
     * @type {Integer} 
     */
    CandidatesSessionId {
        get => this.get_CandidatesSessionId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CandidatesSessionId() {
        if (!this.HasProp("__IHandwritingViewCandidatesChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHandwritingViewCandidatesChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandwritingViewCandidatesChangedEventArgs := IHandwritingViewCandidatesChangedEventArgs(outPtr)
        }

        return this.__IHandwritingViewCandidatesChangedEventArgs.get_CandidatesSessionId()
    }

;@endregion Instance Methods
}
