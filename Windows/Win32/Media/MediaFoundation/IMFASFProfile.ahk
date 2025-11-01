#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk

/**
 * Manages an Advanced Systems Format (ASF) profile.
 * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nn-wmcontainer-imfasfprofile
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFASFProfile extends IMFAttributes{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFASFProfile
     * @type {Guid}
     */
    static IID => Guid("{d267bf6a-028b-4e0d-903d-43f0ef82d0d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStreamCount", "GetStream", "GetStreamByNumber", "SetStream", "RemoveStream", "CreateStream", "GetMutualExclusionCount", "GetMutualExclusion", "AddMutualExclusion", "RemoveMutualExclusion", "CreateMutualExclusion", "GetStreamPrioritization", "AddStreamPrioritization", "RemoveStreamPrioritization", "CreateStreamPrioritization", "Clone"]

    /**
     * 
     * @param {Pointer<Integer>} pcStreams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-getstreamcount
     */
    GetStreamCount(pcStreams) {
        pcStreamsMarshal := pcStreams is VarRef ? "uint*" : "ptr"

        result := ComCall(33, this, pcStreamsMarshal, pcStreams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<Integer>} pwStreamNumber 
     * @param {Pointer<IMFASFStreamConfig>} ppIStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-getstream
     */
    GetStream(dwStreamIndex, pwStreamNumber, ppIStream) {
        pwStreamNumberMarshal := pwStreamNumber is VarRef ? "ushort*" : "ptr"

        result := ComCall(34, this, "uint", dwStreamIndex, pwStreamNumberMarshal, pwStreamNumber, "ptr*", ppIStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @param {Pointer<IMFASFStreamConfig>} ppIStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-getstreambynumber
     */
    GetStreamByNumber(wStreamNumber, ppIStream) {
        result := ComCall(35, this, "ushort", wStreamNumber, "ptr*", ppIStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFASFStreamConfig} pIStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-setstream
     */
    SetStream(pIStream) {
        result := ComCall(36, this, "ptr", pIStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-removestream
     */
    RemoveStream(wStreamNumber) {
        result := ComCall(37, this, "ushort", wStreamNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFMediaType} pIMediaType 
     * @param {Pointer<IMFASFStreamConfig>} ppIStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-createstream
     */
    CreateStream(pIMediaType, ppIStream) {
        result := ComCall(38, this, "ptr", pIMediaType, "ptr*", ppIStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcMutexs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-getmutualexclusioncount
     */
    GetMutualExclusionCount(pcMutexs) {
        pcMutexsMarshal := pcMutexs is VarRef ? "uint*" : "ptr"

        result := ComCall(39, this, pcMutexsMarshal, pcMutexs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMutexIndex 
     * @param {Pointer<IMFASFMutualExclusion>} ppIMutex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-getmutualexclusion
     */
    GetMutualExclusion(dwMutexIndex, ppIMutex) {
        result := ComCall(40, this, "uint", dwMutexIndex, "ptr*", ppIMutex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFASFMutualExclusion} pIMutex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-addmutualexclusion
     */
    AddMutualExclusion(pIMutex) {
        result := ComCall(41, this, "ptr", pIMutex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMutexIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-removemutualexclusion
     */
    RemoveMutualExclusion(dwMutexIndex) {
        result := ComCall(42, this, "uint", dwMutexIndex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFASFMutualExclusion>} ppIMutex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-createmutualexclusion
     */
    CreateMutualExclusion(ppIMutex) {
        result := ComCall(43, this, "ptr*", ppIMutex, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFASFStreamPrioritization>} ppIStreamPrioritization 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-getstreamprioritization
     */
    GetStreamPrioritization(ppIStreamPrioritization) {
        result := ComCall(44, this, "ptr*", ppIStreamPrioritization, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFASFStreamPrioritization} pIStreamPrioritization 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-addstreamprioritization
     */
    AddStreamPrioritization(pIStreamPrioritization) {
        result := ComCall(45, this, "ptr", pIStreamPrioritization, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-removestreamprioritization
     */
    RemoveStreamPrioritization() {
        result := ComCall(46, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFASFStreamPrioritization>} ppIStreamPrioritization 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-createstreamprioritization
     */
    CreateStreamPrioritization(ppIStreamPrioritization) {
        result := ComCall(47, this, "ptr*", ppIStreamPrioritization, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFASFProfile>} ppIProfile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-clone
     */
    Clone(ppIProfile) {
        result := ComCall(48, this, "ptr*", ppIProfile, "HRESULT")
        return result
    }
}
