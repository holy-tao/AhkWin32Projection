#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * The MBN_CONTEXT structure stores information about the connection context.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ns-mbnapi-mbn_context
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_CONTEXT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Contains the unique identifier for this context.  This represents the context index in the device or SIM memory.  If it is set to <b>MBN_CONTEXT_ID_APPEND</b>, then the device will find the appropriate index to store the context.
     * @type {Integer}
     */
    contextID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_context_type">MBN_CONTEXT_TYPE</a> value that specifies the context type.  An application can use this member to modify the context stored at a particular index using the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnconnectioncontext-setprovisionedcontext">SetProvisionedContext</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnconnectioncontext">IMbnConnectionContext</a>.
     * @type {Integer}
     */
    contextType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Contains connection-specific access information.  In GSM networks, this would be an access point name (APN) such as "data.thephone-company.com".  In CDMA networks, this might be a special dial code such as "#777" or a NAI (Network Access Identifier) such as "somebody@thephone-company.com".  
     * 
     * This string must not exceed <b>MBN_ACCESSSTRING_LEN</b> characters. For the definition of <b>MBN_ACCESSTRING_LEN</b>, see <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_context_constants">MBN_CONTEXT_CONSTANTS</a>. This string can be empty.  The calling application must free this string by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @type {BSTR}
     */
    accessString{
        get {
            if(!this.HasProp("__accessString"))
                this.__accessString := BSTR(8, this)
            return this.__accessString
        }
    }

    /**
     * Contains the user name that is used for authentication.
     * 
     * The string must not exceed <b>MBN_USERNAME_LEN</b> characters.  The calling application must free this string by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>. For the definition of <b>MBN_USERNAME_LEN</b>, see <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_context_constants">MBN_CONTEXT_CONSTANTS</a>. The calling application must free this string by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @type {BSTR}
     */
    userName{
        get {
            if(!this.HasProp("__userName"))
                this.__userName := BSTR(16, this)
            return this.__userName
        }
    }

    /**
     * Contains the password that is used for authentication.
     * 
     * The string must not exceed <b>MBN_PASSWORD_LEN</b> characters. This string can be empty.  For the definition of <b>MBN_PASSWORD_LEN</b>, see <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_context_constants">MBN_CONTEXT_CONSTANTS</a>. The calling application must free this string by calling <a href="https://docs.microsoft.com/windows/win32/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @type {BSTR}
     */
    password{
        get {
            if(!this.HasProp("__password"))
                this.__password := BSTR(24, this)
            return this.__password
        }
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_compression">MBN_COMPRESSION</a> value that specifies whether compression is used in the data link for header and data.
     * 
     * This member is applicable only for GSM devices.
     * @type {Integer}
     */
    compression {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/ne-mbnapi-mbn_auth_protocol">MBN_AUTH_PROTOCOL</a> value that indicates the type of compression used for PDP (Packet Data Protocol) activation.
     * 
     * This member is applicable only for GSM devices.  For CDMA devices, it is set to <b>MBN_AUTH_PROTOCOL_NONE</b>.
     * @type {Integer}
     */
    authType {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }
}
