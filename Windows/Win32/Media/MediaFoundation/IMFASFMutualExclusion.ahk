#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFASFMutualExclusion.ahk
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
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfmutualexclusion-gettype
     */
    GetType() {
        pguidType := Guid()
        result := ComCall(3, this, "ptr", pguidType, "HRESULT")
        return pguidType
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfmutualexclusion-getrecordcount
     */
    GetRecordCount() {
        result := ComCall(5, this, "uint*", &pdwRecordCount := 0, "HRESULT")
        return pdwRecordCount
    }

    /**
     * 
     * @param {Integer} dwRecordNumber 
     * @param {Pointer<Integer>} pcStreams 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfmutualexclusion-getstreamsforrecord
     */
    GetStreamsForRecord(dwRecordNumber, pcStreams) {
        pcStreamsMarshal := pcStreams is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", dwRecordNumber, "ushort*", &pwStreamNumArray := 0, pcStreamsMarshal, pcStreams, "HRESULT")
        return pwStreamNumArray
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfmutualexclusion-addrecord
     */
    AddRecord() {
        result := ComCall(10, this, "uint*", &pdwRecordNumber := 0, "HRESULT")
        return pdwRecordNumber
    }

    /**
     * 
     * @returns {IMFASFMutualExclusion} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfmutualexclusion-clone
     */
    Clone() {
        result := ComCall(11, this, "ptr*", &ppIMutex := 0, "HRESULT")
        return IMFASFMutualExclusion(ppIMutex)
    }
}
