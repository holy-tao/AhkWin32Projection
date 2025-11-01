#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 * @charset ANSI
 */
class RPC_CALL_ATTRIBUTES_V3_A extends Win32Struct
{
    static sizeof => 120

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ServerPrincipalNameBufferLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<Integer>}
     */
    ServerPrincipalName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ClientPrincipalNameBufferLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<Integer>}
     */
    ClientPrincipalName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    AuthenticationLevel {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    AuthenticationService {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {BOOL}
     */
    NullSession {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {BOOL}
     */
    KernelModeCaller {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    ProtocolSequence {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    IsClientLocal {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {HANDLE}
     */
    ClientPID{
        get {
            if(!this.HasProp("__ClientPID"))
                this.__ClientPID := HANDLE(64, this)
            return this.__ClientPID
        }
    }

    /**
     * @type {Integer}
     */
    CallStatus {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    CallType {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * @type {Pointer<RPC_CALL_LOCAL_ADDRESS_V1>}
     */
    CallLocalAddress {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    OpNum {
        get => NumGet(this, 88, "ushort")
        set => NumPut("ushort", value, this, 88)
    }

    /**
     * @type {Pointer<Guid>}
     */
    InterfaceUuid {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    ClientIdentifierBufferLength {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Pointer<Integer>}
     */
    ClientIdentifier {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }
}
