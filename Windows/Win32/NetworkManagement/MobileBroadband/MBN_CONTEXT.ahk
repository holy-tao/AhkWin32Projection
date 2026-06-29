#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MBN_AUTH_PROTOCOL.ahk" { MBN_AUTH_PROTOCOL }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\MBN_CONTEXT_TYPE.ahk" { MBN_CONTEXT_TYPE }
#Import ".\MBN_COMPRESSION.ahk" { MBN_COMPRESSION }

/**
 * The MBN_CONTEXT structure stores information about the connection context.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ns-mbnapi-mbn_context
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct MBN_CONTEXT {
    #StructPack 8

    /**
     * Contains the unique identifier for this context.  This represents the context index in the device or SIM memory.  If it is set to <b>MBN_CONTEXT_ID_APPEND</b>, then the device will find the appropriate index to store the context.
     */
    contextID : UInt32

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_context_type">MBN_CONTEXT_TYPE</a> value that specifies the context type.  An application can use this member to modify the context stored at a particular index using the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectioncontext-setprovisionedcontext">SetProvisionedContext</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectioncontext">IMbnConnectionContext</a>.
     */
    contextType : MBN_CONTEXT_TYPE

    /**
     * Contains connection-specific access information.  In GSM networks, this would be an access point name (APN) such as "data.thephone-company.com".  In CDMA networks, this might be a special dial code such as "#777" or a NAI (Network Access Identifier) such as "somebody@thephone-company.com".  
     * 
     * This string must not exceed <b>MBN_ACCESSSTRING_LEN</b> characters. For the definition of <b>MBN_ACCESSTRING_LEN</b>, see <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_context_constants">MBN_CONTEXT_CONSTANTS</a>. This string can be empty.  The calling application must free this string by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     */
    accessString : BSTR

    /**
     * Contains the user name that is used for authentication.
     * 
     * The string must not exceed <b>MBN_USERNAME_LEN</b> characters.  The calling application must free this string by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>. For the definition of <b>MBN_USERNAME_LEN</b>, see <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_context_constants">MBN_CONTEXT_CONSTANTS</a>. The calling application must free this string by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     */
    userName : BSTR

    /**
     * Contains the password that is used for authentication.
     * 
     * The string must not exceed <b>MBN_PASSWORD_LEN</b> characters. This string can be empty.  For the definition of <b>MBN_PASSWORD_LEN</b>, see <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_context_constants">MBN_CONTEXT_CONSTANTS</a>. The calling application must free this string by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     */
    password : BSTR

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_compression">MBN_COMPRESSION</a> value that specifies whether compression is used in the data link for header and data.
     * 
     * This member is applicable only for GSM devices.
     */
    compression : MBN_COMPRESSION

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_auth_protocol">MBN_AUTH_PROTOCOL</a> value that indicates the type of compression used for PDP (Packet Data Protocol) activation.
     * 
     * This member is applicable only for GSM devices.  For CDMA devices, it is set to <b>MBN_AUTH_PROTOCOL_NONE</b>.
     */
    authType : MBN_AUTH_PROTOCOL

}
