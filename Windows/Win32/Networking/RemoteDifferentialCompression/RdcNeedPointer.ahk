#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an array of RdcNeed structures.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcneedpointer
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class RdcNeedPointer extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Contains the number of <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcneed">RdcNeed</a> structures in array pointed 
     *       to by <b>m_Data</b>.
     * @type {Integer}
     */
    m_Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * When the structure is passed to the 
     *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nf-msrdc-irdccomparator-process">IRdcComparator::Process</a> method, this member 
     *       should be zero. On return this member will contain the number of 
     *       <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcneed">RdcNeed</a> structures that were filled with data.
     * @type {Integer}
     */
    m_Used {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Address of array of <a href="https://docs.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcneed">RdcNeed</a> structures that describe the 
     *       chunks required from the source and seed data.
     * @type {Pointer<RdcNeed>}
     */
    m_Data {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
