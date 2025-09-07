#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A support structure used in the MI_QualifierSet structure. Use the functions with the name prefix &quot;MI_QualifierSet_&quot; to manipulate these structures.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_qualifiersetft
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_QualifierSetFT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Gets the number of qualifiers in a qualifier set. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_qualifierset_getqualifiercount">MI_QualifierSet_GetQualifierCount</a>.
     * @type {Pointer}
     */
    GetQualifierCount {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Gets a qualifier at the specified index. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_qualifierset_getqualifierat">MI_QualifierSet_GetQualifierAt</a>.
     * @type {Pointer}
     */
    GetQualifierAt {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Gets a named qualifier. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_qualifierset_getqualifier">MI_QualifierSet_GetQualifier</a>.
     * @type {Pointer}
     */
    GetQualifier {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
