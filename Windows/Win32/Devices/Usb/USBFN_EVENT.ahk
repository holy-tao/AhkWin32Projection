#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Usb
 */
class USBFN_EVENT extends Win32Enum {

    /**
     * Native name: UsbfnEventMinimum
     * @type {Integer (Int32)}
     */
    static Minimum => 0

    /**
     * Native name: UsbfnEventAttach
     * @type {Integer (Int32)}
     */
    static Attach => 1

    /**
     * Native name: UsbfnEventReset
     * @type {Integer (Int32)}
     */
    static Reset => 2

    /**
     * Native name: UsbfnEventDetach
     * @type {Integer (Int32)}
     */
    static Detach => 3

    /**
     * Native name: UsbfnEventSuspend
     * @type {Integer (Int32)}
     */
    static Suspend => 4

    /**
     * Native name: UsbfnEventResume
     * @type {Integer (Int32)}
     */
    static Resume => 5

    /**
     * Native name: UsbfnEventSetupPacket
     * @type {Integer (Int32)}
     */
    static SetupPacket => 6

    /**
     * Native name: UsbfnEventConfigured
     * @type {Integer (Int32)}
     */
    static Configured => 7

    /**
     * Native name: UsbfnEventUnConfigured
     * @type {Integer (Int32)}
     */
    static UnConfigured => 8

    /**
     * Native name: UsbfnEventPortType
     * @type {Integer (Int32)}
     */
    static PortType => 9

    /**
     * Native name: UsbfnEventBusTearDown
     * @type {Integer (Int32)}
     */
    static BusTearDown => 10

    /**
     * Native name: UsbfnEventSetInterface
     * @type {Integer (Int32)}
     */
    static SetInterface => 11

    /**
     * Native name: UsbfnEventMaximum
     * @type {Integer (Int32)}
     */
    static Maximum => 12
}
