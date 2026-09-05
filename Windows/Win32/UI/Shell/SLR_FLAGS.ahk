#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SLR_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: SLR_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: SLR_NO_UI
     * @type {Integer (Int32)}
     */
    static NO_UI => 1

    /**
     * Native name: SLR_ANY_MATCH
     * @type {Integer (Int32)}
     */
    static ANY_MATCH => 2

    /**
     * Native name: SLR_UPDATE
     * @type {Integer (Int32)}
     */
    static UPDATE => 4

    /**
     * Native name: SLR_NOUPDATE
     * @type {Integer (Int32)}
     */
    static NOUPDATE => 8

    /**
     * Native name: SLR_NOSEARCH
     * @type {Integer (Int32)}
     */
    static NOSEARCH => 16

    /**
     * Native name: SLR_NOTRACK
     * @type {Integer (Int32)}
     */
    static NOTRACK => 32

    /**
     * Native name: SLR_NOLINKINFO
     * @type {Integer (Int32)}
     */
    static NOLINKINFO => 64

    /**
     * Native name: SLR_INVOKE_MSI
     * @type {Integer (Int32)}
     */
    static INVOKE_MSI => 128

    /**
     * Native name: SLR_NO_UI_WITH_MSG_PUMP
     * @type {Integer (Int32)}
     */
    static NO_UI_WITH_MSG_PUMP => 257

    /**
     * Native name: SLR_OFFER_DELETE_WITHOUT_FILE
     * @type {Integer (Int32)}
     */
    static OFFER_DELETE_WITHOUT_FILE => 512

    /**
     * Native name: SLR_KNOWNFOLDER
     * @type {Integer (Int32)}
     */
    static KNOWNFOLDER => 1024

    /**
     * Native name: SLR_MACHINE_IN_LOCAL_TARGET
     * @type {Integer (Int32)}
     */
    static MACHINE_IN_LOCAL_TARGET => 2048

    /**
     * Native name: SLR_UPDATE_MACHINE_AND_SID
     * @type {Integer (Int32)}
     */
    static UPDATE_MACHINE_AND_SID => 4096

    /**
     * Native name: SLR_NO_OBJECT_ID
     * @type {Integer (Int32)}
     */
    static NO_OBJECT_ID => 8192
}
