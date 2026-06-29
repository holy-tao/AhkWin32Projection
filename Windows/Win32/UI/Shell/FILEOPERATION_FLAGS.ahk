#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct FILEOPERATION_FLAGS {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static FOFX_NOSKIPJUNCTIONS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static FOFX_PREFERHARDLINK => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static FOFX_SHOWELEVATIONPROMPT => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static FOFX_RECYCLEONDELETE => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static FOFX_EARLYFAILURE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static FOFX_PRESERVEFILEEXTENSIONS => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static FOFX_KEEPNEWERFILE => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static FOFX_NOCOPYHOOKS => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static FOFX_NOMINIMIZEBOX => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static FOFX_MOVEACLSACROSSVOLUMES => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static FOFX_DONTDISPLAYSOURCEPATH => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static FOFX_DONTDISPLAYDESTPATH => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static FOFX_REQUIREELEVATION => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static FOFX_ADDUNDORECORD => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static FOFX_COPYASDOWNLOAD => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static FOFX_DONTDISPLAYLOCATIONS => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static FOF_MULTIDESTFILES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FOF_CONFIRMMOUSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FOF_SILENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FOF_RENAMEONCOLLISION => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FOF_NOCONFIRMATION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FOF_WANTMAPPINGHANDLE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FOF_ALLOWUNDO => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FOF_FILESONLY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FOF_SIMPLEPROGRESS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FOF_NOCONFIRMMKDIR => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FOF_NOERRORUI => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static FOF_NOCOPYSECURITYATTRIBS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static FOF_NORECURSION => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static FOF_NO_CONNECTED_ELEMENTS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static FOF_WANTNUKEWARNING => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static FOF_NORECURSEREPARSE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static FOF_NO_UI => 1556
}
