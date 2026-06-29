#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\OBJECT_TYPE_LIST.ahk" { OBJECT_TYPE_LIST }

/**
 * Lists the effective permissions.
 * @see https://learn.microsoft.com/windows/win32/api/aclui/ns-aclui-effperm_result_list
 * @namespace Windows.Win32.Security.Authorization.UI
 */
export default struct EFFPERM_RESULT_LIST {
    #StructPack 8

    /**
     * Indicates if the effective permissions results have been evaluated.
     */
    fEvaluated : BOOLEAN

    /**
     * The number of elements in both the <b>pObjectTypeList</b> and <b>pGrantedAccessList</b> members.
     */
    cObjectTypeListLength : UInt32

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-object_type_list">OBJECT_TYPE_LIST</a> structures that specifies the properties and property sets for which access was evaluated.
     */
    pObjectTypeList : OBJECT_TYPE_LIST.Ptr

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> values that specifies the access rights granted for each corresponding object type.
     */
    pGrantedAccessList : IntPtr

}
