#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\AAAuthSchemes.ahk" { AAAuthSchemes }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * This structure contains information about a connection event.
 * @see https://learn.microsoft.com/windows/win32/api/tsgpolicyengine/ns-tsgpolicyengine-aaaccountingdata
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct AAAccountingData {
    #StructPack 8

    /**
     * The user name.
     */
    userName : BSTR

    /**
     * The name of the client computer.
     */
    clientName : BSTR

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/win32/api/tsgpolicyengine/ne-tsgpolicyengine-aaauthschemes">AAAuthSchemes</a> enumeration type that specifies the type of authentication used to connect to RD Gateway.
     */
    authType : AAAuthSchemes

    /**
     * The name of the remote computer.
     */
    resourceName : BSTR

    /**
     * The port number of the remote computer used by the connection.
     */
    portNumber : Int32

    /**
     * The name of the protocol used by the connection.
     */
    protocolName : BSTR

    /**
     * The number of bytes sent from the client to the remote computer.
     */
    numberOfBytesReceived : Int32

    /**
     * The number of bytes sent from the remote computer to the client.
     */
    numberOfBytesTransfered : Int32

    /**
     * The reason the connection was disconnected.
     */
    reasonForDisconnect : BSTR

    /**
     * A unique identifier assigned to the connection  by RD Gateway.
     */
    mainSessionId : Guid

    /**
     * A unique identifier assigned to the subsession by RD Gateway.
     */
    subSessionId : Int32

}
