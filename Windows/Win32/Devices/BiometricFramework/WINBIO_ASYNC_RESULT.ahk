#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINBIO_IDENTITY.ahk
#Include .\WINBIO_EVENT.ahk
#Include .\WINBIO_PROTECTION_POLICY.ahk
#Include .\WINBIO_EXTENDED_UNIT_STATUS.ahk

/**
 * Contains the results of an asynchronous operation.
 * @remarks
 * Asynchronous operations are begun by opening a biometric session  or a framework session. Call <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a> to open a biometric session. Call <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopenframework">WinBioAsyncOpenFramework</a> to open a framework session.
  * 
  * You can use an asynchronous biometric session handle to call any of the following operations asynchronously:<ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiocancel">WinBioCancel</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiocapturesample">WinBioCaptureSample</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioclosesession">WinBioCloseSession</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiocontrolunit">WinBioControlUnit</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiocontrolunitprivileged">WinBioControlUnitPrivileged</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiodeletetemplate">WinBioDeleteTemplate</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioenrollbegin">WinBioEnrollBegin</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioenrollcapture">WinBioEnrollCapture</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioenrollcommit">WinBioEnrollCommit</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioenrolldiscard">WinBioEnrollDiscard</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioenumenrollments">WinBioEnumEnrollments</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiogetproperty">WinBioGetProperty</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioidentify">WinBioIdentify</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiolocatesensor">WinBioLocateSensor</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiolockunit">WinBioLockUnit</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiologonidentifieduser">WinBioLogonIdentifiedUser</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioregistereventmonitor">WinBioRegisterEventMonitor</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiounlockunit">WinBioUnlockUnit</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiounregistereventmonitor">WinBioUnregisterEventMonitor</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioverify">WinBioVerify</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiowait">WinBioWait</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiosetproperty">WinBioSetProperty</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioenrollselect">WinBioEnrollSelect</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiomonitorpresence">WinBioMonitorPresence</a>
  * </li>
  * </ul>
  * 
  * 
  * You can use an asynchronous framework handle to call the following operations asynchronously:<ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncenumbiometricunits">WinBioAsyncEnumBiometricUnits</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncenumdatabases">WinBioAsyncEnumDatabases</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopenframework">WinBioAsyncOpenFramework</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncenumserviceproviders">WinBioAsyncEnumServiceProviders</a>
  * </li>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncmonitorframeworkchanges">WinBioAsyncMonitorFrameworkChanges</a>
  * </li>
  * </ul>
  * 
  * 
  * The <b>WINBIO_ASYNC_RESULT</b> structure is allocated internally by the Windows Biometric Framework. Therefore, when you are through using it, call <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiofree">WinBioFree</a> to release the allocated memory and avoid leaks. Because this also releases all nested data structures, you should not keep a copy of any pointers returned in the <b>WINBIO_ASYNC_RESULT</b> structure. If you want to save any data returned in a nested structure, make a private copy of that data before calling <b>WinBioFree</b>.
  * 
  * <b>Windows 8, Windows Server 2012, Windows 8.1 and Windows Server 2012 R2:  </b>The Windows Biometric Framework supports only fingerprint readers. Therefore, if an operation fails and returns additional information in a <b>WINBIO_REJECT_DETAIL</b> constant, it will be one of the following values:<ul>
  * <li>WINBIO_FP_TOO_HIGH</li>
  * <li>WINBIO_FP_TOO_LOW</li>
  * <li>WINBIO_FP_TOO_LEFT</li>
  * <li>WINBIO_FP_TOO_RIGHT</li>
  * <li>WINBIO_FP_TOO_FAST</li>
  * <li>WINBIO_FP_TOO_SLOW</li>
  * <li>WINBIO_FP_POOR_QUALITY</li>
  * <li>WINBIO_FP_TOO_SKEWED</li>
  * <li>WINBIO_FP_TOO_SHORT</li>
  * <li>WINBIO_FP_MERGE_FAILURE</li>
  * </ul>
  * 
  * 
  * Further, if an operation uses a <b>WINBIO_BIOMETRIC_SUBTYPE</b> data type, it will be one of the following values:<ul>
  * <li>WINBIO_ANSI_381_POS_UNKNOWN</li>
  * <li>WINBIO_ANSI_381_POS_RH_THUMB</li>
  * <li>WINBIO_ANSI_381_POS_RH_INDEX_FINGER</li>
  * <li>WINBIO_ANSI_381_POS_RH_MIDDLE_FINGER</li>
  * <li>WINBIO_ANSI_381_POS_RH_RING_FINGER</li>
  * <li>WINBIO_ANSI_381_POS_RH_LITTLE_FINGER</li>
  * <li>WINBIO_ANSI_381_POS_LH_THUMB</li>
  * <li>WINBIO_ANSI_381_POS_LH_INDEX_FINGER</li>
  * <li>WINBIO_ANSI_381_POS_LH_MIDDLE_FINGER</li>
  * <li>WINBIO_ANSI_381_POS_LH_RING_FINGER</li>
  * <li>WINBIO_ANSI_381_POS_LH_LITTLE_FINGER</li>
  * <li>WINBIO_ANSI_381_POS_RH_FOUR_FINGERS</li>
  * <li>WINBIO_ANSI_381_POS_LH_FOUR_FINGERS</li>
  * <li>WINBIO_ANSI_381_POS_TWO_THUMBS</li>
  * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/winbio/ns-winbio-winbio_async_result
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_ASYNC_RESULT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Handle of an asynchronous session started by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a> function or the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopenframework">WinBioAsyncOpenFramework</a> function.
     * @type {Integer}
     */
    SessionHandle {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type of the asynchronous operation. For more information, see <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-operation-type-constants">WINBIO_OPERATION_TYPE Constants</a>.
     * @type {Integer}
     */
    Operation {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Sequence number of the asynchronous operation. The integers are assigned sequentially for each operation in a biometric session, starting at one (1). For any session, the open operation is always assigned the first sequence number and the close operation is assigned the last sequence number. If your application queues multiple operations, you can use sequence numbers to perform error handling. For example, you can ignore operation results until a specific sequence number is sent to the application.
     * @type {Integer}
     */
    SequenceNumber {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * System date and time at which the biometric operation began. For more information, see the <b>GetSystemTimeAsFileTime</b> function.
     * @type {Integer}
     */
    TimeStamp {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Error code returned by the operation.
     * @type {HRESULT}
     */
    ApiStatus {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * The numeric unit identifier of the biometric unit that performed the operation.
     * @type {Integer}
     */
    UnitId {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Address of an optional buffer supplied by the caller. The buffer is not modified by the framework or the biometric unit. Your application can use the data to help it determine what actions to perform upon receipt of the completion notice or to maintain additional information about the requested operation.
     * @type {Pointer<Void>}
     */
    UserData {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Match {
        get => NumGet(this, 40, "char")
        set => NumPut("char", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    RejectDetail {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {WINBIO_IDENTITY}
     */
    Identity{
        get {
            if(!this.HasProp("__Identity"))
                this.__Identity := WINBIO_IDENTITY(this.ptr + 40)
            return this.__Identity
        }
    }

    /**
     * @type {Integer}
     */
    SubFactor {
        get => NumGet(this, 48, "char")
        set => NumPut("char", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    RejectDetail1 {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    EnrollBegin {
        get => NumGet(this, 40, "char")
        set => NumPut("char", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    EnrollCapture {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    IsNewTemplate {
        get => NumGet(this, 48, "char")
        set => NumPut("char", value, this, 48)
    }

    /**
     * @type {Pointer}
     */
    SubFactorCount {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Byte>}
     */
    SubFactorArray {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<WINBIO_BIR>}
     */
    Sample {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer}
     */
    SampleSize {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    RejectDetail12 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    PropertyType {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    PropertyId {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {WINBIO_IDENTITY}
     */
    Identity1{
        get {
            if(!this.HasProp("__Identity1"))
                this.__Identity1 := WINBIO_IDENTITY(this.ptr + 48)
            return this.__Identity1
        }
    }

    /**
     * @type {Integer}
     */
    SubFactor1 {
        get => NumGet(this, 56, "char")
        set => NumPut("char", value, this, 56)
    }

    /**
     * @type {Pointer}
     */
    PropertyBufferSize {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<Void>}
     */
    PropertyBuffer {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {WINBIO_IDENTITY}
     */
    Identity12{
        get {
            if(!this.HasProp("__Identity12"))
                this.__Identity12 := WINBIO_IDENTITY(this.ptr + 48)
            return this.__Identity12
        }
    }

    /**
     * @type {Integer}
     */
    SubFactor12 {
        get => NumGet(this, 56, "char")
        set => NumPut("char", value, this, 56)
    }

    /**
     * @type {WINBIO_EVENT}
     */
    Event{
        get {
            if(!this.HasProp("__Event"))
                this.__Event := WINBIO_EVENT(this.ptr + 40)
            return this.__Event
        }
    }

    /**
     * @type {Integer}
     */
    Component {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ControlCode {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    OperationStatus {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Pointer<Byte>}
     */
    SendBuffer {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer}
     */
    SendBufferSize {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<Byte>}
     */
    ReceiveBuffer {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer}
     */
    ReceiveBufferSize {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer}
     */
    ReceiveDataSize {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer}
     */
    BspCount {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<WINBIO_BSP_SCHEMA>}
     */
    BspSchemaArray {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer}
     */
    UnitCount {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<WINBIO_UNIT_SCHEMA>}
     */
    UnitSchemaArray {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer}
     */
    StorageCount {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<WINBIO_STORAGE_SCHEMA>}
     */
    StorageSchemaArray {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    Ticket {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    RejectDetail123 {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    Ticket1 {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    EnrollSelect {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    ChangeType {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer}
     */
    PresenceCount {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<WINBIO_PRESENCE>}
     */
    PresenceArray {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {WINBIO_PROTECTION_POLICY}
     */
    Policy{
        get {
            if(!this.HasProp("__Policy"))
                this.__Policy := WINBIO_PROTECTION_POLICY(this.ptr + 48)
            return this.__Policy
        }
    }

    /**
     * @type {WINBIO_EXTENDED_UNIT_STATUS}
     */
    ExtendedStatus{
        get {
            if(!this.HasProp("__ExtendedStatus"))
                this.__ExtendedStatus := WINBIO_EXTENDED_UNIT_STATUS(this.ptr + 40)
            return this.__ExtendedStatus
        }
    }
}
