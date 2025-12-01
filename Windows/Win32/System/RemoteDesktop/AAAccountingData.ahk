#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * This structure contains information about a connection event.
 * @see https://learn.microsoft.com/windows/win32/api/tsgpolicyengine/ns-tsgpolicyengine-aaaccountingdata
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class AAAccountingData extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * The user name.
     * @type {BSTR}
     */
    userName{
        get {
            if(!this.HasProp("__userName"))
                this.__userName := BSTR(0, this)
            return this.__userName
        }
    }

    /**
     * The name of the client computer.
     * @type {BSTR}
     */
    clientName{
        get {
            if(!this.HasProp("__clientName"))
                this.__clientName := BSTR(8, this)
            return this.__clientName
        }
    }

    /**
     * A value of the <a href="https://docs.microsoft.com/windows/win32/api/tsgpolicyengine/ne-tsgpolicyengine-aaauthschemes">AAAuthSchemes</a> enumeration type that specifies the type of authentication used to connect to RD Gateway.
     * @type {Integer}
     */
    authType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The name of the remote computer.
     * @type {BSTR}
     */
    resourceName{
        get {
            if(!this.HasProp("__resourceName"))
                this.__resourceName := BSTR(24, this)
            return this.__resourceName
        }
    }

    /**
     * The port number of the remote computer used by the connection.
     * @type {Integer}
     */
    portNumber {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * The name of the protocol used by the connection.
     * @type {BSTR}
     */
    protocolName{
        get {
            if(!this.HasProp("__protocolName"))
                this.__protocolName := BSTR(40, this)
            return this.__protocolName
        }
    }

    /**
     * The number of bytes sent from the client to the remote computer.
     * @type {Integer}
     */
    numberOfBytesReceived {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * The number of bytes sent from the remote computer to the client.
     * @type {Integer}
     */
    numberOfBytesTransfered {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * The reason the connection was disconnected.
     * @type {BSTR}
     */
    reasonForDisconnect{
        get {
            if(!this.HasProp("__reasonForDisconnect"))
                this.__reasonForDisconnect := BSTR(56, this)
            return this.__reasonForDisconnect
        }
    }

    /**
     * A unique identifier assigned to the connection  by RD Gateway.
     * @type {Pointer<Guid>}
     */
    mainSessionId {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A unique identifier assigned to the subsession by RD Gateway.
     * @type {Integer}
     */
    subSessionId {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }
}
