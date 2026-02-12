#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Struct.ahk
#Include ..\..\Win32Handle.ahk

/**
 * Represents a reference to a delegate that receives change notifications.
  * 
  * > **.NET**
  * > When programming with .NET, this type is hidden. For advanced scenarios, use [System.Runtime.InteropServices.WindowsRuntime.EventRegistrationToken](/dotnet/api/system.runtime.interopservices.windowsruntime.eventregistrationtoken?view=dotnet-uwp-10.0&preserve-view=true) instead.
  * > 
  * > [**C++/WinRT**](/windows/uwp/cpp-and-winrt-apis/)
  * > In the C++/WinRT language projection, this type appears as [winrt::event_token](/uwp/cpp-ref-for-winrt/event-token).
 * @remarks
 * When programming with .NET, this type is hidden and developers that need an event registration token for advanced event scenarios should use the [System.Runtime.InteropServices.WindowsRuntime.EventRegistrationToken](/dotnet/api/system.runtime.interopservices.windowsruntime.eventregistrationtoken?view=dotnet-uwp-10.0&preserve-view=true) type. For most app code, you won't need [EventRegistrationToken](/dotnet/api/system.runtime.interopservices.windowsruntime.eventregistrationtoken?view=dotnet-uwp-10.0&preserve-view=true) (or event registration tokens) at all, because the add/remove syntax for C# and Visual Basic languages enables the compiler to generate the registration tokens from a simpler syntax.
 * 
 * In the event subscription model, a delegate registers to receive change notifications from a specified object such as a collection. The EventRegistrationToken is used to remove the delegate as a subscriber of change notifications when notifications are no longer needed.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.eventregistrationtoken
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class EventRegistrationToken extends Win32Handle
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The list of values which indicate that the handle is invalid
     * @type {Array<Integer>}
     */
    static invalidValues => []

    /**
     * The reference to the delegate.
     * A valid reference will not have a value of zero.
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}
