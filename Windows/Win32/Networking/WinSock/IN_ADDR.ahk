#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The in_addr structure represents an IPv4 address.
 * @remarks
 * The <b>IPaddr</b> type definition also represents an IPv4 address and can be cast to an  <b>in_addr</b> structure when needed.
  * 
  * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>in_addr</b> structure is defined in the <i>Inaddr.h</i> header file which is automatically included by the <i>Ipexport.h</i> header file. On the Platform Software Development Kit (SDK) released for Windows Server 2003 and Windows XP, the <b>in_addr</b> structure is declared in the <i>Ipexport.h</i> header file.
 * @see https://learn.microsoft.com/windows/win32/api/inaddr/ns-inaddr-in_addr
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IN_ADDR extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    s_b1 {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    s_b2 {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    s_b3 {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    s_b4 {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {Integer}
     */
    s_w1 {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    s_w2 {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    S_addr {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
