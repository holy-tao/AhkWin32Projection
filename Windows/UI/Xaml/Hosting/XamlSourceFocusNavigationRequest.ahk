#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXamlSourceFocusNavigationRequest.ahk
#Include .\IXamlSourceFocusNavigationRequestFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides information about a request to give focus to a [DesktopWindowXamlSource](desktopwindowxamlsource.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamlsourcefocusnavigationrequest
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class XamlSourceFocusNavigationRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXamlSourceFocusNavigationRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXamlSourceFocusNavigationRequest.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [XamlSourceFocusNavigationRequest](xamlsourcefocusnavigationrequest.md) class with the reason for the navigation request.
     * @param {Integer} reason A value that indicates the reason for the navigation request.
     * @returns {XamlSourceFocusNavigationRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamlsourcefocusnavigationrequest.#ctor
     */
    static CreateInstance(reason) {
        if (!XamlSourceFocusNavigationRequest.HasProp("__IXamlSourceFocusNavigationRequestFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.XamlSourceFocusNavigationRequest")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlSourceFocusNavigationRequestFactory.IID)
            XamlSourceFocusNavigationRequest.__IXamlSourceFocusNavigationRequestFactory := IXamlSourceFocusNavigationRequestFactory(factoryPtr)
        }

        return XamlSourceFocusNavigationRequest.__IXamlSourceFocusNavigationRequestFactory.CreateInstance(reason)
    }

    /**
     * Initializes a new instance of the [XamlSourceFocusNavigationRequest](xamlsourcefocusnavigationrequest.md) class with the reason for the navigation request and the bounding rectangle that will receive navigation focus.
     * @remarks
     * The *hintRect* parameter is used to provide context to the UWP XAML framework when the user enters the **DesktopWindowXamlSource** by using a 4-direction navigation experience (for example, by using keyboard arrow keys) with [Reason](xamlsourcefocusnavigationrequest_reason.md) values of **Left**, **Right**, **Top**, or **Down**. For example, suppose that to the left of the **DesktopWindowXamlSource** are three WPF buttons and inside the **DesktopWindowXamlSource** are three UWP buttons, so in total there is a 3x2 grid of buttons across two UI frameworks. When the user presses the right arrow on the keyboard from the middle WPF button, you want focus to move to the middle UWP button in the **DesktopWindowXamlSource**. To accomplish this, pass the bounding rectangle of the middle WPF button to the *hintRect* parameter and specify **Right** for the *reason* parameter.
     * @param {Integer} reason A value that indicates the reason for the navigation request.
     * @param {RECT} hintRect The bounding rectangle of the element in the desktop application that is losing focus (that is, the element that had focus before the [DesktopWindowXamlSource](desktopwindowxamlsource.md) received focus). This parameter is used to provide context to the UWP XAML framework when the user enters the **DesktopWindowXamlSource** by using a 4-direction navigation experience (for example, by using keyboard arrow keys). For more information, see the remarks.
     * @returns {XamlSourceFocusNavigationRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamlsourcefocusnavigationrequest.#ctor
     */
    static CreateInstanceWithHintRect(reason, hintRect) {
        if (!XamlSourceFocusNavigationRequest.HasProp("__IXamlSourceFocusNavigationRequestFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.XamlSourceFocusNavigationRequest")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlSourceFocusNavigationRequestFactory.IID)
            XamlSourceFocusNavigationRequest.__IXamlSourceFocusNavigationRequestFactory := IXamlSourceFocusNavigationRequestFactory(factoryPtr)
        }

        return XamlSourceFocusNavigationRequest.__IXamlSourceFocusNavigationRequestFactory.CreateInstanceWithHintRect(reason, hintRect)
    }

    /**
     * Initializes a new instance of the [XamlSourceFocusNavigationRequest](xamlsourcefocusnavigationrequest.md) class with the reason for the navigation request, the bounding rectangle that will receive navigation focus, and the unique correlation ID for the request.
     * @remarks
     * The *hintRect* parameter is used to provide context to the UWP XAML framework when the user enters the **DesktopWindowXamlSource** by using a 4-direction navigation experience (for example, by using keyboard arrow keys) with [Reason](xamlsourcefocusnavigationrequest_reason.md) values of **Left**, **Right**, **Top**, or **Down**. For example, suppose that to the left of the **DesktopWindowXamlSource** are three WPF buttons and inside the **DesktopWindowXamlSource** are three UWP buttons, so in total there is a 3x2 grid of buttons across two UI frameworks. When the user presses the right arrow on the keyboard from the middle WPF button, you want focus to move to the middle UWP button in the **DesktopWindowXamlSource**. To accomplish this, pass the bounding rectangle of the middle WPF button to the *hintRect* parameter and specify **Right** for the *reason* parameter.
     * @param {Integer} reason A value that indicates the reason for the navigation request.
     * @param {RECT} hintRect The bounding rectangle of the element in the desktop application that is losing focus (that is, the element that had focus before the [DesktopWindowXamlSource](desktopwindowxamlsource.md) received focus). This parameter is used to provide context to the UWP XAML framework when the user enters the **DesktopWindowXamlSource** by using a 4-direction navigation experience (for example, by using keyboard arrow keys). For more information, see the remarks.
     * @param {Guid} correlationId_ The unique identifier for the navigation request. You can use this parameter for logging purposes, or if you have an existing correlation ID from an in-progress focus movement already in progress and you want to connect that focus movement with the current navigation request.
     * @returns {XamlSourceFocusNavigationRequest} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamlsourcefocusnavigationrequest.#ctor
     */
    static CreateInstanceWithHintRectAndCorrelationId(reason, hintRect, correlationId_) {
        if (!XamlSourceFocusNavigationRequest.HasProp("__IXamlSourceFocusNavigationRequestFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Hosting.XamlSourceFocusNavigationRequest")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IXamlSourceFocusNavigationRequestFactory.IID)
            XamlSourceFocusNavigationRequest.__IXamlSourceFocusNavigationRequestFactory := IXamlSourceFocusNavigationRequestFactory(factoryPtr)
        }

        return XamlSourceFocusNavigationRequest.__IXamlSourceFocusNavigationRequestFactory.CreateInstanceWithHintRectAndCorrelationId(reason, hintRect, correlationId_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a [XamlSourceFocusNavigationReason](xamlsourcefocusnavigationreason.md) value that indicates the reason for the navigation request.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamlsourcefocusnavigationrequest.reason
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
    }

    /**
     * Gets the bounding rectangle of the element in the desktop application that is losing focus (that is, the element that had focus before the [DesktopWindowXamlSource](desktopwindowxamlsource.md) received focus).
     * @remarks
     * For more information about this property, see the [XamlSourceFocusNavigationRequest](xamlsourcefocusnavigationrequest_xamlsourcefocusnavigationrequest_617944682.md) constructor.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamlsourcefocusnavigationrequest.hintrect
     * @type {RECT} 
     */
    HintRect {
        get => this.get_HintRect()
    }

    /**
     * Gets the unique identifier for the navigation request. You can use this value for logging purposes, or if you have an existing correlation ID from an in-progress focus movement already in progress and you want to connect that focus movement with a new navigation request.
     * @remarks
     * If you use the [XamlSourceFocusNavigationRequest](xamlsourcefocusnavigationrequest_xamlsourcefocusnavigationrequest_2111624014.md) constructor, this property returns the value you passed to the *correlationId* parameter. Otherwise, this property returns a correlation ID that was initialized by the UWP framework.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamlsourcefocusnavigationrequest.correlationid
     * @type {Guid} 
     */
    CorrelationId {
        get => this.get_CorrelationId()
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
    get_Reason() {
        if (!this.HasProp("__IXamlSourceFocusNavigationRequest")) {
            if ((queryResult := this.QueryInterface(IXamlSourceFocusNavigationRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlSourceFocusNavigationRequest := IXamlSourceFocusNavigationRequest(outPtr)
        }

        return this.__IXamlSourceFocusNavigationRequest.get_Reason()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_HintRect() {
        if (!this.HasProp("__IXamlSourceFocusNavigationRequest")) {
            if ((queryResult := this.QueryInterface(IXamlSourceFocusNavigationRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlSourceFocusNavigationRequest := IXamlSourceFocusNavigationRequest(outPtr)
        }

        return this.__IXamlSourceFocusNavigationRequest.get_HintRect()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_CorrelationId() {
        if (!this.HasProp("__IXamlSourceFocusNavigationRequest")) {
            if ((queryResult := this.QueryInterface(IXamlSourceFocusNavigationRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXamlSourceFocusNavigationRequest := IXamlSourceFocusNavigationRequest(outPtr)
        }

        return this.__IXamlSourceFocusNavigationRequest.get_CorrelationId()
    }

;@endregion Instance Methods
}
