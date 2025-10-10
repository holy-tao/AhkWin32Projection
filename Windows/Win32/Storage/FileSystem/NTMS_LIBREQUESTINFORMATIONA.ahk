#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * The NTMS_LIBREQUESTINFORMATION structure defines the properties specific to a work request, which are queued to RSM.
 * @remarks
 * 
  * The 
  * <b>NTMS_LIBREQUESTINFORMATION</b> structure is included in the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/ntmsapi/ns-ntmsapi-ntms_objectinformationa">NTMS_OBJECTINFORMATION</a> structure.
  * 
  * GUID in the work times may become not valid over time. For example, an eject of a free medium deletes the PMID after the media is ejected. However the work item is not updated upon completion of the eject.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The ntmsapi.h header defines NTMS_LIBREQUESTINFORMATION as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ntmsapi/ns-ntmsapi-ntms_librequestinformationa
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 * @charset ANSI
 */
class NTMS_LIBREQUESTINFORMATIONA extends Win32Struct
{
    static sizeof => 304

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    OperationCode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Work item options (command specific).
     * @type {Integer}
     */
    OperationOption {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    State {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Unique identifier of a side being serviced.
     * @type {Pointer<Guid>}
     */
    PartitionId {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Unique identifier of a drive being serviced.
     * @type {Pointer<Guid>}
     */
    DriveId {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Unique identifier of a piece of physical media being serviced.
     * @type {Pointer<Guid>}
     */
    PhysMediaId {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Library for this request.
     * @type {Pointer<Guid>}
     */
    Library {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Unique identifier of a slot of the piece of physical media being serviced.
     * @type {Pointer<Guid>}
     */
    SlotId {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * System time that this request was queued to RSM.
     * @type {SYSTEMTIME}
     */
    TimeQueued{
        get {
            if(!this.HasProp("__TimeQueued"))
                this.__TimeQueued := SYSTEMTIME(this.ptr + 56)
            return this.__TimeQueued
        }
    }

    /**
     * System time that this request was completed by RSM.
     * @type {SYSTEMTIME}
     */
    TimeCompleted{
        get {
            if(!this.HasProp("__TimeCompleted"))
                this.__TimeCompleted := SYSTEMTIME(this.ptr + 72)
            return this.__TimeCompleted
        }
    }

    /**
     * Application that submitted the operator request.
     * @type {String}
     */
    szApplication {
        get => StrGet(this.ptr + 88, 63, "UTF-8")
        set => StrPut(value, this.ptr + 88, 63, "UTF-8")
    }

    /**
     * Interactive user logged on to the computer that submitted the operator request.
     * @type {String}
     */
    szUser {
        get => StrGet(this.ptr + 152, 63, "UTF-8")
        set => StrPut(value, this.ptr + 152, 63, "UTF-8")
    }

    /**
     * Computer that submitted the operator request.
     * @type {String}
     */
    szComputer {
        get => StrGet(this.ptr + 216, 63, "UTF-8")
        set => StrPut(value, this.ptr + 216, 63, "UTF-8")
    }

    /**
     * Error return for requests that return with state NTMS_LM_FAILED. This is a 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @type {Integer}
     */
    dwErrorCode {
        get => NumGet(this, 280, "uint")
        set => NumPut("uint", value, this, 280)
    }

    /**
     * Associated work item ID for this request. This is currently used to contain the work item ID to be canceled on an NTMS_LM_REMOVE request.
     * @type {Pointer<Guid>}
     */
    WorkItemId {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * Priority of the work item.
     * @type {Integer}
     */
    dwPriority {
        get => NumGet(this, 296, "uint")
        set => NumPut("uint", value, this, 296)
    }
}
