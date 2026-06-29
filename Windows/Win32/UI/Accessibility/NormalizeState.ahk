#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that specify the behavior of UiaGetUpdatedCache.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ne-uiautomationcoreapi-normalizestate
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct NormalizeState {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
