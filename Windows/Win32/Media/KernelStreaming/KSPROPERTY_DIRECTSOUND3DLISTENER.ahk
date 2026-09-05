#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_DIRECTSOUND3DLISTENER extends Win32Enum {

    /**
     * Native name: KSPROPERTY_DIRECTSOUND3DLISTENER_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 0

    /**
     * Native name: KSPROPERTY_DIRECTSOUND3DLISTENER_POSITION
     * @type {Integer (Int32)}
     */
    static POSITION => 1

    /**
     * Native name: KSPROPERTY_DIRECTSOUND3DLISTENER_VELOCITY
     * @type {Integer (Int32)}
     */
    static VELOCITY => 2

    /**
     * Native name: KSPROPERTY_DIRECTSOUND3DLISTENER_ORIENTATION
     * @type {Integer (Int32)}
     */
    static ORIENTATION => 3

    /**
     * Native name: KSPROPERTY_DIRECTSOUND3DLISTENER_DISTANCEFACTOR
     * @type {Integer (Int32)}
     */
    static DISTANCEFACTOR => 4

    /**
     * Native name: KSPROPERTY_DIRECTSOUND3DLISTENER_ROLLOFFFACTOR
     * @type {Integer (Int32)}
     */
    static ROLLOFFFACTOR => 5

    /**
     * Native name: KSPROPERTY_DIRECTSOUND3DLISTENER_DOPPLERFACTOR
     * @type {Integer (Int32)}
     */
    static DOPPLERFACTOR => 6

    /**
     * Native name: KSPROPERTY_DIRECTSOUND3DLISTENER_BATCH
     * @type {Integer (Int32)}
     */
    static BATCH => 7

    /**
     * Native name: KSPROPERTY_DIRECTSOUND3DLISTENER_ALLOCATION
     * @type {Integer (Int32)}
     */
    static ALLOCATION => 8
}
