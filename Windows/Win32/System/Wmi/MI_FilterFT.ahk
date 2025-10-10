#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A support structure used in the MI_Filter structure. Use the functions with the name prefix &quot;MI_Filter_&quot; to manipulate these structures.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ns-mi-mi_filterft
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_FilterFT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The provider calls this function to evaluate an instance against a given filter. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_filter_evaluate">MI_Filter_Evaluate</a>.
     * @type {Pointer}
     */
    Evaluate {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Gets the filter language and expression. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_filter_getexpression">MI_Filter_GetExpression</a>.
     * @type {Pointer}
     */
    GetExpression {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
