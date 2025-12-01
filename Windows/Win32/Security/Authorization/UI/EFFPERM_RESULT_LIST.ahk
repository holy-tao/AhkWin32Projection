#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Lists the effective permissions.
 * @see https://learn.microsoft.com/windows/win32/api/aclui/ns-aclui-effperm_result_list
 * @namespace Windows.Win32.Security.Authorization.UI
 * @version v4.0.30319
 */
class EFFPERM_RESULT_LIST extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Indicates if the effective permissions results have been evaluated.
     * @type {BOOLEAN}
     */
    fEvaluated {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * The number of elements in both the <b>pObjectTypeList</b> and <b>pGrantedAccessList</b> members.
     * @type {Integer}
     */
    cObjectTypeListLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-object_type_list">OBJECT_TYPE_LIST</a> structures that specifies the properties and property sets for which access was evaluated.
     * @type {Pointer<OBJECT_TYPE_LIST>}
     */
    pObjectTypeList {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> values that specifies the access rights granted for each corresponding object type.
     * @type {Pointer<Integer>}
     */
    pGrantedAccessList {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
