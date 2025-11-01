#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Configures an Advanced Systems Format (ASF) mutual exclusion object, which manages information about a group of streams in an ASF profile that are mutually exclusive.
 * @remarks
 * 
  * An ASF profile object can support multiple mutual exclusions. Each must be configured using a separate ASF mutual exclusion object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nn-wmcontainer-imfasfmutualexclusion
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFASFMutualExclusion extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFASFMutualExclusion
     * @type {Guid}
     */
    static IID => Guid("{12558291-e399-11d5-bc2a-00b0d0f3f4ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetType", "SetType", "GetRecordCount", "GetStreamsForRecord", "AddStreamForRecord", "RemoveStreamFromRecord", "RemoveRecord", "AddRecord", "Clone"]

    /**
     * 
     * @param {Pointer<Guid>} pguidType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfmutualexclusion-gettype
     */
    GetType(pguidType) {
        result := ComCall(3, this, "ptr", pguidType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfmutualexclusion-settype
     */
    SetType(guidType) {
        result := ComCall(4, this, "ptr", guidType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwRecordCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfmutualexclusion-getrecordcount
     */
    GetRecordCount(pdwRecordCount) {
        result := ComCall(5, this, "uint*", pdwRecordCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordNumber 
     * @param {Pointer<Integer>} pwStreamNumArray 
     * @param {Pointer<Integer>} pcStreams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfmutualexclusion-getstreamsforrecord
     */
    GetStreamsForRecord(dwRecordNumber, pwStreamNumArray, pcStreams) {
        result := ComCall(6, this, "uint", dwRecordNumber, "ushort*", pwStreamNumArray, "uint*", pcStreams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordNumber 
     * @param {Integer} wStreamNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfmutualexclusion-addstreamforrecord
     */
    AddStreamForRecord(dwRecordNumber, wStreamNumber) {
        result := ComCall(7, this, "uint", dwRecordNumber, "ushort", wStreamNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordNumber 
     * @param {Integer} wStreamNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfmutualexclusion-removestreamfromrecord
     */
    RemoveStreamFromRecord(dwRecordNumber, wStreamNumber) {
        result := ComCall(8, this, "uint", dwRecordNumber, "ushort", wStreamNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRecordNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfmutualexclusion-removerecord
     */
    RemoveRecord(dwRecordNumber) {
        result := ComCall(9, this, "uint", dwRecordNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwRecordNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfmutualexclusion-addrecord
     */
    AddRecord(pdwRecordNumber) {
        result := ComCall(10, this, "uint*", pdwRecordNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFASFMutualExclusion>} ppIMutex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfmutualexclusion-clone
     */
    Clone(ppIMutex) {
        result := ComCall(11, this, "ptr*", ppIMutex, "HRESULT")
        return result
    }
}
