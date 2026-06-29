#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct FILEOPENDIALOGOPTIONS {
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
    static FOS_OVERWRITEPROMPT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FOS_STRICTFILETYPES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FOS_NOCHANGEDIR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FOS_PICKFOLDERS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FOS_FORCEFILESYSTEM => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FOS_ALLNONSTORAGEITEMS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static FOS_NOVALIDATE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static FOS_ALLOWMULTISELECT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FOS_PATHMUSTEXIST => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static FOS_FILEMUSTEXIST => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static FOS_CREATEPROMPT => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static FOS_SHAREAWARE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static FOS_NOREADONLYRETURN => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static FOS_NOTESTFILECREATE => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static FOS_HIDEMRUPLACES => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static FOS_HIDEPINNEDPLACES => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static FOS_NODEREFERENCELINKS => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static FOS_OKBUTTONNEEDSINTERACTION => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static FOS_DONTADDTORECENT => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static FOS_FORCESHOWHIDDEN => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static FOS_DEFAULTNOMINIMODE => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static FOS_FORCEPREVIEWPANEON => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static FOS_SUPPORTSTREAMABLEITEMS => 2147483648
}
