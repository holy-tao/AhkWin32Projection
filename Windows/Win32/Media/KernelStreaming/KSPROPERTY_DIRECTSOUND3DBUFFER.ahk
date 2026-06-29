#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_DIRECTSOUND3DBUFFER {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
