#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the method used to authorize incoming Miracast connections.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.miracast.miracastreceiverauthorizationmethod
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class MiracastReceiverAuthorizationMethod extends Win32Enum{

    /**
     * Automatically accept new Miracast connections.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The Miracast Receiver will ask the user to accept or reject the incoming connection.
     * @type {Integer (Int32)}
     */
    static ConfirmConnection => 1

    /**
     * The Miracast Receiver will display a PIN only if the Miracast transmitter requests the use of a PIN.
     * @type {Integer (Int32)}
     */
    static PinDisplayIfRequested => 2

    /**
     * The Miracast Receiver will display a PIN and the Miracast transmitter must enter it.
     * @type {Integer (Int32)}
     */
    static PinDisplayRequired => 3
}
