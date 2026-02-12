#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Identifies the relationship that defines a grouping of controls on the device.
  * 
  * Collections are a way to group a set of controls that are similar to one another; or, are related by physical, or, operational proximity.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidcollectiontype
 * @namespace Windows.Devices.HumanInterfaceDevice
 * @version WindowsRuntime 1.4
 */
class HidCollectionType extends Win32Enum{

    /**
     * The controls are related by physical source.
     * @type {Integer (Int32)}
     */
    static Physical => 0

    /**
     * The controls are related by intended application.
     * @type {Integer (Int32)}
     */
    static Application => 1

    /**
     * The controls are logically related.
     * @type {Integer (Int32)}
     */
    static Logical => 2

    /**
     * The controls are related by report type.
     * @type {Integer (Int32)}
     */
    static Report => 3

    /**
     * The controls are related by a named array.
     * @type {Integer (Int32)}
     */
    static NamedArray => 4

    /**
     * The controls are related by a usage switch.
     * @type {Integer (Int32)}
     */
    static UsageSwitch => 5

    /**
     * The controls are related by a usage modifier.
     * @type {Integer (Int32)}
     */
    static UsageModifier => 6

    /**
     * The control relationship is not described by a defined category.
     * @type {Integer (Int32)}
     */
    static Other => 7
}
