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
     * 
     * @param {Pointer<Byte>} pbyUniqueID 
     * @param {Integer} nulIDSize 
     * @param {Integer} nulDriveNumber 
     * @returns {HRESULT} 
     */
    Init(pbyUniqueID, nulIDSize, nulDriveNumber) {
        result := ComCall(3, this, "char*", pbyUniqueID, "uint", nulIDSize, "uint", nulDriveNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbyUniqueID 
     * @param {Integer} ulBufferSize 
     * @param {Pointer<UInt32>} pulReturnSizeRequired 
     * @returns {HRESULT} 
     */
    GetRecorderGUID(pbyUniqueID, ulBufferSize, pulReturnSizeRequired) {
        result := ComCall(4, this, "char*", pbyUniqueID, "uint", ulBufferSize, "uint*", pulReturnSizeRequired, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} fTypeCode 
     * @returns {HRESULT} 
     */
    GetRecorderType(fTypeCode) {
        result := ComCall(5, this, "int*", fTypeCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrVendorID 
     * @param {Pointer<BSTR>} pbstrProductID 
     * @param {Pointer<BSTR>} pbstrRevision 
     * @returns {HRESULT} 
     */
    GetDisplayNames(pbstrVendorID, pbstrProductID, pbstrRevision) {
        result := ComCall(6, this, "ptr", pbstrVendorID, "ptr", pbstrProductID, "ptr", pbstrRevision, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrBasePnPID 
     * @returns {HRESULT} 
     */
    GetBasePnPID(pbstrBasePnPID) {
        result := ComCall(7, this, "ptr", pbstrBasePnPID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The GetPath function retrieves the coordinates defining the endpoints of lines and the control points of curves found in the path that is selected into the specified device context.
     * @param {Pointer<BSTR>} pbstrPath 
     * @returns {HRESULT} If the <i>nSize</i> parameter is nonzero, the return value is the number of points enumerated. If <i>nSize</i> is 0, the return value is the total number of points in the path (and <b>GetPath</b> writes nothing to the buffers). If <i>nSize</i> is nonzero and is less than the number of points in the path, the return value is 1.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getpath
     */
    GetPath(pbstrPath) {
        result := ComCall(8, this, "ptr", pbstrPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPropertyStorage>} ppPropStg 
     * @returns {HRESULT} 
     */
    GetRecorderProperties(ppPropStg) {
        result := ComCall(9, this, "ptr", ppPropStg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPropertyStorage>} pPropStg 
     * @returns {HRESULT} 
     */
    SetRecorderProperties(pPropStg) {
        result := ComCall(10, this, "ptr", pPropStg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulDevStateFlags 
     * @returns {HRESULT} 
     */
    GetRecorderState(pulDevStateFlags) {
        result := ComCall(11, this, "uint*", pulDevStateFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    OpenExclusive() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} fMediaType 
     * @param {Pointer<Int32>} fMediaFlags 
     * @returns {HRESULT} 
     */
    QueryMediaType(fMediaType, fMediaFlags) {
        result := ComCall(13, this, "int*", fMediaType, "int*", fMediaFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbSessions 
     * @param {Pointer<Byte>} pbLastTrack 
     * @param {Pointer<UInt32>} ulStartAddress 
     * @param {Pointer<UInt32>} ulNextWritable 
     * @param {Pointer<UInt32>} ulFreeBlocks 
     * @returns {HRESULT} 
     */
    QueryMediaInfo(pbSessions, pbLastTrack, ulStartAddress, ulNextWritable, ulFreeBlocks) {
        result := ComCall(14, this, "char*", pbSessions, "char*", pbLastTrack, "uint*", ulStartAddress, "uint*", ulNextWritable, "uint*", ulFreeBlocks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Eject() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bFullErase 
     * @returns {HRESULT} 
     */
    Erase(bFullErase) {
        result := ComCall(16, this, "char", bFullErase, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
