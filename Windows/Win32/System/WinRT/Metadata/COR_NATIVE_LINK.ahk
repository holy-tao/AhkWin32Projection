#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class COR_NATIVE_LINK extends Win32Struct
{
    static sizeof => 6

    static packingSize => 1

    /**
     * @type {Integer}
     */
    m_linkType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    m_flags {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    m_entryPoint {
        get => NumGet(this, 2, "uint")
        set => NumPut("uint", value, this, 2)
    }
}
