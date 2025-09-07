#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FIO_CONTEXT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    m_dwTempHack {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    m_dwSignature {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {HANDLE}
     */
    m_hFile{
        get {
            if(!this.HasProp("__m_hFile"))
                this.__m_hFile := HANDLE(this.ptr + 8)
            return this.__m_hFile
        }
    }

    /**
     * @type {Integer}
     */
    m_dwLinesOffset {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    m_dwHeaderLength {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
