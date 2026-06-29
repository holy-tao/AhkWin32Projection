#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\NetworkManagement\WNet\NET_RESOURCE_TYPE.ahk" { NET_RESOURCE_TYPE }
#Import "..\..\NetworkManagement\WNet\NET_RESOURCE_SCOPE.ahk" { NET_RESOURCE_SCOPE }
#Import "..\..\NetworkManagement\WNet\NETRESOURCEA.ahk" { NETRESOURCEA }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Defines the CF_NETRESOURCE clipboard format.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-nresarray
 * @namespace Windows.Win32.UI.Shell
 */
export default struct NRESARRAY {
    #StructPack 8

    /**
     * Type: <b>UINT</b>
     * 
     * The number of elements in the <b>nr</b> array.
     */
    cItems : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a>[1]</b>
     * 
     * The array of <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structures that contain information about network resources. The string members (<b>LPSTR</b> types) in the structure contain offsets instead of addresses.
     */
    nr : NETRESOURCEA[1]

}
