#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Associates a parent object with a child object.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/ns-xamlom-parentchildrelation
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 */
export default struct ParentChildRelation {
    #StructPack 8

    /**
     * A handle to the parent object.
     */
    Parent : Int64

    /**
     * A handle to the child object.
     */
    Child : Int64

    /**
     * The index of <b>Child</b> in the <b>Children</b> collection of <b>Parent</b>.
     */
    ChildIndex : UInt32

}
