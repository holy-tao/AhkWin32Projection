#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_DIRECTSOUND3DBUFFER extends Win32Enum {

    /**
     * Native name: KSPROPERTY_DIRECTSOUND3DBUFFER_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 0

    /**
     * Native name: KSPROPERTY_DIRECTSOUND3DBUFFER_POSITION
     * @type {Integer (Int32)}
     */
    static POSITION => 1

    /**
     * Native name: KSPROPERTY_DIRECTSOUND3DBUFFER_VELOCITY
     * @type {Integer (Int32)}
     */
    static VELOCITY => 2

    /**
     * Native name: KSPROPERTY_DIRECTSOUND3DBUFFER_CONEANGLES
     * @type {Integer (Int32)}
     */
    static CONEANGLES => 3

    /**
     * Native name: KSPROPERTY_DIRECTSOUND3DBUFFER_CONEORIENTATION
     * @type {Integer (Int32)}
     */
    static CONEORIENTATION => 4

    /**
     * Native name: KSPROPERTY_DIRECTSOUND3DBUFFER_CONEOUTSIDEVOLUME
     * @type {Integer (Int32)}
     */
    static CONEOUTSIDEVOLUME => 5

    /**
     * Native name: KSPROPERTY_DIRECTSOUND3DBUFFER_MINDISTANCE
     * @type {Integer (Int32)}
     */
    static MINDISTANCE => 6

    /**
     * Native name: KSPROPERTY_DIRECTSOUND3DBUFFER_MAXDISTANCE
     * @type {Integer (Int32)}
     */
    static MAXDISTANCE => 7

    /**
     * Native name: KSPROPERTY_DIRECTSOUND3DBUFFER_MODE
     * @type {Integer (Int32)}
     */
    static MODE => 8
}
