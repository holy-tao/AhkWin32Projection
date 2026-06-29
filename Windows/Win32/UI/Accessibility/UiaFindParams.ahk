#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UiaCondition.ahk" { UiaCondition }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Note  This structure is deprecated.  Contains parameters used in the UiaFind function.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiafindparams
 * @namespace Windows.Win32.UI.Accessibility
 */
export default struct UiaFindParams {
    #StructPack 8

    /**
     * Type: <b>int</b>
     * 
     * The maximum depth to which to search the tree for matching elements.
     */
    MaxDepth : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> to return only the first matching element; <b>FALSE</b> to return all matching elements.
     */
    FindFirst : BOOL

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> to exclude the root element; otherwise <b>FALSE</b>.
     */
    ExcludeRoot : BOOL

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacondition">UiaCondition</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacondition">UiaCondition</a> structure that contains information about a condition that returned elements must match.
     */
    pFindCondition : UiaCondition.Ptr

}
