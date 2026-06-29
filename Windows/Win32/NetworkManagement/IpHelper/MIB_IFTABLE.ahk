#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIB_IFROW.ahk" { MIB_IFROW }
#Import ".\INTERNAL_IF_OPER_STATUS.ahk" { INTERNAL_IF_OPER_STATUS }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains a table of interface entries.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getiftable">GetIfTable</a> function enumerates the interface entries on a local system and returns this information in a <b>MIB_IFTABLE</b> structure. 
 * 
 * 
 * 
 * The <b>MIB_IFTABLE</b> structure may contain padding for alignment between the <b>dwNumEntries</b> member and the first <a href="https://docs.microsoft.com/windows/desktop/api/ifmib/ns-ifmib-mib_ifrow">MIB_IFROW</a> array entry in the <b>table</b> member. Padding for alignment may also be present between the <b>MIB_IFROW</b> array entries in the <b>table</b> member. Any access to a <b>MIB_IFROW</b> array entry should assume  padding may exist. 
 * 
 * 
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>MIB_IFTABLE</b> structure is defined in the <i>Ifmib.h</i> header file not in the <i>Iprtrmib.h</i> header file. Note that the <i>Ifmib.h</i> header file is automatically included in <i>Ipmib.h</i> header file. This file is automatically included in the <i>Iprtrmib.h</i> header file which is automatically included in the <i>Iphlpapi.h</i> header file. The <i>Ifmib.h</i> header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/api/ifmib/ns-ifmib-mib_iftable
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IFTABLE {
    #StructPack 4

    /**
     * The number of interface entries in the array.
     */
    dwNumEntries : UInt32

    /**
     * An array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ifmib/ns-ifmib-mib_ifrow">MIB_IFROW</a> structures containing interface entries.
     */
    table : MIB_IFROW[1]

}
