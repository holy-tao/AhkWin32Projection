#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The in_addr structure represents an IPv4 Internet address.
 * @remarks
 * 
 * The <b>in_addr</b> structure is used with IPv4 addresses. 
 * 
 * The <b>in_addr</b> structure is the IPv4 equivalent of the IPv6-based <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms738560(v=vs.85)">in6_addr</a> structure.  
 * 
 * <div class="alert"><b>Note</b>  The <b>IN_ADDR</b>, <b>PIN_ADDR</b>, and  <b>LPIN_ADDR</b> derived structures are only defined on the Windows SDK released with Windows Vista and later. The <b>IN_ADDR</b>, <b>PIN_ADDR</b>, and  <b>LPIN_ADDR</b> derived structures are defined in the <i>Inaddr.h</i> header file. On earlier versions of the Windows SDK, variables of this type should be declared as <b>struct in_addr</b>. </div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsock2/ns-winsock2-in_addr
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class IN_ADDR extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    class _S_un_b extends Win32Struct {
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
    
    }

    class _S_un_w extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

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
    
    }

    /**
     * @type {_S_un_b}
     */
    S_un_b{
        get {
            if(!this.HasProp("__S_un_b"))
                this.__S_un_b := %this.__Class%._S_un_b(0, this)
            return this.__S_un_b
        }
    }

    /**
     * @type {_S_un_w}
     */
    S_un_w{
        get {
            if(!this.HasProp("__S_un_w"))
                this.__S_un_w := %this.__Class%._S_un_w(0, this)
            return this.__S_un_w
        }
    }

    /**
     * @type {Integer}
     */
    S_addr {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
