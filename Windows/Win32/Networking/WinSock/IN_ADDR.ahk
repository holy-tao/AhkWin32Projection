#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The in_addr structure represents an IPv4 address.
 * @remarks
 * The <b>IPaddr</b> type definition also represents an IPv4 address and can be cast to an  <b>in_addr</b> structure when needed.
 * 
 * On the Microsoft Windows Software Development Kit (SDK) released for Windows Vista and later, the organization of header files has changed and the <b>in_addr</b> structure is defined in the <i>Inaddr.h</i> header file which is automatically included by the <i>Ipexport.h</i> header file. On the Platform Software Development Kit (SDK) released for Windows Server 2003 and Windows XP, the <b>in_addr</b> structure is declared in the <i>Ipexport.h</i> header file.
 * @see https://learn.microsoft.com/windows/win32/api/inaddr/ns-inaddr-in_addr
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct IN_ADDR {
    #StructPack 4


    struct _S_un {

        struct _S_un_b {
            s_b1 : Int8

            s_b2 : Int8

            s_b3 : Int8

            s_b4 : Int8

        }

        struct _S_un_w {
            s_w1 : UInt16

            s_w2 : UInt16

        }

        S_un_b : IN_ADDR._S_un._S_un_b

        static __New() {
            DefineProp(this.Prototype, 'S_un_w', { type: IN_ADDR._S_un._S_un_w, offset: 0 })
            DefineProp(this.Prototype, 'S_addr', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    S_un : IN_ADDR._S_un

}
