#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_MEMORY_EVENT_SUBTYPE extends Win32Enum {

    /**
     * Native name: CxlMemoryEventSubtype_NotReported
     * @type {Integer (Int32)}
     */
    static NotReported => 0

    /**
     * Native name: CxlMemoryEventSubtype_InternalDatapathError
     * @type {Integer (Int32)}
     */
    static InternalDatapathError => 1

    /**
     * Native name: CxlMemoryEventSubtype_MediaLinkCommandTrainingError
     * @type {Integer (Int32)}
     */
    static MediaLinkCommandTrainingError => 2

    /**
     * Native name: CxlMemoryEventSubtype_MediaLinkDataTrainingError
     * @type {Integer (Int32)}
     */
    static MediaLinkDataTrainingError => 3

    /**
     * Native name: CxlMemoryEventSubtype_MediaLinkCrcError
     * @type {Integer (Int32)}
     */
    static MediaLinkCrcError => 4
}
