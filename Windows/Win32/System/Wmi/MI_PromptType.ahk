#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines prompt types for the CIM extensions.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ne-mi-mi_prompttype
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_PromptType{

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
