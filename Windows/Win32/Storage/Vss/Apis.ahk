#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class Vss {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static VSS_ASSOC_NO_MAX_SPACE => -1

    /**
     * @type {Integer (UInt32)}
     */
    static VSS_ASSOC_REMOVE => 0

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_BAD_STATE => -2147212543

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_UNEXPECTED => -2147212542

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_PROVIDER_ALREADY_REGISTERED => -2147212541

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_PROVIDER_NOT_REGISTERED => -2147212540

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_PROVIDER_VETO => -2147212538

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_PROVIDER_IN_USE => -2147212537

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_OBJECT_NOT_FOUND => -2147212536

    /**
     * @type {Integer (Int32)}
     */
    static VSS_S_ASYNC_PENDING => 271113

    /**
     * @type {Integer (Int32)}
     */
    static VSS_S_ASYNC_FINISHED => 271114

    /**
     * @type {Integer (Int32)}
     */
    static VSS_S_ASYNC_CANCELLED => 271115

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_VOLUME_NOT_SUPPORTED => -2147212532

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_VOLUME_NOT_SUPPORTED_BY_PROVIDER => -2147212530

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_OBJECT_ALREADY_EXISTS => -2147212531

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_UNEXPECTED_PROVIDER_ERROR => -2147212529

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_CORRUPT_XML_DOCUMENT => -2147212528

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_INVALID_XML_DOCUMENT => -2147212527

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_MAXIMUM_NUMBER_OF_VOLUMES_REACHED => -2147212526

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_FLUSH_WRITES_TIMEOUT => -2147212525

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_HOLD_WRITES_TIMEOUT => -2147212524

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_UNEXPECTED_WRITER_ERROR => -2147212523

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_SNAPSHOT_SET_IN_PROGRESS => -2147212522

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_MAXIMUM_NUMBER_OF_SNAPSHOTS_REACHED => -2147212521

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_WRITER_INFRASTRUCTURE => -2147212520

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_WRITER_NOT_RESPONDING => -2147212519

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_WRITER_ALREADY_SUBSCRIBED => -2147212518

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_UNSUPPORTED_CONTEXT => -2147212517

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_VOLUME_IN_USE => -2147212515

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_MAXIMUM_DIFFAREA_ASSOCIATIONS_REACHED => -2147212514

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_INSUFFICIENT_STORAGE => -2147212513

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_NO_SNAPSHOTS_IMPORTED => -2147212512

    /**
     * @type {Integer (Int32)}
     */
    static VSS_S_SOME_SNAPSHOTS_NOT_IMPORTED => 271137

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_SOME_SNAPSHOTS_NOT_IMPORTED => -2147212511

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_MAXIMUM_NUMBER_OF_REMOTE_MACHINES_REACHED => -2147212510

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_REMOTE_SERVER_UNAVAILABLE => -2147212509

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_REMOTE_SERVER_UNSUPPORTED => -2147212508

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_REVERT_IN_PROGRESS => -2147212507

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_REVERT_VOLUME_LOST => -2147212506

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_REBOOT_REQUIRED => -2147212505

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_TRANSACTION_FREEZE_TIMEOUT => -2147212504

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_TRANSACTION_THAW_TIMEOUT => -2147212503

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_VOLUME_NOT_LOCAL => -2147212499

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_CLUSTER_TIMEOUT => -2147212498

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_WRITERERROR_INCONSISTENTSNAPSHOT => -2147212304

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_WRITERERROR_OUTOFRESOURCES => -2147212303

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_WRITERERROR_TIMEOUT => -2147212302

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_WRITERERROR_RETRYABLE => -2147212301

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_WRITERERROR_NONRETRYABLE => -2147212300

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_WRITERERROR_RECOVERY_FAILED => -2147212299

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_BREAK_REVERT_ID_FAILED => -2147212298

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_LEGACY_PROVIDER => -2147212297

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_MISSING_DISK => -2147212296

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_MISSING_HIDDEN_VOLUME => -2147212295

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_MISSING_VOLUME => -2147212294

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_AUTORECOVERY_FAILED => -2147212293

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_DYNAMIC_DISK_ERROR => -2147212292

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_NONTRANSPORTABLE_BCD => -2147212291

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_CANNOT_REVERT_DISKID => -2147212290

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_RESYNC_IN_PROGRESS => -2147212289

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_CLUSTER_ERROR => -2147212288

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_UNSELECTED_VOLUME => -2147212502

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_SNAPSHOT_NOT_IN_SET => -2147212501

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_NESTED_VOLUME_LIMIT => -2147212500

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_NOT_SUPPORTED => -2147212497

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_WRITERERROR_PARTIAL_FAILURE => -2147212490

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_ASRERROR_DISK_ASSIGNMENT_FAILED => -2147212287

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_ASRERROR_DISK_RECREATION_FAILED => -2147212286

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_ASRERROR_NO_ARCPATH => -2147212285

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_ASRERROR_MISSING_DYNDISK => -2147212284

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_ASRERROR_SHARED_CRIDISK => -2147212283

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_ASRERROR_DATADISK_RDISK0 => -2147212282

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_ASRERROR_RDISK0_TOOSMALL => -2147212281

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_ASRERROR_CRITICAL_DISKS_TOO_SMALL => -2147212280

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_WRITER_STATUS_NOT_AVAILABLE => -2147212279

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_ASRERROR_DYNAMIC_VHD_NOT_SUPPORTED => -2147212278

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_CRITICAL_VOLUME_ON_INVALID_DISK => -2147212271

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_ASRERROR_RDISK_FOR_SYSTEM_DISK_NOT_FOUND => -2147212270

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_ASRERROR_NO_PHYSICAL_DISK_AVAILABLE => -2147212269

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_ASRERROR_FIXED_PHYSICAL_DISK_AVAILABLE_AFTER_DISK_EXCLUSION => -2147212268

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_ASRERROR_CRITICAL_DISK_CANNOT_BE_EXCLUDED => -2147212267

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_ASRERROR_SYSTEM_PARTITION_HIDDEN => -2147212266

    /**
     * @type {Integer (Int32)}
     */
    static VSS_E_FSS_TIMEOUT => -2147212265
;@endregion Constants

;@region Methods
    /**
     * Creates an IVssExpressWriter interface object and returns a pointer to it.
     * @param {Pointer<IVssExpressWriter>} ppWriter Doubly indirect pointer to the newly created <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nl-vswriter-ivssexpresswriter">IVssExpressWriter</a> object.
     * @returns {HRESULT} The return values listed here are in addition to the normal COM HRESULT values that may be returned at any time from the function.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Successfully returned a pointer to an 
     *         <a href="/windows/desktop/api/vswriter/nl-vswriter-ivssexpresswriter">IVssExpressWriter</a> interface.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The caller does not have sufficient privileges.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vswriter/nf-vswriter-createvssexpresswriterinternal
     * @since windows6.1
     */
    static CreateVssExpressWriterInternal(ppWriter) {
        result := DllCall("VSSAPI.dll\CreateVssExpressWriterInternal", "ptr*", ppWriter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
