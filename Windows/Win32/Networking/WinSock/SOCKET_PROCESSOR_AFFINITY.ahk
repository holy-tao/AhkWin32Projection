#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\System\Kernel\PROCESSOR_NUMBER.ahk

/**
 * Contains the association between a socket and an RSS processor core and NUMA node.
 * @remarks
 * 
  * The <b>SOCKET_PROCESSOR_AFFINITY</b>  structure is supported on Windows 8,   and Windows Server 2012, and later versions of the operating system.
  * 
  * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/jj553482(v=vs.85)">SIO_QUERY_RSS_PROCESSOR_INFO</a> 
  *         IOCTL is used to determine the association between a socket and an RSS processor core and NUMA node. This IOCTL returns a <b>SOCKET_PROCESSOR_AFFINITY</b> structure that contains the processor number and the NUMA node ID.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ws2def/ns-ws2def-socket_processor_affinity
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCKET_PROCESSOR_AFFINITY extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A structure to represent a system wide processor number. This <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-processor_number">PROCESSOR_NUMBER</a> structure contains a
     * group number and relative processor number within the group.
     * @type {PROCESSOR_NUMBER}
     */
    Processor{
        get {
            if(!this.HasProp("__Processor"))
                this.__Processor := PROCESSOR_NUMBER(0, this)
            return this.__Processor
        }
    }

    /**
     * The NUMA node ID.
     * @type {Integer}
     */
    NumaNodeId {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * A value reserved for future use.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
