#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the content for an adaptive notification.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.iadaptivenotificationcontent
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IAdaptiveNotificationContent extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdaptiveNotificationContent
     * @type {Guid}
     */
    static IID => Guid("{eb0dbe66-7448-448d-9db8-d78acd2abba9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Kind", "get_Hints"]

    /**
     * Specifies the type of content the notification contains.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.iadaptivenotificationcontent.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Specifies hints for formatting the notification, such as the text style, text wrapping, and alignment. For a complete list of hints, see the [text element entry of the Adaptive notifications schema](/windows/uwp/controls-and-patterns/tiles-and-notifications-adaptive-tiles-schema).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.notifications.iadaptivenotificationcontent.hints
     * @type {IMap<HSTRING, HSTRING>} 
     */
    Hints {
        get => this.get_Hints()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_Hints() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMap((ptr) => HSTRING({ Value: ptr }), (ptr) => HSTRING({ Value: ptr }), value)
    }
}
