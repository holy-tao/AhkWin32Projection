#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayRequest.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a display request.
 * @remarks
 * To conserve power and extend battery life, the system reduces power to the computer if it does not detect any user activity for a certain amount of time. Depending on system power settings, the display may first be dimmed, a screen saver may be displayed, and eventually the display may be turned off as the system enters a low-power sleep state.
 * 
 * Apps that show video or run for extended periods without user input can request that the display remain on by calling [DisplayRequest.RequestActive](displayrequest_requestactive_1312599685.md). When a display request is activated, the device's display remains on while the app is visible. When the user moves the app out of the foreground, the system deactivates the app's display requests and reactivates them when the app returns to the foreground.
 * 
 * Display requests are cumulative - each display request must be released with a separate call to [DisplayRequest.RequestRelease](displayrequest_requestrelease_966711579.md). An app should keep track of the number of active display requests and make sure all are released (each with a corresponding call to [DisplayRequest.RequestRelease](displayrequest_requestrelease_966711579.md)) when the app no longer requires the display to remain on. For more information see:
 * + [How to keep the display on during audio/video playback ](/previous-versions/windows/apps/jj152728(v=win.10))
 * + [MediaElement](/windows/uwp/design/controls-and-patterns/media-playback)
 * + [Display power state sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Display%20power%20state%20sample)
 * 
 * 
 * Using display requests to keep the display on consumes a lot of power. Use these guidelines for best app behavior when using display requests.
 * + Use display requests only when required, that is, times when no user input is expected but the display should remain on. For example, during full screen presentations or when the user is reading an e-book.
 * + Release each display request as soon as it is no longer required.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.system.display.displayrequest
 * @namespace Windows.System.Display
 * @version WindowsRuntime 1.4
 */
class DisplayRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayRequest.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Creates an instance of the [DisplayRequest](displayrequest.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.System.Display.DisplayRequest")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Activates a display request.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.display.displayrequest.requestactive
     */
    RequestActive() {
        if (!this.HasProp("__IDisplayRequest")) {
            if ((queryResult := this.QueryInterface(IDisplayRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayRequest := IDisplayRequest(outPtr)
        }

        return this.__IDisplayRequest.RequestActive()
    }

    /**
     * Deactivates a display request.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.display.displayrequest.requestrelease
     */
    RequestRelease() {
        if (!this.HasProp("__IDisplayRequest")) {
            if ((queryResult := this.QueryInterface(IDisplayRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayRequest := IDisplayRequest(outPtr)
        }

        return this.__IDisplayRequest.RequestRelease()
    }

;@endregion Instance Methods
}
