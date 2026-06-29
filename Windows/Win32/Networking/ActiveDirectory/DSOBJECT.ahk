#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains directory object data.
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/ns-dsclient-dsobject
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DSOBJECT {
    #StructPack 4

    dwFlags : UInt32

    dwProviderFlags : UInt32

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
     */
    offsetName : UInt32

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
     */
    offsetClass : UInt32

}
