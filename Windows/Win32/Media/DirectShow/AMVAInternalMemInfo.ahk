#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AMVAInternalMemInfo structure specifies the amount of scratch memory the hardware abstraction layer (HAL) will allocate for its private use.
 * @see https://docs.microsoft.com/windows/win32/api//amva/ns-amva-amvainternalmeminfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMVAInternalMemInfo extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Amount of scratch memory the HAL will allocate for its private use.
     * @type {Integer}
     */
    dwScratchMemAlloc {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
