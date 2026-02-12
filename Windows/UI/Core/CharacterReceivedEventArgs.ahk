#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICharacterReceivedEventArgs.ahk
#Include .\ICoreWindowEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the arguments returned by the event raised when a character is received by the input queue.
 * @remarks
 * > **Windows 10**
 * > Apps do not receive this event when an [Input Method Editor (IME)](/previous-versions/windows/apps/hh967427(v=win.10)) is enabled. The Input Method Editor (IME) handles all keyboard input and sets [Handled](acceleratorkeyeventargs_handled.md) to **true**.
 * 
 * > **Windows Phone**
 * > This API is supported in native apps only.
 * 
 * This object is returned by a delegate registered for the following event:
 * + [CoreWindow.CharacterReceived](corewindow_characterreceived.md)
 * 
 * ```cppwinrt
 * void SetWindow(CoreWindow const& window)
 * {
 *     ...
 *     window.CharacterReceived({this, &App::OnCharacterReceived });
 * }
 * 
 * // Character received event data in CharacterReceivedEventArgs.
 * void OnCharacterReceived(
 *     Windows::UI::Core::CoreWindow const& // sender ,
 *     Windows::UI::Core::CharacterReceivedEventArgs const& // args )
 * {
 * }
 * ```
 * 
 * ```cppcx
 * // returning character received events data through CharacterReceivedEventArgs
 * 
 * void MyCoreWindowEvents::SetWindow( // implementation called by CoreApplication::Run(), provided for context
 *     _In_ CoreWindow^ window
 *     )
 * {
 *     // ...
 *     window->CharacterReceived +=
 *         ref new TypedEventHandler<CoreWindow^, CharacterReceivedEventArgs^>(this, &CoreWindowEvents::OnCharacterReceived);
 *     // ...
 * }
 * ```
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.characterreceivedeventargs
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CharacterReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICharacterReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICharacterReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the key code of the character received by the input queue.
     * @remarks
     * > **Windows 10**
     * > Apps do not receive this event when an [Input Method Editor (IME)](/windows/apps/design/input/input-method-editors) is enabled. The Input Method Editor (IME) handles all keyboard input and sets [Handled](characterreceivedeventargs_handled.md) to **true**.
     * 
     * > **Windows Phone**
     * > This API is supported in native apps only.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.characterreceivedeventargs.keycode
     * @type {Integer} 
     */
    KeyCode {
        get => this.get_KeyCode()
    }

    /**
     * Gets the status of the physical key press that raised the character-received event.
     * @remarks
     * > **Windows 10**
     * > Apps do not receive this event when an [Input Method Editor (IME)](/previous-versions/windows/apps/hh967427(v=win.10)) is enabled. The Input Method Editor (IME) handles all keyboard input and sets [Handled](characterreceivedeventargs_handled.md) to **true**.
     * 
     * > **Windows Phone**
     * > This API is supported in native apps only.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.characterreceivedeventargs.keystatus
     * @type {CorePhysicalKeyStatus} 
     */
    KeyStatus {
        get => this.get_KeyStatus()
    }

    /**
     * Gets or sets whether the character-received event was handled or not.
     * @remarks
     * > **Windows 10**
     * > Apps do not receive this event when an [Input Method Editor (IME)](/previous-versions/windows/apps/hh967427(v=win.10)) is enabled. The Input Method Editor (IME) handles all keyboard input and sets Handled to **true**.
     * 
     * > **Windows Phone**
     * > This API is supported in native apps only.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.characterreceivedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
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
    get_KeyCode() {
        if (!this.HasProp("__ICharacterReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICharacterReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICharacterReceivedEventArgs := ICharacterReceivedEventArgs(outPtr)
        }

        return this.__ICharacterReceivedEventArgs.get_KeyCode()
    }

    /**
     * 
     * @returns {CorePhysicalKeyStatus} 
     */
    get_KeyStatus() {
        if (!this.HasProp("__ICharacterReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICharacterReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICharacterReceivedEventArgs := ICharacterReceivedEventArgs(outPtr)
        }

        return this.__ICharacterReceivedEventArgs.get_KeyStatus()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__ICoreWindowEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreWindowEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowEventArgs := ICoreWindowEventArgs(outPtr)
        }

        return this.__ICoreWindowEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__ICoreWindowEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreWindowEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowEventArgs := ICoreWindowEventArgs(outPtr)
        }

        return this.__ICoreWindowEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
