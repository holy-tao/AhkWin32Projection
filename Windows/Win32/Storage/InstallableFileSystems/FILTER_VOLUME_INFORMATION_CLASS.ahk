#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 */
class FILTER_VOLUME_INFORMATION_CLASS extends Win32Enum {

    /**
     * Native name: FilterVolumeBasicInformation
     * @type {Integer (Int32)}
     */
    static BasicInformation => 0

    /**
     * Native name: FilterVolumeStandardInformation
     * @type {Integer (Int32)}
     */
    static StandardInformation => 1
}
