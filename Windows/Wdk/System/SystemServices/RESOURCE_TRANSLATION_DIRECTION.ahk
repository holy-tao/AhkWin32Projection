#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class RESOURCE_TRANSLATION_DIRECTION extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static TranslateChildToParent => 0

    /**
     * @type {Integer (Int32)}
     */
    static TranslateParentToChild => 1
}
