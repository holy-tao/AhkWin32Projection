#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\StructuredStorage\IPropertyStorage.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDiscRecorder interface enables access to a single disc recorder device, labeled the active disc recorder. An IMAPI object such as MSDiscMasterObj maintains an active disc recorder.
 * @remarks
 * 
 * All 
 * <b>IDiscRecorder</b> interfaces may be used on an 
 * <b>IDiscRecorder</b> object even if the disc recorder is not the active disc recorder. The IMAPI client does not have to call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmaster-setactivediscrecorder">IDiscMaster::SetActiveDiscRecorder</a> first.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi/nn-imapi-idiscrecorder
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IDiscRecorder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDiscRecorder
     * @type {Guid}
     */
    static IID => Guid("{85ac9776-ca88-4cf2-894e-09598c078a41}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Init", "GetRecorderGUID", "GetRecorderType", "GetDisplayNames", "GetBasePnPID", "GetPath", "GetRecorderProperties", "SetRecorderProperties", "GetRecorderState", "OpenExclusive", "QueryMediaType", "QueryMediaInfo", "Eject", "Erase", "Close"]

    /**
     * 
     * @param {Pointer<Integer>} pbyUniqueID 
     * @param {Integer} nulIDSize 
     * @param {Integer} nulDriveNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nn-imapi-idiscrecorder
     */
    Init(pbyUniqueID, nulIDSize, nulDriveNumber) {
        pbyUniqueIDMarshal := pbyUniqueID is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pbyUniqueIDMarshal, pbyUniqueID, "uint", nulIDSize, "uint", nulDriveNumber, "HRESULT")
        return result
    }

    /**
     * Retrieves the GUID of the physical disc recorder currently associated with the recorder object.
     * @param {Pointer<Integer>} pbyUniqueID Pointer to a GUID buffer to be filled in with this recorder's current GUID information. To query the required buffer size, use <b>NULL</b>.
     * @param {Integer} ulBufferSize Size of the GUID buffer. If <i>pbyUniqueID</i> is <b>NULL</b>, this parameter must be zero.
     * @returns {Integer} Size of the GUID information.
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscrecorder-getrecorderguid
     */
    GetRecorderGUID(pbyUniqueID, ulBufferSize) {
        pbyUniqueIDMarshal := pbyUniqueID is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pbyUniqueIDMarshal, pbyUniqueID, "uint", ulBufferSize, "uint*", &pulReturnSizeRequired := 0, "HRESULT")
        return pulReturnSizeRequired
    }

    /**
     * Determines whether the disc recorder is a CD-R or CD-RW type device. This does not indicate the type of media that is currently inserted in the device.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscrecorder-getrecordertype
     */
    GetRecorderType() {
        result := ComCall(5, this, "int*", &fTypeCode := 0, "HRESULT")
        return fTypeCode
    }

    /**
     * Retrieves a formatted name for the recorder that can be displayed. The name consists of the manufacturer and product identifier of the device.
     * @param {Pointer<BSTR>} pbstrVendorID Vendor of the disc recorder. This parameter can be <b>NULL</b>.
     * @param {Pointer<BSTR>} pbstrProductID Product name of the disc recorder. This parameter can be <b>NULL</b>.
     * @param {Pointer<BSTR>} pbstrRevision Revision of the disc recorder. This is typically the revision of the recorder firmware, but it can be a revision for the entire device. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscrecorder-getdisplaynames
     */
    GetDisplayNames(pbstrVendorID, pbstrProductID, pbstrRevision) {
        result := ComCall(6, this, "ptr", pbstrVendorID, "ptr", pbstrProductID, "ptr", pbstrRevision, "HRESULT")
        return result
    }

    /**
     * Retrieves a base PnP string that can be used to consistently identify a specific class of device by make and model. The string can be used by applications to customize their behavior according to the specific recorder type.
     * @returns {BSTR} Base PnP ID string. The string is a concatenation of a recorder's manufacturer, product ID, and revision information (if available).
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscrecorder-getbasepnpid
     */
    GetBasePnPID() {
        pbstrBasePnPID := BSTR()
        result := ComCall(7, this, "ptr", pbstrBasePnPID, "HRESULT")
        return pbstrBasePnPID
    }

    /**
     * Retrieves a path to the device within the operating system. This path should be used in conjunction with the display name to completely identify an available disc recorder.
     * @returns {BSTR} Path to the disc recorder. This path may be of the form \Device\CdRom<i>X</i>, but you should not rely on the path following this convention.
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscrecorder-getpath
     */
    GetPath() {
        pbstrPath := BSTR()
        result := ComCall(8, this, "ptr", pbstrPath, "HRESULT")
        return pbstrPath
    }

    /**
     * Retrieves a pointer to an IPropertyStorage interface.
     * @returns {IPropertyStorage} Pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a> interface to the property set with all current properties defined.
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscrecorder-getrecorderproperties
     */
    GetRecorderProperties() {
        result := ComCall(9, this, "ptr*", &ppPropStg := 0, "HRESULT")
        return IPropertyStorage(ppPropStg)
    }

    /**
     * Accepts an IPropertyStorage pointer for an object with all the properties that the application wishes to change. Sparse settings are supported.
     * @param {IPropertyStorage} pPropStg Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a> interface that the disc recorder can use to retrieve new settings on various properties.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscrecorder-setrecorderproperties
     */
    SetRecorderProperties(pPropStg) {
        result := ComCall(10, this, "ptr", pPropStg, "HRESULT")
        return result
    }

    /**
     * Retrieves the disc recorder state.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscrecorder-getrecorderstate
     */
    GetRecorderState() {
        result := ComCall(11, this, "uint*", &pulDevStateFlags := 0, "HRESULT")
        return pulDevStateFlags
    }

    /**
     * Opens a disc recorder for exclusive access.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscrecorder-openexclusive
     */
    OpenExclusive() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * Detects the type of media currently inserted in the recorder, if any.
     * @param {Pointer<Integer>} fMediaType 
     * @param {Pointer<Integer>} fMediaFlags 
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscrecorder-querymediatype
     */
    QueryMediaType(fMediaType, fMediaFlags) {
        fMediaTypeMarshal := fMediaType is VarRef ? "int*" : "ptr"
        fMediaFlagsMarshal := fMediaFlags is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, fMediaTypeMarshal, fMediaType, fMediaFlagsMarshal, fMediaFlags, "HRESULT")
        return result
    }

    /**
     * Retrieves information about the currently mounted media, such as the total number of blocks used on the media.
     * @param {Pointer<Integer>} pbSessions Number of sessions on the disc.
     * @param {Pointer<Integer>} pbLastTrack Track number of the last track of the previous session.
     * @param {Pointer<Integer>} ulStartAddress Start address of the last track of the previous session.
     * @param {Pointer<Integer>} ulNextWritable Address at which writing is to begin.
     * @param {Pointer<Integer>} ulFreeBlocks Number of blocks available for writing.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscrecorder-querymediainfo
     */
    QueryMediaInfo(pbSessions, pbLastTrack, ulStartAddress, ulNextWritable, ulFreeBlocks) {
        pbSessionsMarshal := pbSessions is VarRef ? "char*" : "ptr"
        pbLastTrackMarshal := pbLastTrack is VarRef ? "char*" : "ptr"
        ulStartAddressMarshal := ulStartAddress is VarRef ? "uint*" : "ptr"
        ulNextWritableMarshal := ulNextWritable is VarRef ? "uint*" : "ptr"
        ulFreeBlocksMarshal := ulFreeBlocks is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, pbSessionsMarshal, pbSessions, pbLastTrackMarshal, pbLastTrack, ulStartAddressMarshal, ulStartAddress, ulNextWritableMarshal, ulNextWritable, ulFreeBlocksMarshal, ulFreeBlocks, "HRESULT")
        return result
    }

    /**
     * Unlocks and ejects the tray of the disc recorder, if possible.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscrecorder-eject
     */
    Eject() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Attempts to erase the CD-RW media if this is a CD-RW disc recorder. Both full and quick erases are supported.
     * @param {Integer} bFullErase Indicates the erase type. If this parameter is <b>FALSE</b>, a quick erase is performed. If this parameter is <b>TRUE</b>, a full erase is performed.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscrecorder-erase
     */
    Erase(bFullErase) {
        result := ComCall(16, this, "char", bFullErase, "HRESULT")
        return result
    }

    /**
     * Releases exclusive access to a disc recorder. This restores file system access to the drive.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-idiscrecorder-close
     */
    Close() {
        result := ComCall(17, this, "HRESULT")
        return result
    }
}
