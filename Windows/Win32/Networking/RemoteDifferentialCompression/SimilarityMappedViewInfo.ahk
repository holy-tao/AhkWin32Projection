#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a similarity mapped view.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/ns-msrdc-similaritymappedviewinfo
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class SimilarityMappedViewInfo extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The mapped view information.
     * @type {Pointer<Integer>}
     */
    m_Data {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Size, in bytes, of the mapped view information.
     * @type {Integer}
     */
    m_Length {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
