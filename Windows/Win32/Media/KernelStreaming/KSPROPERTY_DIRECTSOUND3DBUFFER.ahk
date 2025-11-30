#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_DIRECTSOUND3DBUFFER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DIRECTSOUND3DBUFFER_ALL => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DIRECTSOUND3DBUFFER_POSITION => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DIRECTSOUND3DBUFFER_VELOCITY => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DIRECTSOUND3DBUFFER_CONEANGLES => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DIRECTSOUND3DBUFFER_CONEORIENTATION => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DIRECTSOUND3DBUFFER_CONEOUTSIDEVOLUME => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DIRECTSOUND3DBUFFER_MINDISTANCE => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DIRECTSOUND3DBUFFER_MAXDISTANCE => 7

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_DIRECTSOUND3DBUFFER_MODE => 8
}
