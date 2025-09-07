#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Metadata for the service operation.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_operation_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_OPERATION_DESCRIPTION extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Defines the version information. Currently value is 1.
     * @type {Integer}
     */
    versionInfo {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The description of incoming <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> for a given service operation.
     * @type {Pointer<WS_MESSAGE_DESCRIPTION>}
     */
    inputMessageDescription {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The description of outgoing <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> for a given service operation. For one way operations this should be <b>NULL</b>.
     * @type {Pointer<WS_MESSAGE_DESCRIPTION>}
     */
    outputMessageDescription {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Provides additional flags for the in message of the operation. See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_charset">WS_SERVICE_OPERATION_MESSAGE_OPTION</a> for
     *                     a list of flags. If no flags are needed, this may be 0.
     *                 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_charset">WS_SERVICE_OPERATION_MESSAGE_NILLABLE_ELEMENT</a> is not applicable to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_operation_style">WS_RPC_LITERAL_OPERATION</a> style
     *                     operations. The input parameter must be with type of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_parameter_type">WS_PARAMETER_TYPE_MESSAGES</a>.
     * @type {Integer}
     */
    inputMessageOptions {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Provides additional flags for the out message of the operation. See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_charset">WS_SERVICE_OPERATION_MESSAGE_OPTION</a> for
     *                     a list of flags. If out message is not available, or no flags are needed, this may be 0.
     *                 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_charset">WS_SERVICE_OPERATION_MESSAGE_NILLABLE_ELEMENT</a> is not applicable to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_operation_style">WS_RPC_LITERAL_OPERATION</a> style
     *                     operations. The output parameter must be with type of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_parameter_type">WS_PARAMETER_TYPE_MESSAGES</a>.
     * @type {Integer}
     */
    outputMessageOptions {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The number of  parameters on the given service operation.
     * @type {Integer}
     */
    parameterCount {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * An array defining the individual parameters.
     * @type {Pointer<WS_PARAMETER_DESCRIPTION>}
     */
    parameterDescription {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to the stub function for the given operation to which the service model will delegate 
     *                     to do the service operation call. This will be <b>NULL</b> for proxies.
     * @type {Pointer<Ptr>}
     */
    stubCallback {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * 
     * @type {Integer}
     */
    style {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }
}
