#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFASFStreamConfig.ahk
#Include .\IMFASFMutualExclusion.ahk
#Include .\IMFASFStreamPrioritization.ahk
#Include .\IMFASFProfile.ahk
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-getstreamcount
     */
    GetStreamCount() {
        result := ComCall(33, this, "uint*", &pcStreams := 0, "HRESULT")
        return pcStreams
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
     * @returns {IMFASFStreamConfig} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-getstreambynumber
     */
    GetStreamByNumber(wStreamNumber) {
        result := ComCall(35, this, "ushort", wStreamNumber, "ptr*", &ppIStream := 0, "HRESULT")
        return IMFASFStreamConfig(ppIStream)
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
     * @returns {IMFASFStreamConfig} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-createstream
     */
    CreateStream(pIMediaType) {
        result := ComCall(38, this, "ptr", pIMediaType, "ptr*", &ppIStream := 0, "HRESULT")
        return IMFASFStreamConfig(ppIStream)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-getmutualexclusioncount
     */
    GetMutualExclusionCount() {
        result := ComCall(39, this, "uint*", &pcMutexs := 0, "HRESULT")
        return pcMutexs
    }

    /**
     * 
     * @param {Integer} dwMutexIndex 
     * @returns {IMFASFMutualExclusion} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-getmutualexclusion
     */
    GetMutualExclusion(dwMutexIndex) {
        result := ComCall(40, this, "uint", dwMutexIndex, "ptr*", &ppIMutex := 0, "HRESULT")
        return IMFASFMutualExclusion(ppIMutex)
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
     * @returns {IMFASFMutualExclusion} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-createmutualexclusion
     */
    CreateMutualExclusion() {
        result := ComCall(43, this, "ptr*", &ppIMutex := 0, "HRESULT")
        return IMFASFMutualExclusion(ppIMutex)
    }

    /**
     * 
     * @returns {IMFASFStreamPrioritization} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-getstreamprioritization
     */
    GetStreamPrioritization() {
        result := ComCall(44, this, "ptr*", &ppIStreamPrioritization := 0, "HRESULT")
        return IMFASFStreamPrioritization(ppIStreamPrioritization)
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
     * @returns {IMFASFStreamPrioritization} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-createstreamprioritization
     */
    CreateStreamPrioritization() {
        result := ComCall(47, this, "ptr*", &ppIStreamPrioritization := 0, "HRESULT")
        return IMFASFStreamPrioritization(ppIStreamPrioritization)
    }

    /**
     * 
     * @returns {IMFASFProfile} 
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfprofile-clone
     */
    Clone() {
        result := ComCall(48, this, "ptr*", &ppIProfile := 0, "HRESULT")
        return IMFASFProfile(ppIProfile)
    }
}
