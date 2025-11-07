#Requires AutoHotkey v2.0.0 64-bit

/**
 * Values that are used in activation calls to indicate the execution contexts in which an object is to be run.
 * @remarks
 * 
 * Values from the <b>CLSCTX</b> enumeration are used in activation calls (<a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a>, <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstanceex">CoCreateInstanceEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetclassobject">CoGetClassObject</a>, and so on) to indicate the preferred execution contexts (in-process, local, or remote) in which an object is to be run. They are also used in calls to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coregisterclassobject">CoRegisterClassObject</a> to indicate the set of execution contexts in which a class object is to be made available for requests to construct instances (<b>IClassFactory::CreateInstance</b>).
 * 
 * To indicate that more than one context is acceptable, you can combine multiple values with Boolean ORs. The contexts are tried in the order in which they are listed. 
 * 
 * 
 * 
 * Given a set of <b>CLSCTX</b> flags, the execution context to be used depends on the availability of registered class codes and other parameters according to the following algorithm.
 * 
 * 
 * 
 * <ol>
 * <li>If the call specifies one of the following, CLSCTX_REMOTE_SERVER is implied and is added to the list of flags:<ol>
 * <li>An explicit <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-coserverinfo">COSERVERINFO</a> structure indicating a machine different from the current computer. 
 * </li>
 * <li>No explicit <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-coserverinfo">COSERVERINFO</a> structure specified but the specified class is registered with either the <a href="https://docs.microsoft.com/windows/desktop/com/remoteservername">RemoteServerName</a> or <a href="https://docs.microsoft.com/windows/desktop/com/activateatstorage">ActivateAtStorage</a> registry value.
 * </li>
 * </ol>
 * The second case allows applications written prior to the release of distributed COM to be the configuration of classes for remote activation to be used by client applications available prior to DCOM and the CLSCTX_REMOTE_SERVER flag. The cases in which there would be no explicit <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-coserverinfo">COSERVERINFO</a> structure are when the value is specified as <b>NULL</b> or when it is not one of the function parameters (as in calls to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> and <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetclassobject">CoGetClassObject</a>).
 * 
 * </li>
 * <li>If the explicit <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-coserverinfo">COSERVERINFO</a> parameter indicates the current computer, CLSCTX_REMOTE_SERVER is removed if present.
 * </li>
 * </ol>
 * The rest of the processing proceeds by looking at the value(s) in the following sequence: 
 * 
 * 
 * 
 * <ol>
 * <li>If the flags include CLSCTX_REMOTE_SERVER and no <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-coserverinfo">COSERVERINFO</a> parameter is specified and if the activation request indicates a persistent state from which to initialize the object (with <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-cogetinstancefromfile">CoGetInstanceFromFile</a>, <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-cogetinstancefromistorage">CoGetInstanceFromIStorage</a>, or, for a file moniker, in a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imoniker-bindtoobject">IMoniker::BindToObject</a>) and the class has an <a href="https://docs.microsoft.com/windows/desktop/com/activateatstorage">ActivateAtStorage</a> subkey or no class registry information whatsoever, the request to activate and initialize is forwarded to the computer where the persistent state resides. (Refer to the remote activation functions listed in the See Also section for details.)</li>
 * <li>If the flags include CLSCTX_INPROC_SERVER, the class code in the DLL found under the class's <a href="https://docs.microsoft.com/windows/desktop/com/inprocserver32">InprocServer32</a> key is used if this key exists. The class code will run within the same process as the caller.</li>
 * <li>If the flags include CLSCTX_INPROC_HANDLER, the class code in the DLL found under the class's <a href="https://docs.microsoft.com/windows/desktop/com/inprochandler32">InprocHandler32</a> key is used if this key exists. The class code will run within the same process as the caller.</li>
 * <li>If the flags include CLSCTX_LOCAL_SERVER, the class code in the service found under the class's <a href="https://docs.microsoft.com/windows/desktop/com/localservice">LocalService</a> key is used if this key exists. If no service is specified but an EXE is specified under that same key, the class code associated with that EXE is used. The class code (in either case) will be run in a separate service process on the same computer as the caller.</li>
 * <li>If the flag is set to CLSCTX_REMOTE_SERVER and an additional <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-coserverinfo">COSERVERINFO</a> parameter to the function specifies a particular remote computer, a request to activate is forwarded to this remote computer with flags modified to set to CLSCTX_LOCAL_SERVER. The class code will run in its own process on this specific computer, which must be different from that of the caller.</li>
 * <li>Finally, if the flags include CLSCTX_REMOTE_SERVER and no <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-coserverinfo">COSERVERINFO</a> parameter is specified and if a computer name is given under the class's <a href="https://docs.microsoft.com/windows/desktop/com/remoteservername">RemoteServerName</a> named-value, the request to activate is forwarded to this remote computer with the flags modified to be set to CLSCTX_LOCAL_SERVER. The class code will run in its own process on this specific computer, which must be different from that of the caller.</li>
 * </ol>
 * <h3><a id="CLSCTX_ACTIVATE_32_BIT_SERVER_and_CLSCTX_ACTIVATE_64_BIT_SERVER"></a><a id="clsctx_activate_32_bit_server_and_clsctx_activate_64_bit_server"></a><a id="CLSCTX_ACTIVATE_32_BIT_SERVER_AND_CLSCTX_ACTIVATE_64_BIT_SERVER"></a>CLSCTX_ACTIVATE_32_BIT_SERVER and CLSCTX_ACTIVATE_64_BIT_SERVER</h3>
 * The 64-bit versions of Windows introduce two new flags: CLSCTX_ACTIVATE_32_BIT_SERVER and CLSCTX_ACTIVATE_64_BIT_SERVER. On a 64-bit computer, a 32-bit and 64-bit version of the same COM server may coexist. When a client requests an activation of an out-of-process server, these <b>CLSCTX</b> flags allow the client to specify a 32-bit or a 64-bit version of the server.
 * 
 * 
 * 
 * Usually, a client will not care whether it uses a 32-bit or a 64-bit version of the server. However, if the server itself loads an additional in-process server, then it and the in-process server must both be either 32-bit or 64-bit. For example, suppose that the client wants to use a server "A", which in turn loads an in-process server "B". If only a 32-bit version of server "B" is available, then the client must specify the 32-bit version of server "A". If only a 64-bit version of server "B" is available, then the client must specify the 64-bit version of server "A".
 * 
 * 
 * 
 * A server can specify its own architecture preference via the PreferredServerBitness registry key, but the client's preference, specified via a CLSCTX_ACTIVATE_32_BIT_SERVER or CLSCTX_ACTIVATE_64_BIT_SERVER flag, will override the server's preference. If the client does not specify a preference, then the server's preference will be used.
 * 
 * 
 * 
 * If neither the client nor the server specifies a preference, then:
 * 
 * <ul>
 * <li>If the computer that hosts the server is running Windows Server 2003 with Service Pack 1 (SP1) or a later system, then COM will try to match the server architecture to the client architecture. In other words, for a 32-bit client, COM will activate a 32-bit server if available; otherwise it will activate a 64-bit version of the server. For a 64-bit client, COM will activate a 64-bit server if available; otherwise it will activate a 32-bit server.
 * </li>
 * <li>If the computer that hosts the server is running Windows XP or Windows Server 2003 without SP1 or later installed, then COM will prefer a 64-bit version of the server if available; otherwise it will activate a 32-bit version of the server.</li>
 * </ul>
 * If a <b>CLSCTX</b> enumeration has both the CLSCTX_ACTIVATE_32_BIT_SERVER and CLSCTX_ACTIVATE_64_BIT_SERVER flags set, then it is invalid and the activation will return E_INVALIDARG.
 * 
 * 
 * 
 * The following table shows the results of the various combinations of client architectures and client settings and server architectures and server settings.
 * 
 * The flags CLSCTX_ACTIVATE_32_BIT_SERVER and CLSCTX_ACTIVATE_64_BIT_SERVER flow across computer boundaries. If the computer that hosts the server is running the 64-bit Windows, then it will honor these flags; otherwise it will ignore them.
 * 
 * 
 * <table>
 * <tr>
 * <th></th>
 * <th>32-bit client, no flag</th>
 * <th>64-bit client, no flag</th>
 * <th>32-bit client, 32-bit flag¹</th>
 * <th>32-bit client, 64-bit flag²</th>
 * <th>64-bit client, 32-bit flag¹</th>
 * <th>64-bit client, 64-bit flag²</th>
 * </tr>
 * <tr>
 * <td>32-bit server, match client registry value³</td>
 * <td>32-bit server</td>
 * <td>See ⁸</td>
 * <td>32-bit server</td>
 * <td>See ⁸</td>
 * <td>32-bit server</td>
 * <td>See ⁸</td>
 * </tr>
 * <tr>
 * <td>32-bit server, 32-bit registry value⁴</td>
 * <td>32-bit server</td>
 * <td>32-bit server</td>
 * <td>32-bit server</td>
 * <td>See ⁸</td>
 * <td>32-bit server</td>
 * <td>See ⁸</td>
 * </tr>
 * <tr>
 * <td>32-bit server, 64-bit registry value⁵</td>
 * <td>See ⁸</td>
 * <td>See ⁸</td>
 * <td>32-bit server</td>
 * <td>See ⁸</td>
 * <td>32-bit server</td>
 * <td>See ⁸</td>
 * </tr>
 * <tr>
 * <td>32-bit server, no registry value⁶</td>
 * <td>32-bit server</td>
 * <td>64/32⁹</td>
 * <td>32-bit server</td>
 * <td>See ⁸</td>
 * <td>32-bit server</td>
 * <td>See ⁸</td>
 * </tr>
 * <tr>
 * <td>32-bit server, no registry value (before Windows Server 2003 with SP1)⁷</td>
 * <td>64/32⁹</td>
 * <td>64/32⁹</td>
 * <td>32-bit server</td>
 * <td>See ⁸</td>
 * <td>32-bit server</td>
 * <td>See ⁸</td>
 * </tr>
 * <tr>
 * <td>64-bit server, match client registry value³</td>
 * <td>See ⁸</td>
 * <td>64-bit server</td>
 * <td>See ⁸</td>
 * <td>64-bit server</td>
 * <td>See ⁸</td>
 * <td>64-bit server</td>
 * </tr>
 * <tr>
 * <td>64-bit server, 32-bit registry value⁴</td>
 * <td>See ⁸</td>
 * <td>See ⁸</td>
 * <td>See ⁸</td>
 * <td>64-bit server</td>
 * <td>See ⁸</td>
 * <td>64-bit server</td>
 * </tr>
 * <tr>
 * <td>64-bit server, 64-bit registry value⁵</td>
 * <td>64-bit server</td>
 * <td>64-bit server</td>
 * <td>See ⁸</td>
 * <td>64-bit server</td>
 * <td>See ⁸</td>
 * <td>64-bit server</td>
 * </tr>
 * <tr>
 * <td>64-bit server, no registry value⁶</td>
 * <td>32/64¹⁰</td>
 * <td>64-bit server</td>
 * <td>See ⁸</td>
 * <td>64-bit server</td>
 * <td>See ⁸</td>
 * <td>64-bit server</td>
 * </tr>
 * <tr>
 * <td>64-bit server, no registry value (before Windows Server 2003 with SP1)⁷</td>
 * <td>64-bit server</td>
 * <td>64-bit server</td>
 * <td>See ⁸</td>
 * <td>64-bit server</td>
 * <td>See ⁸</td>
 * <td>64-bit server</td>
 * </tr>
 * </table>
 *  
 * 
 * <b>PreferredServerBitness</b>
 * <a href="https://docs.microsoft.com/windows/desktop/com/preferredserverbitness">PreferredServerBitness</a>
 * <b>PreferredServerBitness</b>
 * <b>PreferredServerBitness</b>
 * <b>PreferredServerBitness</b>
 * <b>PreferredServerBitness</b>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wtypesbase/ne-wtypesbase-clsctx
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class CLSCTX{

    /**
     * The code that creates and manages objects of this class is a DLL that runs in the same process as the caller of the function specifying the class context.
     * @type {Integer (UInt32)}
     */
    static CLSCTX_INPROC_SERVER => 1

    /**
     * The code that manages objects of this class is an in-process handler. This is a DLL that runs in the client process and implements client-side structures of this class when instances of the class are accessed remotely.
     * @type {Integer (UInt32)}
     */
    static CLSCTX_INPROC_HANDLER => 2

    /**
     * The EXE code that creates and manages objects of this class runs on same machine but is loaded in a separate process space.
     * @type {Integer (UInt32)}
     */
    static CLSCTX_LOCAL_SERVER => 4

    /**
     * Obsolete.
     * @type {Integer (UInt32)}
     */
    static CLSCTX_INPROC_SERVER16 => 8

    /**
     * A remote context. The <a href="https://docs.microsoft.com/windows/desktop/com/localserver32">LocalServer32</a> or <a href="https://docs.microsoft.com/windows/desktop/com/localservice">LocalService</a> code that creates and manages objects of this class is run on a different computer.
     * @type {Integer (UInt32)}
     */
    static CLSCTX_REMOTE_SERVER => 16

    /**
     * Obsolete.
     * @type {Integer (UInt32)}
     */
    static CLSCTX_INPROC_HANDLER16 => 32

    /**
     * Reserved.
     * @type {Integer (UInt32)}
     */
    static CLSCTX_RESERVED1 => 64

    /**
     * Reserved.
     * @type {Integer (UInt32)}
     */
    static CLSCTX_RESERVED2 => 128

    /**
     * Reserved.
     * @type {Integer (UInt32)}
     */
    static CLSCTX_RESERVED3 => 256

    /**
     * Reserved.
     * @type {Integer (UInt32)}
     */
    static CLSCTX_RESERVED4 => 512

    /**
     * Disables the downloading of code from the directory service or the Internet. This flag cannot be set at the same time as CLSCTX_ENABLE_CODE_DOWNLOAD.
     * @type {Integer (UInt32)}
     */
    static CLSCTX_NO_CODE_DOWNLOAD => 1024

    /**
     * Reserved.
     * @type {Integer (UInt32)}
     */
    static CLSCTX_RESERVED5 => 2048

    /**
     * Specify if you want the activation to fail if it uses custom marshalling.
     * @type {Integer (UInt32)}
     */
    static CLSCTX_NO_CUSTOM_MARSHAL => 4096

    /**
     * Enables the downloading of code from the directory service or the Internet. This flag cannot be set at the same time as CLSCTX_NO_CODE_DOWNLOAD.
     * @type {Integer (UInt32)}
     */
    static CLSCTX_ENABLE_CODE_DOWNLOAD => 8192

    /**
     * The CLSCTX_NO_FAILURE_LOG can be used to override the logging of failures in <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstanceex">CoCreateInstanceEx</a>.
 * 
 * If the ActivationFailureLoggingLevel is created, the following values can determine the status of event logging:
 * 
 * <ul>
 * <li>0 = Discretionary logging. Log by default, but clients can override by specifying CLSCTX_NO_FAILURE_LOG in <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstanceex">CoCreateInstanceEx</a>.</li>
 * <li>1 = Always log all failures no matter what the client specified.</li>
 * <li>2 = Never log any failures no matter what client specified. If the registry entry is missing, the default is 0. If you need to control customer applications, it is recommended that you set this value to 0 and write the client code to override failures. It is strongly recommended that you do not set the value to 2. If event logging is disabled, it is more difficult to diagnose problems.
 * </li>
 * </ul>
     * @type {Integer (UInt32)}
     */
    static CLSCTX_NO_FAILURE_LOG => 16384

    /**
     * Disables activate-as-activator (AAA) activations for this activation only. This flag overrides the setting of the EOAC_DISABLE_AAA flag from the EOLE_AUTHENTICATION_CAPABILITIES enumeration. This flag cannot be set at the same time as CLSCTX_ENABLE_AAA. Any activation where a server process would be launched under the caller's identity is known as an activate-as-activator (AAA) activation. Disabling AAA activations allows an application that runs under a privileged account (such as LocalSystem) to help prevent its identity from being used to launch untrusted components. Library applications that use activation calls should always set this flag during those calls. This helps prevent the library application from being used in an escalation-of-privilege security attack. This is the only way to disable AAA activations in a library application because the EOAC_DISABLE_AAA flag from the EOLE_AUTHENTICATION_CAPABILITIES enumeration is applied only to the server process and not to the library application.
 * 
 * <b>Windows 2000:  </b>This flag is not supported.
     * @type {Integer (UInt32)}
     */
    static CLSCTX_DISABLE_AAA => 32768

    /**
     * Enables activate-as-activator (AAA) activations for this activation only. This flag overrides the setting of the EOAC_DISABLE_AAA flag from the EOLE_AUTHENTICATION_CAPABILITIES enumeration. This flag cannot be set at the same time as CLSCTX_DISABLE_AAA. Any activation where a server process would be launched under the caller's identity is known as an activate-as-activator (AAA) activation. Enabling this flag allows an application to transfer its identity to an activated component. 
 * 
 * <b>Windows 2000:  </b>This flag is not supported.
     * @type {Integer (UInt32)}
     */
    static CLSCTX_ENABLE_AAA => 65536

    /**
     * Begin this activation from the default context of the current apartment.
     * @type {Integer (UInt32)}
     */
    static CLSCTX_FROM_DEFAULT_CONTEXT => 131072

    /**
     * 
     * @type {Integer (UInt32)}
     */
    static CLSCTX_ACTIVATE_X86_SERVER => 262144

    /**
     * Activate or connect to a 32-bit version of the server; fail if one is not registered.
     * @type {Integer (UInt32)}
     */
    static CLSCTX_ACTIVATE_32_BIT_SERVER => 262144

    /**
     * Activate or connect to a 64 bit version of the server; fail if one is not registered.
     * @type {Integer (UInt32)}
     */
    static CLSCTX_ACTIVATE_64_BIT_SERVER => 524288

    /**
     * When this flag is specified, COM uses the impersonation token of the thread, if one is present, for the activation request made by the thread. When this flag is not specified or if the thread does not have an impersonation token, COM uses the process token of the thread's process for the activation request made by the thread.
 * 
 * 
 * <b>Windows Vista or later:  </b>This flag is supported.
     * @type {Integer (UInt32)}
     */
    static CLSCTX_ENABLE_CLOAKING => 1048576

    /**
     * Indicates activation is for an app container.
 * 
 * 
 * <div class="alert"><b>Note</b>  This flag is reserved for internal use and is not intended to be used directly from your code.</div>
 * <div> </div>
     * @type {Integer (UInt32)}
     */
    static CLSCTX_APPCONTAINER => 4194304

    /**
     * Specify this flag for Interactive User activation behavior for As-Activator servers. A strongly named Medium IL Windows Store app can use this flag to launch an "As Activator" COM server without a strong name. Also, you can use this flag to bind to a running instance of the COM server that's launched by a desktop application.
 * 
 * The client must be Medium IL, it must be strongly named, which means that it has a SysAppID in the client token, it can't be in session 0,  and it must have the same user as the session ID's user in the client token.
 * 
 * If  the server is out-of-process and "As Activator", it launches the server with the token of the client token's session user. This token won't be strongly named.
 * 
 * If the server is out-of-process and RunAs "Interactive User", this flag has no effect.
 *         
 * If the server is out-of-process and is any other RunAs type, the activation fails.
 * 
 * This flag has no effect for in-process servers. 
 * 
 * Off-machine activations fail when they use this flag.
     * @type {Integer (UInt32)}
     */
    static CLSCTX_ACTIVATE_AAA_AS_IU => 8388608

    /**
     * 
     * @type {Integer (UInt32)}
     */
    static CLSCTX_RESERVED6 => 16777216

    /**
     * 
     * @type {Integer (UInt32)}
     */
    static CLSCTX_ACTIVATE_ARM32_SERVER => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static CLSCTX_ALLOW_LOWER_TRUST_REGISTRATION => 67108864

    /**
     * Used for loading Proxy/Stub DLLs.
 * 
 * 
 * <div class="alert"><b>Note</b>  This flag is reserved for internal use and is not intended to be used directly from your code.</div>
 * <div> </div>
     * @type {Integer (UInt32)}
     */
    static CLSCTX_PS_DLL => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static CLSCTX_ALL => 23

    /**
     * @type {Integer (UInt32)}
     */
    static CLSCTX_SERVER => 21
}
