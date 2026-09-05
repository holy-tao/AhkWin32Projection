#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the behavior of UiaGetUpdatedCache.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ne-uiautomationcoreapi-normalizestate
 * @namespace Windows.Win32.UI.Accessibility
 */
class NormalizeState extends Win32Enum {

    /**
     * No normalization.
     * Native name: NormalizeState_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Normalize against the condition in the cache request specified by pRequest.
     * Native name: NormalizeState_View
     * @type {Integer (Int32)}
     */
    static View => 1

    /**
     * Normalize against the condition specified in pNormalizeCondition.
     * Native name: NormalizeState_Custom
     * @type {Integer (Int32)}
     */
    static Custom => 2
}
