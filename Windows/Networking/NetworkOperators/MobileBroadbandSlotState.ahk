#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify possible SIM slot states. This API is for use by OEMs and partners who are familiar with cellular concepts, and therefore can interpret the enum.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.mobilebroadbandslotstate
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class MobileBroadbandSlotState extends Win32Enum{

    /**
     * Specifies that the SIM slot is not managed. For example, this is the case for devices with a single SIM slot.
     * @type {Integer (Int32)}
     */
    static Unmanaged => 0

    /**
     * Specifies that the SIM slot state is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 1

    /**
     * Specifies that the SIM slot is powered off, and empty.
     * @type {Integer (Int32)}
     */
    static OffEmpty => 2

    /**
     * Specifies that the SIM slot is powered off, and a SIM is present
     * @type {Integer (Int32)}
     */
    static Off => 3

    /**
     * Specifies that the SIM slot is powered on, but empty.
     * @type {Integer (Int32)}
     */
    static Empty => 4

    /**
     * Specifies that the SIM in the slot is not ready.
     * @type {Integer (Int32)}
     */
    static NotReady => 5

    /**
     * Specifies that the SIM in the slot is active.
     * @type {Integer (Int32)}
     */
    static Active => 6

    /**
     * Specifies that the SIM in the slot is in an error state.
     * @type {Integer (Int32)}
     */
    static Error => 7

    /**
     * Specifies that the SIM in the slot is an eSIM with an active profile, and is ready to accept commands.
     * @type {Integer (Int32)}
     */
    static ActiveEsim => 8

    /**
     * Specifies that the SIM in the slot is an eSIM with no active profiles, and is ready to accept commands.
     * @type {Integer (Int32)}
     */
    static ActiveEsimNoProfile => 9
}
