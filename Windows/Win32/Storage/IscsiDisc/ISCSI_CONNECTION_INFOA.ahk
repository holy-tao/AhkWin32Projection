#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ISCSI_UNIQUE_SESSION_ID.ahk

/**
 * ISCSI_CONNECTION_INFO structure contains information about a connection. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The iscsidsc.h header defines ISCSI_CONNECTION_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/iscsidsc/ns-iscsidsc-iscsi_connection_infoa
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 * @charset ANSI
 */
class ISCSI_CONNECTION_INFOA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A ISCSI_UNIQUE_CONNECTION_ID structure that contains the unique identifier for a connection. The LoginIScsiTarget and AddIScsiConnection functions return this value via the UniqueConnectionId parameter.
     * @type {ISCSI_UNIQUE_SESSION_ID}
     */
    ConnectionId{
        get {
            if(!this.HasProp("__ConnectionId"))
                this.__ConnectionId := ISCSI_UNIQUE_SESSION_ID(this.ptr + 0)
            return this.__ConnectionId
        }
    }

    /**
     * A string that represents the IP address of the initiator.
     * @type {Pointer<Byte>}
     */
    InitiatorAddress {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A string that represents the IP address of the target.
     * @type {Pointer<Byte>}
     */
    TargetAddress {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The socket number on the initiator that establishes the connection.
     * @type {Integer}
     */
    InitiatorSocket {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * The socket number on the target that establishes the connection.
     * @type {Integer}
     */
    TargetSocket {
        get => NumGet(this, 34, "ushort")
        set => NumPut("ushort", value, this, 34)
    }

    /**
     * The connection identifier for the connection.
     * @type {Array<Byte>}
     */
    CID{
        get {
            if(!this.HasProp("__CIDProxyArray"))
                this.__CIDProxyArray := Win32FixedArray(this.ptr + 36, 2, Primitive, "char")
            return this.__CIDProxyArray
        }
    }
}
