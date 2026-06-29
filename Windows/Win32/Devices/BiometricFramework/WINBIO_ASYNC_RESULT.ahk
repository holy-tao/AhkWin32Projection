#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_COMPONENT.ahk" { WINBIO_COMPONENT }
#Import ".\WINBIO_UNIT_SCHEMA.ahk" { WINBIO_UNIT_SCHEMA }
#Import ".\WINBIO_BSP_SCHEMA.ahk" { WINBIO_BSP_SCHEMA }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\WINBIO_BIR.ahk" { WINBIO_BIR }
#Import ".\WINBIO_PROTECTION_POLICY.ahk" { WINBIO_PROTECTION_POLICY }
#Import ".\WINBIO_PRESENCE.ahk" { WINBIO_PRESENCE }
#Import ".\WINBIO_EXTENDED_UNIT_STATUS.ahk" { WINBIO_EXTENDED_UNIT_STATUS }
#Import ".\WINBIO_EVENT.ahk" { WINBIO_EVENT }
#Import ".\WINBIO_STORAGE_SCHEMA.ahk" { WINBIO_STORAGE_SCHEMA }
#Import ".\WINBIO_IDENTITY.ahk" { WINBIO_IDENTITY }

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
 */
export default struct WINBIO_ASYNC_RESULT {
    #StructPack 8


    struct _Parameters {

        struct _Verify {
            Match : BOOLEAN

            RejectDetail : UInt32

        }

        struct _Identify {
            Identity : WINBIO_IDENTITY

            SubFactor : Int8

            RejectDetail : UInt32

        }

        struct _EnrollBegin {
            SubFactor : Int8

        }

        struct _EnrollCapture {
            RejectDetail : UInt32

        }

        struct _EnrollCommit {
            Identity : WINBIO_IDENTITY

            IsNewTemplate : BOOLEAN

        }

        struct _EnumEnrollments {
            Identity : WINBIO_IDENTITY

            SubFactorCount : IntPtr

            SubFactorArray : IntPtr

        }

        struct _CaptureSample {
            Sample : WINBIO_BIR.Ptr

            SampleSize : IntPtr

            RejectDetail : UInt32

        }

        struct _DeleteTemplate {
            Identity : WINBIO_IDENTITY

            SubFactor : Int8

        }

        struct _GetProperty {
            PropertyType : UInt32

            PropertyId : UInt32

            Identity : WINBIO_IDENTITY

            SubFactor : Int8

            PropertyBufferSize : IntPtr

            PropertyBuffer : IntPtr

        }

        struct _SetProperty {
            PropertyType : UInt32

            PropertyId : UInt32

            Identity : WINBIO_IDENTITY

            SubFactor : Int8

            PropertyBufferSize : IntPtr

            PropertyBuffer : IntPtr

        }

        struct _GetEvent {
            Event : WINBIO_EVENT

        }

        struct _ControlUnit {
            Component : WINBIO_COMPONENT

            ControlCode : UInt32

            OperationStatus : UInt32

            SendBuffer : IntPtr

            SendBufferSize : IntPtr

            ReceiveBuffer : IntPtr

            ReceiveBufferSize : IntPtr

            ReceiveDataSize : IntPtr

        }

        struct _EnumServiceProviders {
            BspCount : IntPtr

            BspSchemaArray : WINBIO_BSP_SCHEMA.Ptr

        }

        struct _EnumBiometricUnits {
            UnitCount : IntPtr

            UnitSchemaArray : WINBIO_UNIT_SCHEMA.Ptr

        }

        struct _EnumDatabases {
            StorageCount : IntPtr

            StorageSchemaArray : WINBIO_STORAGE_SCHEMA.Ptr

        }

        struct _VerifyAndReleaseTicket {
            Match : BOOLEAN

            RejectDetail : UInt32

            Ticket : Int64

        }

        struct _IdentifyAndReleaseTicket {
            Identity : WINBIO_IDENTITY

            SubFactor : Int8

            RejectDetail : UInt32

            Ticket : Int64

        }

        struct _EnrollSelect {
            SelectorValue : Int64

        }

        struct _MonitorPresence {
            ChangeType : UInt32

            PresenceCount : IntPtr

            PresenceArray : WINBIO_PRESENCE.Ptr

        }

        struct _GetProtectionPolicy {
            Identity : WINBIO_IDENTITY

            Policy : WINBIO_PROTECTION_POLICY

        }

        struct _NotifyUnitStatusChange {
            ExtendedStatus : WINBIO_EXTENDED_UNIT_STATUS

        }

        Verify : WINBIO_ASYNC_RESULT._Parameters._Verify

