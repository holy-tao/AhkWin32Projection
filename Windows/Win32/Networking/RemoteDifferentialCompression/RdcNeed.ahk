#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a chunk that is required to synchronize two sets of data.
 * @see https://learn.microsoft.com/windows/win32/api/msrdc/ns-msrdc-rdcneed
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class RdcNeed extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Describes the type of data needed—source data or seed data.
     * @type {Integer}
     */
    m_BlockType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Offset, in bytes, from the start of the data where the chunk should be copied from.
     * @type {Integer}
     */
    m_FileOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Length, in bytes, of the chunk of data that is to be copied to the target data.
     * @type {Integer}
     */
    m_BlockLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
