#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ISCSI_UNIQUE_SESSION_ID.ahk

/**
 * ISCSI_TARGET_MAPPING.
 * @remarks
 * 
  * > [!NOTE]
  * > The iscsidsc.h header defines ISCSI_TARGET_MAPPING as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iscsidsc/ns-iscsidsc-iscsi_target_mappingw
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 * @charset Unicode
 */
class ISCSI_TARGET_MAPPINGW extends Win32Struct
{
    static sizeof => 1520

    static packingSize => 8

    /**
     * A string representing the name of the HBA initiator through which the target is accessed.
     * @type {String}
     */
    InitiatorName {
        get => StrGet(this.ptr + 0, 255, "UTF-16")
        set => StrPut(value, this.ptr + 0, 255, "UTF-16")
    }

    /**
     * A string representing the target name.
     * @type {String}
     */
    TargetName {
        get => StrGet(this.ptr + 512, 223, "UTF-16")
        set => StrPut(value, this.ptr + 512, 223, "UTF-16")
    }

    /**
     * A string representing the device name of the HBA initiator; for example '<b>\device\ScsiPort3</b>'.
     * @type {String}
     */
    OSDeviceName {
        get => StrGet(this.ptr + 960, 259, "UTF-16")
        set => StrPut(value, this.ptr + 960, 259, "UTF-16")
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/iscsidsc/ns-iscsidsc-iscsi_unique_session_id">ISCSI_UNIQUE_SESSION_ID</a> structure containing information that uniquely identifies the session..
     * @type {ISCSI_UNIQUE_SESSION_ID}
     */
    SessionId{
        get {
            if(!this.HasProp("__SessionId"))
                this.__SessionId := ISCSI_UNIQUE_SESSION_ID(1480, this)
            return this.__SessionId
        }
    }

    /**
     * The bus number used by the initiator as the local SCSI address of the target.
     * @type {Integer}
     */
    OSBusNumber {
        get => NumGet(this, 1496, "uint")
        set => NumPut("uint", value, this, 1496)
    }

    /**
     * The target number used by the initiator as the local SCSI address of the target.
     * @type {Integer}
     */
    OSTargetNumber {
        get => NumGet(this, 1500, "uint")
        set => NumPut("uint", value, this, 1500)
    }

    /**
     * The number of logical units (LUN) on the target.
     * @type {Integer}
     */
    LUNCount {
        get => NumGet(this, 1504, "uint")
        set => NumPut("uint", value, this, 1504)
    }

    /**
     * A list of SCSI_LUN_LIST structures that contain information about the LUNs associated with the target.
     * @type {Pointer<SCSI_LUN_LIST>}
     */
    LUNList {
        get => NumGet(this, 1512, "ptr")
        set => NumPut("ptr", value, this, 1512)
    }
}
