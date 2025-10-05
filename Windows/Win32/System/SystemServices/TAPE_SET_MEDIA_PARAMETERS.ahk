#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the tape in the tape drive. It is used by the SetTapeParametersfunction.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-tape_set_media_parameters
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class TAPE_SET_MEDIA_PARAMETERS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Number of bytes per block. Maximum and minimum block sizes can be obtained by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-gettapeparameters">GetTapeParameters</a> function.
     * @type {Integer}
     */
    BlockSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
