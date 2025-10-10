#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The NDK_VERSION structure specifies major and minor versions in the NDK interface.
 * @remarks
 * 
  * This structure is used to specify NDK version numbers in several NDK structures and functions.
  * 
  * To specify version 1.1 (for Windows Server 2012), set both the <b>Major</b> and <b>Minor</b> members to 1.
  * 
  * To specify version 1.2 (for Windows Server 2012 R2), set the <b>Major</b> member to 1 and the <b>Minor</b> member to 2.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ndkinfo/ns-ndkinfo-ndk_version
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDK_VERSION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * The NDK major version number.
     * @type {Integer}
     */
    Major {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The NDK minor version number.
     * @type {Integer}
     */
    Minor {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
