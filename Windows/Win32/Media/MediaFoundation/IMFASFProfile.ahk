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
     * Retrieves the number of streams in the profile.
     * @returns {Integer} Receives the number of streams in the profile.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfprofile-getstreamcount
     */
    GetStreamCount() {
        result := ComCall(33, this, "uint*", &pcStreams := 0, "HRESULT")
        return pcStreams
    }

    /**
     * Retrieves a stream from the profile by stream index, and/or retrieves the stream number for a stream index.
     * @param {Integer} dwStreamIndex The index of the stream to retrieve. Stream indexes are sequential and zero-based. You can get the number of streams that are in the profile by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfprofile-getstreamcount">IMFASFProfile::GetStreamCount</a> method.
     * @param {Pointer<Integer>} pwStreamNumber Receives the stream number of the requested stream. Stream numbers are one-based and are not necessarily sequential. This parameter can be set to <b>NULL</b> if the stream number is not required.
     * @param {Pointer<IMFASFStreamConfig>} ppIStream Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfstreamconfig">IMFASFStreamConfig</a> interface of the ASF stream configuration object. The caller must release the interface. This parameter can be <b>NULL</b> if you want to retrieve the stream number without accessing the stream configuration.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfprofile-getstream
     */
    GetStream(dwStreamIndex, pwStreamNumber, ppIStream) {
        pwStreamNumberMarshal := pwStreamNumber is VarRef ? "ushort*" : "ptr"

        result := ComCall(34, this, "uint", dwStreamIndex, pwStreamNumberMarshal, pwStreamNumber, "ptr*", ppIStream, "HRESULT")
        return result
    }

    /**
     * Retrieves an Advanced Systems Format (ASF) stream configuration object for a stream in the profile. This method references the stream by stream number instead of stream index.
     * @param {Integer} wStreamNumber The stream number for which to obtain the interface pointer.
     * @returns {IMFASFStreamConfig} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfstreamconfig">IMFASFStreamConfig</a> interface of the ASF stream configuration object. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfprofile-getstreambynumber
     */
    GetStreamByNumber(wStreamNumber) {
        result := ComCall(35, this, "ushort", wStreamNumber, "ptr*", &ppIStream := 0, "HRESULT")
        return IMFASFStreamConfig(ppIStream)
    }

    /**
     * Adds a stream to the profile or reconfigures an existing stream.
     * @param {IMFASFStreamConfig} pIStream Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfstreamconfig">IMFASFStreamConfig</a> interface of a configured ASF stream configuration object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfprofile-setstream
     */
    SetStream(pIStream) {
        result := ComCall(36, this, "ptr", pIStream, "HRESULT")
        return result
    }

    /**
     * Removes a stream from the Advanced Systems Format (ASF) profile object.
     * @param {Integer} wStreamNumber Stream number of the stream to remove.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfprofile-removestream
     */
    RemoveStream(wStreamNumber) {
        result := ComCall(37, this, "ushort", wStreamNumber, "HRESULT")
        return result
    }

    /**
     * Creates an Advanced Systems Format (ASF) stream configuration object.
     * @param {IMFMediaType} pIMediaType Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of a configured media type.
     * @returns {IMFASFStreamConfig} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfstreamconfig">IMFASFStreamConfig</a> interface of the new ASF stream configuration object. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfprofile-createstream
     */
    CreateStream(pIMediaType) {
        result := ComCall(38, this, "ptr", pIMediaType, "ptr*", &ppIStream := 0, "HRESULT")
        return IMFASFStreamConfig(ppIStream)
    }

    /**
     * Retrieves the number of Advanced Systems Format (ASF) mutual exclusion objects that are associated with the profile.
     * @returns {Integer} Receives the number of mutual exclusion objects.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfprofile-getmutualexclusioncount
     */
    GetMutualExclusionCount() {
        result := ComCall(39, this, "uint*", &pcMutexs := 0, "HRESULT")
        return pcMutexs
    }

    /**
     * Retrieves an Advanced Systems Format (ASF) mutual exclusion object from the profile.
     * @param {Integer} dwMutexIndex Index of the mutual exclusion object in the profile.
     * @returns {IMFASFMutualExclusion} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfmutualexclusion">IMFASFMutualExclusion</a> interface of the ASF mutual exclusion object. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfprofile-getmutualexclusion
     */
    GetMutualExclusion(dwMutexIndex) {
        result := ComCall(40, this, "uint", dwMutexIndex, "ptr*", &ppIMutex := 0, "HRESULT")
        return IMFASFMutualExclusion(ppIMutex)
    }

    /**
     * Adds a configured Advanced Systems Format (ASF) mutual exclusion object to the profile.
     * @param {IMFASFMutualExclusion} pIMutex Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfmutualexclusion">IMFASFMutualExclusion</a> interface of a configured ASF mutual exclusion object.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfprofile-addmutualexclusion
     */
    AddMutualExclusion(pIMutex) {
        result := ComCall(41, this, "ptr", pIMutex, "HRESULT")
        return result
    }

    /**
     * Removes an Advanced Systems Format (ASF) mutual exclusion object from the profile.
     * @param {Integer} dwMutexIndex The index of the mutual exclusion object to remove from the profile.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfprofile-removemutualexclusion
     */
    RemoveMutualExclusion(dwMutexIndex) {
        result := ComCall(42, this, "uint", dwMutexIndex, "HRESULT")
        return result
    }

    /**
     * Creates a new Advanced Systems Format (ASF) mutual exclusion object. Mutual exclusion objects can be added to a profile by calling the AddMutualExclusion method.
     * @returns {IMFASFMutualExclusion} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfmutualexclusion">IMFASFMutualExclusion</a> interface of the new object. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfprofile-createmutualexclusion
     */
    CreateMutualExclusion() {
        result := ComCall(43, this, "ptr*", &ppIMutex := 0, "HRESULT")
        return IMFASFMutualExclusion(ppIMutex)
    }

    /**
     * IMFASFProfile::GetStreamPrioritization method
     * @returns {IMFASFStreamPrioritization} Reserved.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfprofile-getstreamprioritization
     */
    GetStreamPrioritization() {
        result := ComCall(44, this, "ptr*", &ppIStreamPrioritization := 0, "HRESULT")
        return IMFASFStreamPrioritization(ppIStreamPrioritization)
    }

    /**
     * IMFASFProfile::AddStreamPrioritization method
     * @param {IMFASFStreamPrioritization} pIStreamPrioritization Reserved.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfprofile-addstreamprioritization
     */
    AddStreamPrioritization(pIStreamPrioritization) {
        result := ComCall(45, this, "ptr", pIStreamPrioritization, "HRESULT")
        return result
    }

    /**
     * IMFASFProfile::RemoveStreamPrioritization method
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfprofile-removestreamprioritization
     */
    RemoveStreamPrioritization() {
        result := ComCall(46, this, "HRESULT")
        return result
    }

    /**
     * IMFASFProfile::CreateStreamPrioritization method
     * @returns {IMFASFStreamPrioritization} Reserved.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfprofile-createstreamprioritization
     */
    CreateStreamPrioritization() {
        result := ComCall(47, this, "ptr*", &ppIStreamPrioritization := 0, "HRESULT")
        return IMFASFStreamPrioritization(ppIStreamPrioritization)
    }

    /**
     * Creates a copy of the Advanced Systems Format profile object.
     * @returns {IMFASFProfile} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfprofile">IMFASFProfile</a> interface of the new object. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfprofile-clone
     */
    Clone() {
        result := ComCall(48, this, "ptr*", &ppIProfile := 0, "HRESULT")
        return IMFASFProfile(ppIProfile)
    }
}
