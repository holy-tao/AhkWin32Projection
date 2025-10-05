#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a name cache.
 * @see https://learn.microsoft.com/windows/win32/api/filehc/ns-filehc-name_cache_context
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NAME_CACHE_CONTEXT extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The signature to this structure to ensure whether this name cache context is valid.
     * 
     * <div class="alert"><b>Note</b>  Users should never change this for any reason.</div>
     * <div> </div>
     * @type {Integer}
     */
    m_dwSignature {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
