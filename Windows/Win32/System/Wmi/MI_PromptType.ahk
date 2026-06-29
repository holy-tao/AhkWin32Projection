#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines prompt types for the CIM extensions.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ne-mi-mi_prompttype
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_PromptType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * A parameter of the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_promptuser">MI_Context_PromptUser</a> function that specifies whether the prompt is a normal prompt such as "are you sure you want to delete this file?"
     * @type {Integer (Int32)}
     */
    static MI_PROMPTTYPE_NORMAL => 0

    /**
     * A parameter of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_context_promptuser">MI_Context_PromptUser</a> function that specifies whether the prompt is a critical prompt, such as "are you sure you want to format your hard disk drive?"
     * @type {Integer (Int32)}
     */
    static MI_PROMPTTYPE_CRITICAL => 1
}
