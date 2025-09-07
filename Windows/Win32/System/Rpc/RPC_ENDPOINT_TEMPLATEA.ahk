#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the properties of an RPC interface group server endpoint, including protocol sequence and name. (RPC_ENDPOINT_TEMPLATEA)
 * @remarks
 * The value provided in <i>Backlog</i> by applications is only a hint. The RPC run time or the Windows Sockets provider may override the value. For example, on Windows XP or Windows 2000 Professional, the value is limited to 5. Values greater than 5 are ignored and 5 is used instead. On Windows Server 2003 and Windows 2000 Server, the value will be honored.
  * 
  * Applications must be careful to pass reasonable values in <i>Backlog</i>. Large values on Server, Advanced Server, or Datacenter Server can cause a large amount of non-paged pool memory to be used. Using too small a value is also unfavorable, as it may result in TCP SYN packets being met by TCP RST from the server if the backlog queue gets exhausted.
  * 
  * An application developer should balance memory footprint versus scalability requirements when determining the proper value for <i>Backlog</i>.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The rpcdce.h header defines RPC_ENDPOINT_TEMPLATE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/rpcdce/ns-rpcdce-rpc_endpoint_templatea
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 * @charset ANSI
 */
class RPC_ENDPOINT_TEMPLATEA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * This field is reserved and must be set to 0.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a string identifier of the protocol sequence to register with the RPC run-time library.  Only <a href="https://docs.microsoft.com/windows/desktop/Rpc/protocol-sequence-constants">ncalrpc</a>, ncacn_ip_tcp, and ncacn_np are supported.  This value must not be <b>NULL</b>.
     * @type {Pointer<Ptr>}
     */
    ProtSeq {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Optional pointer to the endpoint-address information to use in creating a binding for the protocol sequence specified in the <i>Protseq</i> parameter.  Specify <b>NULL</b> to use dynamic endpoints.
     * @type {Pointer<Ptr>}
     */
    Endpoint {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to an optional parameter provided for the security subsystem. Used only for <a href="https://docs.microsoft.com/windows/desktop/Rpc/protocol-sequence-constants">ncacn_np</a> and ncalrpc protocol sequences. All other protocol sequences ignore this parameter. Using a security descriptor on the endpoint in order to make a server secure is not recommended.
     * @type {Pointer<Void>}
     */
    SecurityDescriptor {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Backlog queue length for the <a href="https://docs.microsoft.com/windows/desktop/Rpc/protocol-sequence-constants">ncacn_ip_tcp</a> protocol sequence. All other protocol sequences ignore this parameter. Use <b>RPC_C_PROTSEQ_MAX_REQS_DEFAULT</b> to specify the default value.  See Remarks for more information.
     * @type {Integer}
     */
    Backlog {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
