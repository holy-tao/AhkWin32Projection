#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_PIN extends Win32Enum {

    /**
     * Native name: KSPROPERTY_PIN_CINSTANCES
     * @type {Integer (Int32)}
     */
    static CINSTANCES => 0

    /**
     * Native name: KSPROPERTY_PIN_CTYPES
     * @type {Integer (Int32)}
     */
    static CTYPES => 1

    /**
     * Native name: KSPROPERTY_PIN_DATAFLOW
     * @type {Integer (Int32)}
     */
    static DATAFLOW => 2

    /**
     * Native name: KSPROPERTY_PIN_DATARANGES
     * @type {Integer (Int32)}
     */
    static DATARANGES => 3

    /**
     * Native name: KSPROPERTY_PIN_DATAINTERSECTION
     * @type {Integer (Int32)}
     */
    static DATAINTERSECTION => 4

    /**
     * Native name: KSPROPERTY_PIN_INTERFACES
     * @type {Integer (Int32)}
     */
    static INTERFACES => 5

    /**
     * Native name: KSPROPERTY_PIN_MEDIUMS
     * @type {Integer (Int32)}
     */
    static MEDIUMS => 6

    /**
     * Native name: KSPROPERTY_PIN_COMMUNICATION
     * @type {Integer (Int32)}
     */
    static COMMUNICATION => 7

    /**
     * Native name: KSPROPERTY_PIN_GLOBALCINSTANCES
     * @type {Integer (Int32)}
     */
    static GLOBALCINSTANCES => 8

    /**
     * Native name: KSPROPERTY_PIN_NECESSARYINSTANCES
     * @type {Integer (Int32)}
     */
    static NECESSARYINSTANCES => 9

    /**
     * Native name: KSPROPERTY_PIN_PHYSICALCONNECTION
     * @type {Integer (Int32)}
     */
    static PHYSICALCONNECTION => 10

    /**
     * Native name: KSPROPERTY_PIN_CATEGORY
     * @type {Integer (Int32)}
     */
    static CATEGORY => 11

    /**
     * Native name: KSPROPERTY_PIN_NAME
     * @type {Integer (Int32)}
     */
    static NAME => 12

    /**
     * Native name: KSPROPERTY_PIN_CONSTRAINEDDATARANGES
     * @type {Integer (Int32)}
     */
    static CONSTRAINEDDATARANGES => 13

    /**
     * Native name: KSPROPERTY_PIN_PROPOSEDATAFORMAT
     * @type {Integer (Int32)}
     */
    static PROPOSEDATAFORMAT => 14

    /**
     * Native name: KSPROPERTY_PIN_PROPOSEDATAFORMAT2
     * @type {Integer (Int32)}
     */
    static PROPOSEDATAFORMAT2 => 15

    /**
     * Native name: KSPROPERTY_PIN_MODEDATAFORMATS
     * @type {Integer (Int32)}
     */
    static MODEDATAFORMATS => 16
}
