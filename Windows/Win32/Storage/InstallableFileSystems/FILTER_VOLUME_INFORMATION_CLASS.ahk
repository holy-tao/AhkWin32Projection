#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.InstallableFileSystems
 * @version v4.0.30319
 */
class FILTER_VOLUME_INFORMATION_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FilterVolumeBasicInformation => 0

    /**
     * @type {Integer (Int32)}
     */
    static FilterVolumeStandardInformation => 1
}
