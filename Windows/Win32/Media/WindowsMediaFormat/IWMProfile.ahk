#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMStreamConfig.ahk
#Include .\IWMMutualExclusion.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMProfile interface is the primary interface for a profile object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmprofile
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMProfile extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMProfile
     * @type {Guid}
     */
    static IID => Guid("{96406bdb-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVersion", "GetName", "SetName", "GetDescription", "SetDescription", "GetStreamCount", "GetStream", "GetStreamByNumber", "RemoveStream", "RemoveStreamByNumber", "AddStream", "ReconfigStream", "CreateNewStream", "GetMutualExclusionCount", "GetMutualExclusion", "RemoveMutualExclusion", "AddMutualExclusion", "CreateNewMutualExclusion"]

    /**
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion() {
        result := ComCall(3, this, "int*", &pdwVersion := 0, "HRESULT")
        return pdwVersion
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Pointer<Integer>} pcchName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getname
     */
    GetName(pwszName, pcchName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        pcchNameMarshal := pcchName is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", pwszName, pcchNameMarshal, pcchName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-setname
     */
    SetName(pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(5, this, "ptr", pwszName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszDescription 
     * @param {Pointer<Integer>} pcchDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getdescription
     */
    GetDescription(pwszDescription, pcchDescription) {
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        pcchDescriptionMarshal := pcchDescription is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pwszDescription, pcchDescriptionMarshal, pcchDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-setdescription
     */
    SetDescription(pwszDescription) {
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        result := ComCall(7, this, "ptr", pwszDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getstreamcount
     */
    GetStreamCount() {
        result := ComCall(8, this, "uint*", &pcStreams := 0, "HRESULT")
        return pcStreams
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @returns {IWMStreamConfig} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getstream
     */
    GetStream(dwStreamIndex) {
        result := ComCall(9, this, "uint", dwStreamIndex, "ptr*", &ppConfig := 0, "HRESULT")
        return IWMStreamConfig(ppConfig)
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @returns {IWMStreamConfig} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getstreambynumber
     */
    GetStreamByNumber(wStreamNum) {
        result := ComCall(10, this, "ushort", wStreamNum, "ptr*", &ppConfig := 0, "HRESULT")
        return IWMStreamConfig(ppConfig)
    }

    /**
     * 
     * @param {IWMStreamConfig} pConfig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-removestream
     */
    RemoveStream(pConfig) {
        result := ComCall(11, this, "ptr", pConfig, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-removestreambynumber
     */
    RemoveStreamByNumber(wStreamNum) {
        result := ComCall(12, this, "ushort", wStreamNum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMStreamConfig} pConfig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-addstream
     */
    AddStream(pConfig) {
        result := ComCall(13, this, "ptr", pConfig, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMStreamConfig} pConfig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-reconfigstream
     */
    ReconfigStream(pConfig) {
        result := ComCall(14, this, "ptr", pConfig, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidStreamType 
     * @returns {IWMStreamConfig} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-createnewstream
     */
    CreateNewStream(guidStreamType) {
        result := ComCall(15, this, "ptr", guidStreamType, "ptr*", &ppConfig := 0, "HRESULT")
        return IWMStreamConfig(ppConfig)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getmutualexclusioncount
     */
    GetMutualExclusionCount() {
        result := ComCall(16, this, "uint*", &pcME := 0, "HRESULT")
        return pcME
    }

    /**
     * 
     * @param {Integer} dwMEIndex 
     * @returns {IWMMutualExclusion} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getmutualexclusion
     */
    GetMutualExclusion(dwMEIndex) {
        result := ComCall(17, this, "uint", dwMEIndex, "ptr*", &ppME := 0, "HRESULT")
        return IWMMutualExclusion(ppME)
    }

    /**
     * 
     * @param {IWMMutualExclusion} pME 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-removemutualexclusion
     */
    RemoveMutualExclusion(pME) {
        result := ComCall(18, this, "ptr", pME, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMMutualExclusion} pME 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-addmutualexclusion
     */
    AddMutualExclusion(pME) {
        result := ComCall(19, this, "ptr", pME, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IWMMutualExclusion} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-createnewmutualexclusion
     */
    CreateNewMutualExclusion() {
        result := ComCall(20, this, "ptr*", &ppME := 0, "HRESULT")
        return IWMMutualExclusion(ppME)
    }
}
