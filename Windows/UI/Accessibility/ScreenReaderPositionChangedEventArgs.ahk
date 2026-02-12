#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IScreenReaderPositionChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [ScreenReaderPositionChanged](screenreaderservice_screenreaderpositionchanged.md) event of a [ScreenReaderService](screenreaderservice.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.accessibility.screenreaderpositionchangedeventargs
 * @namespace Windows.UI.Accessibility
 * @version WindowsRuntime 1.4
 */
class ScreenReaderPositionChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IScreenReaderPositionChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IScreenReaderPositionChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a rectangle corresponding to the new location of the screen reader focus indicator (such as the Narrator focus highlight box).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.accessibility.screenreaderpositionchangedeventargs.screenpositioninrawpixels
     * @type {RECT} 
     */
    ScreenPositionInRawPixels {
        get => this.get_ScreenPositionInRawPixels()
    }

    /**
     * Gets whether a screen reader is currently reading a block of text.
     * @remarks
     * This property is useful in situations where you need to handle the frequent and predictable movement of the screen reader focus. For example, Magnifier smooths the movement of the magnified region by setting its location in anticipation of the movement of the Narrator focus.
     * 
     * Reading with Narrator is initiated through specific key combinations, such as **Caps lock + M**. While reading text, the need for the user to press other keys and key combinations to navigate through different objects in a document, webpage, or app is eliminated. For a comprehensive list of key combinations that initiate text reading with Narrator, see [Reading text](https://support.microsoft.com/help/22799/windows-10-narrator-reading-text).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.accessibility.screenreaderpositionchangedeventargs.isreadingtext
     * @type {Boolean} 
     */
    IsReadingText {
        get => this.get_IsReadingText()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ScreenPositionInRawPixels() {
        if (!this.HasProp("__IScreenReaderPositionChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IScreenReaderPositionChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScreenReaderPositionChangedEventArgs := IScreenReaderPositionChangedEventArgs(outPtr)
        }

        return this.__IScreenReaderPositionChangedEventArgs.get_ScreenPositionInRawPixels()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadingText() {
        if (!this.HasProp("__IScreenReaderPositionChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IScreenReaderPositionChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScreenReaderPositionChangedEventArgs := IScreenReaderPositionChangedEventArgs(outPtr)
        }

        return this.__IScreenReaderPositionChangedEventArgs.get_IsReadingText()
    }

;@endregion Instance Methods
}
