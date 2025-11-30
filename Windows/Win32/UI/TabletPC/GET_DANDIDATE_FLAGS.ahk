#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class GET_DANDIDATE_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TCF_ALLOW_RECOGNITION => 1

    /**
     * @type {Integer (Int32)}
     */
    static TCF_FORCE_RECOGNITION => 2
}
