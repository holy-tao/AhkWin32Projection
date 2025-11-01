#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Integer>} pbyUniqueID 
     * @param {Integer} ulBufferSize 
     * @param {Pointer<Integer>} pulReturnSizeRequired 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscrecorder-getrecorderguid
     */
    GetRecorderGUID(pbyUniqueID, ulBufferSize, pulReturnSizeRequired) {
        pbyUniqueIDMarshal := pbyUniqueID is VarRef ? "char*" : "ptr"
        pulReturnSizeRequiredMarshal := pulReturnSizeRequired is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pbyUniqueIDMarshal, pbyUniqueID, "uint", ulBufferSize, pulReturnSizeRequiredMarshal, pulReturnSizeRequired, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} fTypeCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscrecorder-getrecordertype
     */
    GetRecorderType(fTypeCode) {
        fTypeCodeMarshal := fTypeCode is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, fTypeCodeMarshal, fTypeCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrVendorID 
     * @param {Pointer<BSTR>} pbstrProductID 
     * @param {Pointer<BSTR>} pbstrRevision 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscrecorder-getdisplaynames
     */
    GetDisplayNames(pbstrVendorID, pbstrProductID, pbstrRevision) {
        result := ComCall(6, this, "ptr", pbstrVendorID, "ptr", pbstrProductID, "ptr", pbstrRevision, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrBasePnPID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscrecorder-getbasepnpid
     */
    GetBasePnPID(pbstrBasePnPID) {
        result := ComCall(7, this, "ptr", pbstrBasePnPID, "HRESULT")
        return result
    }

    /**
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @param {Pointer<BSTR>} pbstrPath 
     * @returns {HRESULT} If the <i>nSize</i> parameter is nonzero, the return value is the number of points enumerated. If <i>nSize</i> is 0, the return value is the total number of points in the path (and <b>GetPath</b> writes nothing to the buffers). If <i>nSize</i> is nonzero and is less than the number of points in the path, the return value is 1.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpath
     */
    GetPath(pbstrPath) {
        result := ComCall(8, this, "ptr", pbstrPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPropertyStorage>} ppPropStg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscrecorder-getrecorderproperties
     */
    GetRecorderProperties(ppPropStg) {
        result := ComCall(9, this, "ptr*", ppPropStg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPropertyStorage} pPropStg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscrecorder-setrecorderproperties
     */
    SetRecorderProperties(pPropStg) {
        result := ComCall(10, this, "ptr", pPropStg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulDevStateFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscrecorder-getrecorderstate
     */
    GetRecorderState(pulDevStateFlags) {
        pulDevStateFlagsMarshal := pulDevStateFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pulDevStateFlagsMarshal, pulDevStateFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscrecorder-openexclusive
     */
    OpenExclusive() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} fMediaType 
     * @param {Pointer<Integer>} fMediaFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscrecorder-querymediatype
     */
    QueryMediaType(fMediaType, fMediaFlags) {
        fMediaTypeMarshal := fMediaType is VarRef ? "int*" : "ptr"
        fMediaFlagsMarshal := fMediaFlags is VarRef ? "int*" : "ptr"

        result := ComCall(13, this, fMediaTypeMarshal, fMediaType, fMediaFlagsMarshal, fMediaFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbSessions 
     * @param {Pointer<Integer>} pbLastTrack 
     * @param {Pointer<Integer>} ulStartAddress 
     * @param {Pointer<Integer>} ulNextWritable 
     * @param {Pointer<Integer>} ulFreeBlocks 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscrecorder-querymediainfo
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
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscrecorder-eject
     */
    Eject() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} bFullErase 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscrecorder-erase
     */
    Erase(bFullErase) {
        result := ComCall(16, this, "char", bFullErase, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-idiscrecorder-close
     */
    Close() {
        result := ComCall(17, this, "HRESULT")
        return result
    }
}
