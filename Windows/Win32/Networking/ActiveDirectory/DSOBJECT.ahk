#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains directory object data.
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/ns-dsclient-dsobject
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DSOBJECT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwProviderFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Contains the offset, in bytes, from the start of the <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-dsobjectnames">DSOBJECTNAMES</a> structure to a NULL-terminated, Unicode string that contains the ADSPath of the object.
     * 
     * The following code example shows how to use this member.
     * 
     * 
     * ```cpp
     * pwszName = (LPWSTR)((LPBYTE)pdsObjNames + 
     *     pdsObjNames->aObjects[i].offsetName);
     * 
     * ```
     * @type {Integer}
     */
    offsetName {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Contains the offset, in bytes, from the start of the <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-dsobjectnames">DSOBJECTNAMES</a> structure to a NULL-terminated, Unicode string that contains the class name of the object. Contains zero if the class name is unknown.
     * 
     * The following code example shows how to use this member.
     * 
     * 
     * ```cpp
     * pwszClass = (LPWSTR)((LPBYTE)pdsObjNames + 
     *     pdsObjNames->aObjects[i].offsetClass);
     * 
     * ```
     * @type {Integer}
     */
    offsetClass {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
