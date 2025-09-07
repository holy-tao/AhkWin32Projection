#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a buffer.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcbufferpointer
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class RdcBufferPointer extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Size, in bytes, of the buffer.
     * @type {Integer}
     */
    m_Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * For input buffers, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nf-msrdc-irdccomparator-process">IRdcComparator::Process</a> 
     *       and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msrdc/nf-msrdc-irdcgenerator-process">IRdcGenerator::Process</a> will store here how 
     *       much (if any) of the buffer was used during processing.
     * @type {Integer}
     */
    m_Used {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to the buffer.
     * @type {Pointer<Byte>}
     */
    m_Data {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
