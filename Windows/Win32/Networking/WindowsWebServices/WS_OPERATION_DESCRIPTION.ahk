#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_MESSAGE_DESCRIPTION.ahk" { WS_MESSAGE_DESCRIPTION }
#Import ".\WS_OPERATION_STYLE.ahk" { WS_OPERATION_STYLE }
#Import ".\WS_PARAMETER_DESCRIPTION.ahk" { WS_PARAMETER_DESCRIPTION }

/**
 * Metadata for the service operation.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_operation_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_OPERATION_DESCRIPTION {
    #StructPack 8

    /**
     * Defines the version information. Currently value is 1.
     */
    versionInfo : UInt32

    /**
     * The description of incoming <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> for a given service operation.
     */
    inputMessageDescription : WS_MESSAGE_DESCRIPTION.Ptr

    /**
     * The description of outgoing <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a> for a given service operation. For one way operations this should be <b>NULL</b>.
     */
    outputMessageDescription : WS_MESSAGE_DESCRIPTION.Ptr

    /**
     * Provides additional flags for the in message of the operation. See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_charset">WS_SERVICE_OPERATION_MESSAGE_OPTION</a> for
     *                     a list of flags. If no flags are needed, this may be 0.
     *                 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_charset">WS_SERVICE_OPERATION_MESSAGE_NILLABLE_ELEMENT</a> is not applicable to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_operation_style">WS_RPC_LITERAL_OPERATION</a> style
     *                     operations. The input parameter must be with type of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_parameter_type">WS_PARAMETER_TYPE_MESSAGES</a>.
     */
    inputMessageOptions : UInt32

    /**
     * Provides additional flags for the out message of the operation. See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_charset">WS_SERVICE_OPERATION_MESSAGE_OPTION</a> for
     *                     a list of flags. If out message is not available, or no flags are needed, this may be 0.
     *                 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_charset">WS_SERVICE_OPERATION_MESSAGE_NILLABLE_ELEMENT</a> is not applicable to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_operation_style">WS_RPC_LITERAL_OPERATION</a> style
     *                     operations. The output parameter must be with type of <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_parameter_type">WS_PARAMETER_TYPE_MESSAGES</a>.
     */
    outputMessageOptions : UInt32

    /**
     * The number of  parameters on the given service operation.
     */
    parameterCount : UInt16

    /**
     * An array defining the individual parameters.
     */
    parameterDescription : WS_PARAMETER_DESCRIPTION.Ptr

    /**
     * A pointer to the stub function for the given operation to which the service model will delegate 
     *                     to do the service operation call. This will be <b>NULL</b> for proxies.
     */
    stubCallback : IntPtr

    style : WS_OPERATION_STYLE

}
