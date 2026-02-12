#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify kinds of pairing supported by your application or requested by the system. As an input value, use this value to indicate what kinds of pairing your application supports. When this datatype is received as an output value, it indicates the kind of pairing requested by the system; in that case, your code will need to respond accordingly.
 * @remarks
 * This value is a collection of flags. It's possible to have multiple values set for a single pairing action.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.enumeration.devicepairingkinds
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class DevicePairingKinds extends Win32BitflagEnum{

    /**
     * No pairing is supported.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The application must confirm they wish to perform the pairing action. You can present an optional confirmation dialog to the user. With a value of **ConfirmOnly**, call [Accept](devicepairingrequestedeventargs_accept_1944939200.md) from the event args of the [PairingRequested](deviceinformationcustompairing_pairingrequested.md) event handler if you want the pairing to complete.
     * @type {Integer (UInt32)}
     */
    static ConfirmOnly => 1

    /**
     * The application must display the given PIN to the user. The user will then need to enter or confirm that PIN on the device that is being paired. With a value of **DisplayPin**, call [Accept](devicepairingrequestedeventargs_accept_1944939200.md) from the event args of the [PairingRequested](deviceinformationcustompairing_pairingrequested.md) event handler if you want the pairing to complete. If your application cancels the pairing at this point, the device might still be paired. This is because the system and the target device don't need any confirmation for this DevicePairingKinds value.
     * @type {Integer (UInt32)}
     */
    static DisplayPin => 2

    /**
     * The application must request a PIN from the user. The PIN will typically be displayed on the target device. With a value of **ProvidePin**, call [Accept](/uwp/api/windows.devices.enumeration.devicepairingrequestedeventargs.accept) from the event args of the [PairingRequested](deviceinformationcustompairing_pairingrequested.md) event handler if you want the pairing to complete. Pass in the PIN as a parameter.
     * @type {Integer (UInt32)}
     */
    static ProvidePin => 4

    /**
     * The application must display the given PIN to the user and ask the user to confirm that the PIN matches the one show on the target device. With a value of **ConfirmPinMatch**, call [Accept](/uwp/api/windows.devices.enumeration.devicepairingrequestedeventargs.accept) from the event args of the [PairingRequested](deviceinformationcustompairing_pairingrequested.md) event handler if you want the pairing to complete.
     * @type {Integer (UInt32)}
     */
    static ConfirmPinMatch => 8

    /**
     * The application must request a user name and password from the user. With a value of **ProvidePasswordCredential**, call [AcceptWithPasswordCredential](devicepairingrequestedeventargs_acceptwithpasswordcredential_1073078053.md) from the event args of the [PairingRequested](deviceinformationcustompairing_pairingrequested.md) event handler to accept the pairing. Pass in the [PasswordCredential](../windows.security.credentials/passwordcredential.md) that encapsulates the user name and password as a parameter.
     * @type {Integer (UInt32)}
     */
    static ProvidePasswordCredential => 16

    /**
     * The application must provide an address from the device. This is typically used for directed discovery over a network protocol such as IPP or UPnP, where the application already knows the IP/address/URL of the device. With a value of **ProvideAddress**, you should call [AcceptWithAddress](./devicepairingrequestedeventargs_acceptwithaddress_1238468511.md) on the event args of the [PairingRequested](/uwp/api/windows.devices.enumeration.deviceinformationcustompairing.pairingrequested) event handler, if you want the pairing to complete. Pass in the address as a parameter.
     * @type {Integer (UInt32)}
     */
    static ProvideAddress => 32
}
