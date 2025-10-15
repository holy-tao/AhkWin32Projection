#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ISCSI_UNIQUE_SESSION_ID.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * ISCSI_SESSION_INFO.
 * @remarks
 * 
  * > [!NOTE]
  * > The iscsidsc.h header defines ISCSI_SESSION_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iscsidsc/ns-iscsidsc-iscsi_session_infow
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 * @charset Unicode
 */
class ISCSI_SESSION_INFOW extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_unique_session_id">ISCSI_UNIQUE_SESSION_ID</a> structure containing a unique identifier that represents the session.
     * @type {ISCSI_UNIQUE_SESSION_ID}
     */
    SessionId{
        get {
            if(!this.HasProp("__SessionId"))
                this.__SessionId := ISCSI_UNIQUE_SESSION_ID(this.ptr + 0)
            return this.__SessionId
        }
    }

    /**
     * A string that represents the initiator name.
     * @type {PWSTR}
     */
    InitiatorName{
        get {
            if(!this.HasProp("__InitiatorName"))
                this.__InitiatorName := PWSTR(this.ptr + 16)
            return this.__InitiatorName
        }
    }

    /**
     * A string that represents the target node name.
     * @type {PWSTR}
     */
    TargetNodeName{
        get {
            if(!this.HasProp("__TargetNodeName"))
                this.__TargetNodeName := PWSTR(this.ptr + 24)
            return this.__TargetNodeName
        }
    }

    /**
     * A string that represents the target name.
     * @type {PWSTR}
     */
    TargetName{
        get {
            if(!this.HasProp("__TargetName"))
                this.__TargetName := PWSTR(this.ptr + 32)
            return this.__TargetName
        }
    }

    /**
     * The initiator-side identifier (ISID) used in the iSCSI protocol.
     * @type {Array<Byte>}
     */
    ISID{
        get {
            if(!this.HasProp("__ISIDProxyArray"))
                this.__ISIDProxyArray := Win32FixedArray(this.ptr + 40, 6, Primitive, "char")
            return this.__ISIDProxyArray
        }
    }

    /**
     * The target-side identifier (TSID) used in the iSCSI protocol.
     * @type {Array<Byte>}
     */
    TSID{
        get {
            if(!this.HasProp("__TSIDProxyArray"))
                this.__TSIDProxyArray := Win32FixedArray(this.ptr + 46, 2, Primitive, "char")
            return this.__TSIDProxyArray
        }
    }

    /**
     * The number of connections associated with the session.
     * @type {Integer}
     */
    ConnectionCount {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_connection_infoa">ISCSI_CONNECTION_INFO</a> structure.
     * @type {Pointer<ISCSI_CONNECTION_INFOW>}
     */
    Connections {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
