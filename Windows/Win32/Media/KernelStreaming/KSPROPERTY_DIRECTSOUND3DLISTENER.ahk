#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_DIRECTSOUND3DLISTENER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DIRECTSOUND3DLISTENER_ALL => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DIRECTSOUND3DLISTENER_POSITION => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DIRECTSOUND3DLISTENER_VELOCITY => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DIRECTSOUND3DLISTENER_ORIENTATION => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DIRECTSOUND3DLISTENER_DISTANCEFACTOR => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DIRECTSOUND3DLISTENER_ROLLOFFFACTOR => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DIRECTSOUND3DLISTENER_DOPPLERFACTOR => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DIRECTSOUND3DLISTENER_BATCH => 7

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DIRECTSOUND3DLISTENER_ALLOCATION => 8
}
