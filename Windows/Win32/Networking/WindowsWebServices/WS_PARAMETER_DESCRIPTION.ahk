#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_PARAMETER_TYPE.ahk" { WS_PARAMETER_TYPE }

/**
 * The index of the parameters in the incoming/outgoing messages field descriptions.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_parameter_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_PARAMETER_DESCRIPTION {
    #StructPack 4

    /**
     * The type of the parameter.
     */
    parameterType : WS_PARAMETER_TYPE

    /**
     * A value between 0 and MAX_SHORT - 1 that represents the index of the field 
     *                     in the input <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a>. It is MAX_USHORT if it has not present in the input
     *                     WS_MESSAGE.
     */
    inputMessageIndex : UInt16

    /**
     * A value between 0 and MAX_SHORT - 1 that represents the index of the field 
     *                     in the output <a href="https://docs.microsoft.com/windows/desktop/wsw/ws-message">WS_MESSAGE</a>. It is MAX_USHORT if it has not present in the output
     *                     WS_MESSAGE.
     */
    outputMessageIndex : UInt16

}
