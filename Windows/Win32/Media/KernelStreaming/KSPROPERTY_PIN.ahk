#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_PIN extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_PIN_CINSTANCES => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_PIN_CTYPES => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_PIN_DATAFLOW => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_PIN_DATARANGES => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_PIN_DATAINTERSECTION => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_PIN_INTERFACES => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_PIN_MEDIUMS => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_PIN_COMMUNICATION => 7

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_PIN_GLOBALCINSTANCES => 8

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_PIN_NECESSARYINSTANCES => 9

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_PIN_PHYSICALCONNECTION => 10

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_PIN_CATEGORY => 11

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_PIN_NAME => 12

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_PIN_CONSTRAINEDDATARANGES => 13

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_PIN_PROPOSEDATAFORMAT => 14

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_PIN_PROPOSEDATAFORMAT2 => 15

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_PIN_MODEDATAFORMATS => 16
}
