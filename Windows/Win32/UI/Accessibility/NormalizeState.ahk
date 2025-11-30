#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the behavior of UiaGetUpdatedCache.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcoreapi/ne-uiautomationcoreapi-normalizestate
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class NormalizeState extends Win32Enum{

    /**
     * No normalization.
     * @type {Integer (Int32)}
     */
    static NormalizeState_None => 0

    /**
     * Normalize against the condition in the cache request specified by pRequest.
     * @type {Integer (Int32)}
     */
    static NormalizeState_View => 1

    /**
     * Normalize against the condition specified in pNormalizeCondition.
     * @type {Integer (Int32)}
     */
    static NormalizeState_Custom => 2
}
