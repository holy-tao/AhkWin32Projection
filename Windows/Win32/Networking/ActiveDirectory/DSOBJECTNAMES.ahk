#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DSOBJECT.ahk" { DSOBJECT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DSOBJECTNAMES structure is used to contain directory object data for use by an Active Directory property sheet or context menu extension.
 * @see https://learn.microsoft.com/windows/win32/api/dsclient/ns-dsclient-dsobjectnames
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DSOBJECTNAMES {
    #StructPack 4

    /**
     * Contains the namespace identifier which indicates the origin of the namespace selection. The <b>CLSID_DsFolder</b> value (identical to <b>CLSID_MicrosoftDS</b>) is used to identify namespaces implemented by Active Directory Domain Services.
     */
    clsidNamespace : Guid

    /**
     * Contains the number of elements in the <b>aObjects</b> array.
     */
    cItems : UInt32

    /**
     * Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-dsobject">DSBOJECT</a> structures. Each <b>DSBOJECT</b> structure represents a single directory object. The <b>cItems</b> member contains the number of elements in the array.
     */
    aObjects : DSOBJECT[1]

}
