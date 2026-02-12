#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INetworkOperatorHotspotAuthenticationTrigger.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a mobile network operator hotspot authentication trigger.
  * 
  * > [!NOTE]
  * > An app can only instantiate this object and register for the hotspot authentication event after a WLAN profile has been provisioned that references this app to handle hotspot authentication. For more info, see [Windows 8 Integration for Wireless Hotspot Operators](/windows-hardware/drivers/mobilebroadband/integrating-windows-with-wireless-hotspots).
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.networkoperatorhotspotauthenticationtrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class NetworkOperatorHotspotAuthenticationTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INetworkOperatorHotspotAuthenticationTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INetworkOperatorHotspotAuthenticationTrigger.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of a mobile network operator hotspot authentication trigger.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.NetworkOperatorHotspotAuthenticationTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
