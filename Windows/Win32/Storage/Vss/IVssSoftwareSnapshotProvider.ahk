#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Contains the methods used by VSS to manage shadow copy volumes. All software providers must support this interface.
 * @see https://docs.microsoft.com/windows/win32/api//vsprov/nn-vsprov-ivsssoftwaresnapshotprovider
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class IVssSoftwareSnapshotProvider extends IUnknown{
    /**
     * The interface identifier for IVssSoftwareSnapshotProvider
     * @type {Guid}
     */
    static IID => Guid("{609e123e-2c5a-44d3-8f01-0b1d9a47d1ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} lContext 
     * @returns {HRESULT} 
     */
    SetContext(lContext) {
        result := ComCall(3, this, "int", lContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} SnapshotId 
     * @param {Pointer<VSS_SNAPSHOT_PROP>} pProp 
     * @returns {HRESULT} 
     */
    GetSnapshotProperties(SnapshotId, pProp) {
        result := ComCall(4, this, "ptr", SnapshotId, "ptr", pProp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} QueriedObjectId 
     * @param {Integer} eQueriedObjectType 
     * @param {Integer} eReturnedObjectsType 
     * @param {Pointer<IVssEnumObject>} ppEnum 
     * @returns {HRESULT} 
     */
    Query(QueriedObjectId, eQueriedObjectType, eReturnedObjectsType, ppEnum) {
        result := ComCall(5, this, "ptr", QueriedObjectId, "int", eQueriedObjectType, "int", eReturnedObjectsType, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} SourceObjectId 
     * @param {Integer} eSourceObjectType 
     * @param {BOOL} bForceDelete 
     * @param {Pointer<Int32>} plDeletedSnapshots 
     * @param {Pointer<Guid>} pNondeletedSnapshotID 
     * @returns {HRESULT} 
     */
    DeleteSnapshots(SourceObjectId, eSourceObjectType, bForceDelete, plDeletedSnapshots, pNondeletedSnapshotID) {
        result := ComCall(6, this, "ptr", SourceObjectId, "int", eSourceObjectType, "int", bForceDelete, "int*", plDeletedSnapshots, "ptr", pNondeletedSnapshotID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} SnapshotSetId 
     * @param {Pointer<Guid>} SnapshotId 
     * @param {Pointer<UInt16>} pwszVolumeName 
     * @param {Integer} lNewContext 
     * @returns {HRESULT} 
     */
    BeginPrepareSnapshot(SnapshotSetId, SnapshotId, pwszVolumeName, lNewContext) {
        result := ComCall(7, this, "ptr", SnapshotSetId, "ptr", SnapshotId, "ushort*", pwszVolumeName, "int", lNewContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwszVolumeName 
     * @param {Pointer<BOOL>} pbSupportedByThisProvider 
     * @returns {HRESULT} 
     */
    IsVolumeSupported(pwszVolumeName, pbSupportedByThisProvider) {
        result := ComCall(8, this, "ushort*", pwszVolumeName, "ptr", pbSupportedByThisProvider, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The IsVolumeSnapshotted function determines whether any shadow copies exist for the specified volume.
     * @param {Pointer<UInt16>} pwszVolumeName Name of the volume. The name of the volume to be checked must be in one of the following formats and must include a trailing backslash (\\):
     * 
     * <ul>
     * <li>The path of a mounted folder, for example, Y:\MountX\</li>
     * <li>A drive letter, for example, 
     *         D:\</li>
     * <li>A volume GUID path of the form \\?&#92;<i>Volume</i>{<i>GUID</i>}\ (where <i>GUID</i> identifies the volume)</li>
     * </ul>
     * @param {Pointer<BOOL>} pbSnapshotsPresent The value of this parameter is <b>TRUE</b> if the volume has a shadow copy, and 
     *       <b>FALSE</b> if the volume does not have a shadow copy.
     * @param {Pointer<Int32>} plSnapshotCompatibility 
     * @returns {HRESULT} The return values listed here are in addition to the normal COM <b>HRESULT</b>s that may be returned at any time 
     *        from the function.
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
     * The function completed successfully.
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
     * The caller does not have sufficient backup privileges or is not an administrator.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Out of memory or other system resources.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_PROVIDER_VETO</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Expected provider error. The provider logged the error in the event log. For more information, see 
     *         <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_OBJECT_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified volume was not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected error. The error code is logged in the error log file. For more information, see 
     *         <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not supported until Windows Server 2008 R2 and Windows 7. <b>E_UNEXPECTED</b> is used instead.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VSS_E_UNEXPECTED_PROVIDER_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unexpected provider error. The error code is logged in the event log file. For additional information, 
     *         see 
     *         <a href="/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//vsbackup/nf-vsbackup-isvolumesnapshotted
     */
    IsVolumeSnapshotted(pwszVolumeName, pbSnapshotsPresent, plSnapshotCompatibility) {
        result := ComCall(9, this, "ushort*", pwszVolumeName, "ptr", pbSnapshotsPresent, "int*", plSnapshotCompatibility, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} SnapshotId 
     * @param {Integer} eSnapshotPropertyId 
     * @param {VARIANT} vProperty 
     * @returns {HRESULT} 
     */
    SetSnapshotProperty(SnapshotId, eSnapshotPropertyId, vProperty) {
        result := ComCall(10, this, "ptr", SnapshotId, "int", eSnapshotPropertyId, "ptr", vProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} SnapshotId 
     * @returns {HRESULT} 
     */
    RevertToSnapshot(SnapshotId) {
        result := ComCall(11, this, "ptr", SnapshotId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwszVolume 
     * @param {Pointer<IVssAsync>} ppAsync 
     * @returns {HRESULT} 
     */
    QueryRevertStatus(pwszVolume, ppAsync) {
        result := ComCall(12, this, "ushort*", pwszVolume, "ptr", ppAsync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
