#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Note  This structure is deprecated.  Contains parameters used in the UiaFind function.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiafindparams
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class UiaFindParams extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>int</b>
     * 
     * The maximum depth to which to search the tree for matching elements.
     * @type {Integer}
     */
    MaxDepth {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> to return only the first matching element; <b>FALSE</b> to return all matching elements.
     * @type {Integer}
     */
    FindFirst {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * <b>TRUE</b> to exclude the root element; otherwise <b>FALSE</b>.
     * @type {Integer}
     */
    ExcludeRoot {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacondition">UiaCondition</a>*</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/uiautomationcoreapi/ns-uiautomationcoreapi-uiacondition">UiaCondition</a> structure that contains information about a condition that returned elements must match.
     * @type {Pointer<UiaCondition>}
     */
    pFindCondition {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
