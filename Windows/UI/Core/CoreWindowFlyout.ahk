#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreWindowFlyout.ahk
#Include .\ICoreWindowFlyoutFactory.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\CoreWindow.ahk
#Include .\CoreWindowPopupShowingEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Defines a child flyout of an app window.
  * 
  * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindowflyout
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CoreWindowFlyout extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreWindowFlyout

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreWindowFlyout.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of the [CoreWindowFlyout](corewindowflyout.md) class at the supplied position.
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
     * @param {POINT} position The pixel position on the screen where the flyout is to originate. The position provides the upper-leftmost corner of the flyout.
     * @returns {CoreWindowFlyout} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindowflyout.#ctor
     */
    static Create(position) {
        if (!CoreWindowFlyout.HasProp("__ICoreWindowFlyoutFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Core.CoreWindowFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreWindowFlyoutFactory.IID)
            CoreWindowFlyout.__ICoreWindowFlyoutFactory := ICoreWindowFlyoutFactory(factoryPtr)
        }

        return CoreWindowFlyout.__ICoreWindowFlyoutFactory.Create(position)
    }

    /**
     * Creates an instance of the [CoreWindowFlyout](corewindowflyout.md) class at the specified position with the supplied title.
     * 
     * In a desktop app, before using an instance of this class in a way that displays UI, you'll need to associate the object with its owner's window handle. For more info, and code examples, see [Display WinRT UI objects that depend on CoreWindow](/windows/apps/develop/ui-input/display-ui-objects#winui-3-with-c).
     * @param {POINT} position The pixel position on the screen where the flyout is to originate. The position provides the upper-leftmost corner of the flyout.
     * @param {HSTRING} title The title of the flyout.
     * @returns {CoreWindowFlyout} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindowflyout.#ctor
     */
    static CreateWithTitle(position, title) {
        if (!CoreWindowFlyout.HasProp("__ICoreWindowFlyoutFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Core.CoreWindowFlyout")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreWindowFlyoutFactory.IID)
            CoreWindowFlyout.__ICoreWindowFlyoutFactory := ICoreWindowFlyoutFactory(factoryPtr)
        }

        return CoreWindowFlyout.__ICoreWindowFlyoutFactory.CreateWithTitle(position, title)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the maximum size of the flyout.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindowflyout.maxsize
     * @type {SIZE} 
     */
    MaxSize {
        get => this.get_MaxSize()
    }

    /**
     * Gets the minimum size of the flyout.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindowflyout.minsize
     * @type {SIZE} 
     */
    MinSize {
        get => this.get_MinSize()
    }

    /**
     * Gets or sets the title of the flyout.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindowflyout.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets or sets a value that indicates whether any UI interaction event message is slightly delayed or not. This delay prevents a user from accidentally invoking an action on the flyout window.
     * @remarks
     * Set this property to **true** when the flyout is asking the user for permission to perform some action which could affect the user’s privacy, security, or data.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindowflyout.isinteractiondelayed
     * @type {Integer} 
     */
    IsInteractionDelayed {
        get => this.get_IsInteractionDelayed()
        set => this.put_IsInteractionDelayed(value)
    }

    /**
     * Gets the set of user interface commands available on the flyout.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindowflyout.commands
     * @type {IVector<IUICommand>} 
     */
    Commands {
        get => this.get_Commands()
    }

    /**
     * Gets or sets the index of the flyout window's default command.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindowflyout.defaultcommandindex
     * @type {Integer} 
     */
    DefaultCommandIndex {
        get => this.get_DefaultCommandIndex()
        set => this.put_DefaultCommandIndex(value)
    }

    /**
     * Gets or sets the delegate called when the back button on the flyout is selected.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindowflyout.backbuttoncommand
     * @type {UICommandInvokedHandler} 
     */
    BackButtonCommand {
        get => this.get_BackButtonCommand()
        set => this.put_BackButtonCommand(value)
    }

    /**
     * Is fired when the flyout is displayed.
     * @type {TypedEventHandler<CoreWindow, CoreWindowPopupShowingEventArgs>}
    */
    OnShowing {
        get {
            if(!this.HasProp("__OnShowing")){
                this.__OnShowing := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b32d6422-78b2-5e00-84a8-6e3167aaabde}"),
                    CoreWindow,
                    CoreWindowPopupShowingEventArgs
                )
                this.__OnShowingToken := this.add_Showing(this.__OnShowing.iface)
            }
            return this.__OnShowing
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnShowingToken")) {
            this.remove_Showing(this.__OnShowingToken)
            this.__OnShowing.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<CoreWindow, CoreWindowPopupShowingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Showing(handler) {
        if (!this.HasProp("__ICoreWindowFlyout")) {
            if ((queryResult := this.QueryInterface(ICoreWindowFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowFlyout := ICoreWindowFlyout(outPtr)
        }

        return this.__ICoreWindowFlyout.add_Showing(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_Showing(cookie) {
        if (!this.HasProp("__ICoreWindowFlyout")) {
            if ((queryResult := this.QueryInterface(ICoreWindowFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowFlyout := ICoreWindowFlyout(outPtr)
        }

        return this.__ICoreWindowFlyout.remove_Showing(cookie)
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_MaxSize() {
        if (!this.HasProp("__ICoreWindowFlyout")) {
            if ((queryResult := this.QueryInterface(ICoreWindowFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowFlyout := ICoreWindowFlyout(outPtr)
        }

        return this.__ICoreWindowFlyout.get_MaxSize()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_MinSize() {
        if (!this.HasProp("__ICoreWindowFlyout")) {
            if ((queryResult := this.QueryInterface(ICoreWindowFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowFlyout := ICoreWindowFlyout(outPtr)
        }

        return this.__ICoreWindowFlyout.get_MinSize()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__ICoreWindowFlyout")) {
            if ((queryResult := this.QueryInterface(ICoreWindowFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowFlyout := ICoreWindowFlyout(outPtr)
        }

        return this.__ICoreWindowFlyout.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__ICoreWindowFlyout")) {
            if ((queryResult := this.QueryInterface(ICoreWindowFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowFlyout := ICoreWindowFlyout(outPtr)
        }

        return this.__ICoreWindowFlyout.put_Title(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IsInteractionDelayed() {
        if (!this.HasProp("__ICoreWindowFlyout")) {
            if ((queryResult := this.QueryInterface(ICoreWindowFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowFlyout := ICoreWindowFlyout(outPtr)
        }

        return this.__ICoreWindowFlyout.get_IsInteractionDelayed()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_IsInteractionDelayed(value) {
        if (!this.HasProp("__ICoreWindowFlyout")) {
            if ((queryResult := this.QueryInterface(ICoreWindowFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowFlyout := ICoreWindowFlyout(outPtr)
        }

        return this.__ICoreWindowFlyout.put_IsInteractionDelayed(value)
    }

    /**
     * 
     * @returns {IVector<IUICommand>} 
     */
    get_Commands() {
        if (!this.HasProp("__ICoreWindowFlyout")) {
            if ((queryResult := this.QueryInterface(ICoreWindowFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowFlyout := ICoreWindowFlyout(outPtr)
        }

        return this.__ICoreWindowFlyout.get_Commands()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DefaultCommandIndex() {
        if (!this.HasProp("__ICoreWindowFlyout")) {
            if ((queryResult := this.QueryInterface(ICoreWindowFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowFlyout := ICoreWindowFlyout(outPtr)
        }

        return this.__ICoreWindowFlyout.get_DefaultCommandIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DefaultCommandIndex(value) {
        if (!this.HasProp("__ICoreWindowFlyout")) {
            if ((queryResult := this.QueryInterface(ICoreWindowFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowFlyout := ICoreWindowFlyout(outPtr)
        }

        return this.__ICoreWindowFlyout.put_DefaultCommandIndex(value)
    }

    /**
     * 
     * @returns {UICommandInvokedHandler} 
     */
    get_BackButtonCommand() {
        if (!this.HasProp("__ICoreWindowFlyout")) {
            if ((queryResult := this.QueryInterface(ICoreWindowFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowFlyout := ICoreWindowFlyout(outPtr)
        }

        return this.__ICoreWindowFlyout.get_BackButtonCommand()
    }

    /**
     * 
     * @param {UICommandInvokedHandler} value 
     * @returns {HRESULT} 
     */
    put_BackButtonCommand(value) {
        if (!this.HasProp("__ICoreWindowFlyout")) {
            if ((queryResult := this.QueryInterface(ICoreWindowFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowFlyout := ICoreWindowFlyout(outPtr)
        }

        return this.__ICoreWindowFlyout.put_BackButtonCommand(value)
    }

    /**
     * Displays the flyout and asynchronously waits for the user to take an action.
     * @returns {IAsyncOperation<IUICommand>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.corewindowflyout.showasync
     */
    ShowAsync() {
        if (!this.HasProp("__ICoreWindowFlyout")) {
            if ((queryResult := this.QueryInterface(ICoreWindowFlyout.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowFlyout := ICoreWindowFlyout(outPtr)
        }

        return this.__ICoreWindowFlyout.ShowAsync()
    }

;@endregion Instance Methods
}