        static __New() {
            DefineProp(this.Prototype, 'Identify', { type: WINBIO_ASYNC_RESULT._Parameters._Identify, offset: 0 })
            DefineProp(this.Prototype, 'EnrollBegin', { type: WINBIO_ASYNC_RESULT._Parameters._EnrollBegin, offset: 0 })
            DefineProp(this.Prototype, 'EnrollCapture', { type: WINBIO_ASYNC_RESULT._Parameters._EnrollCapture, offset: 0 })
            DefineProp(this.Prototype, 'EnrollCommit', { type: WINBIO_ASYNC_RESULT._Parameters._EnrollCommit, offset: 0 })
            DefineProp(this.Prototype, 'EnumEnrollments', { type: WINBIO_ASYNC_RESULT._Parameters._EnumEnrollments, offset: 0 })
            DefineProp(this.Prototype, 'CaptureSample', { type: WINBIO_ASYNC_RESULT._Parameters._CaptureSample, offset: 0 })
            DefineProp(this.Prototype, 'DeleteTemplate', { type: WINBIO_ASYNC_RESULT._Parameters._DeleteTemplate, offset: 0 })
            DefineProp(this.Prototype, 'GetProperty', { type: WINBIO_ASYNC_RESULT._Parameters._GetProperty, offset: 0 })
            DefineProp(this.Prototype, 'SetProperty', { type: WINBIO_ASYNC_RESULT._Parameters._SetProperty, offset: 0 })
            DefineProp(this.Prototype, 'GetEvent', { type: WINBIO_ASYNC_RESULT._Parameters._GetEvent, offset: 0 })
            DefineProp(this.Prototype, 'ControlUnit', { type: WINBIO_ASYNC_RESULT._Parameters._ControlUnit, offset: 0 })
            DefineProp(this.Prototype, 'EnumServiceProviders', { type: WINBIO_ASYNC_RESULT._Parameters._EnumServiceProviders, offset: 0 })
            DefineProp(this.Prototype, 'EnumBiometricUnits', { type: WINBIO_ASYNC_RESULT._Parameters._EnumBiometricUnits, offset: 0 })
            DefineProp(this.Prototype, 'EnumDatabases', { type: WINBIO_ASYNC_RESULT._Parameters._EnumDatabases, offset: 0 })
            DefineProp(this.Prototype, 'VerifyAndReleaseTicket', { type: WINBIO_ASYNC_RESULT._Parameters._VerifyAndReleaseTicket, offset: 0 })
            DefineProp(this.Prototype, 'IdentifyAndReleaseTicket', { type: WINBIO_ASYNC_RESULT._Parameters._IdentifyAndReleaseTicket, offset: 0 })
            DefineProp(this.Prototype, 'EnrollSelect', { type: WINBIO_ASYNC_RESULT._Parameters._EnrollSelect, offset: 0 })
            DefineProp(this.Prototype, 'MonitorPresence', { type: WINBIO_ASYNC_RESULT._Parameters._MonitorPresence, offset: 0 })
            DefineProp(this.Prototype, 'GetProtectionPolicy', { type: WINBIO_ASYNC_RESULT._Parameters._GetProtectionPolicy, offset: 0 })
            DefineProp(this.Prototype, 'NotifyUnitStatusChange', { type: WINBIO_ASYNC_RESULT._Parameters._NotifyUnitStatusChange, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Handle of an asynchronous session started by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopensession">WinBioAsyncOpenSession</a> function or the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbioasyncopenframework">WinBioAsyncOpenFramework</a> function.
     */
    SessionHandle : UInt32

    /**
     * Type of the asynchronous operation. For more information, see <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-operation-type-constants">WINBIO_OPERATION_TYPE Constants</a>.
     */
    Operation : UInt32

    /**
     * Sequence number of the asynchronous operation. The integers are assigned sequentially for each operation in a biometric session, starting at one (1). For any session, the open operation is always assigned the first sequence number and the close operation is assigned the last sequence number. If your application queues multiple operations, you can use sequence numbers to perform error handling. For example, you can ignore operation results until a specific sequence number is sent to the application.
     */
    SequenceNumber : Int64

    /**
     * System date and time at which the biometric operation began. For more information, see the <b>GetSystemTimeAsFileTime</b> function.
     */
    TimeStamp : Int64

    /**
     * Error code returned by the operation.
     */
    ApiStatus : HRESULT

    /**
     * The numeric unit identifier of the biometric unit that performed the operation.
     */
    UnitId : UInt32

    /**
     * Address of an optional buffer supplied by the caller. The buffer is not modified by the framework or the biometric unit. Your application can use the data to help it determine what actions to perform upon receipt of the completion notice or to maintain additional information about the requested operation.
     */
    UserData : IntPtr

    /**
     * Union that encloses nested structures that contain additional information about the success or failure of asynchronous operations begun by the client application.
     */
    Parameters : WINBIO_ASYNC_RESULT._Parameters

}
