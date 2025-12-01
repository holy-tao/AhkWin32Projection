#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SHITEMID.ahk

/**
 * Contains a list of item identifiers.
 * @remarks
 * A pointer to this structure, called a <i>PIDL</i>, is used to identify objects in the Shell namespace.  For more information about pointers to item identifier lists (PIDLs) and item identifiers, see <a href="https://docs.microsoft.com/windows/desktop/shell/namespace-intro">Introduction to the Shell Namespace</a>.
 * 
 * <h3><a id="ITEMIDLIST_Strict_Types"></a><a id="itemidlist_strict_types"></a><a id="ITEMIDLIST_STRICT_TYPES"></a>ITEMIDLIST Strict Types</h3>
 * As of Windows Vista, several forms of <b>ITEMIDLIST</b> are available as data types. The three main types are:
 * 
 *                 
 * 
 * <ul>
 * <li>IDLIST_ABSOLUTE: Fully qualified <b>ITEMIDLIST</b> relative to the root of the namespace. It may be multi-level.</li>
 * <li>IDLIST_RELATIVE: <b>ITEMIDLIST</b> relative to a parent folder. It may be multi-level.</li>
 * <li>ITEMID_CHILD: Single-level <b>ITEMIDLIST</b> relative to a parent folder. It contains exactly one <a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-shitemid">SHITEMID</a> structure.</li>
 * </ul>
 * These types are used if you compile your code with the symbol STRICT_TYPED_ITEMIDS before you include the Shell header files, as shown in the following example code.
 * 
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/shtypes/ns-shtypes-itemidlist
 * @namespace Windows.Win32.UI.Shell.Common
 * @version v4.0.30319
 */
class ITEMIDLIST extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shtypes/ns-shtypes-shitemid">SHITEMID</a></b>
     * 
     * A list of item identifiers.
     * @type {SHITEMID}
     */
    mkid{
        get {
            if(!this.HasProp("__mkid"))
                this.__mkid := SHITEMID(0, this)
            return this.__mkid
        }
    }
}
