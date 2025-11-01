#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} pdwVersion 
     * @returns {HRESULT} If the function succeeds, the return value includes the major and minor version numbers of the operating system in the low-order word, and information about the operating system platform in the high-order word.
     * 
     * For all platforms, the low-order word contains the version number of the operating system. The low-order byte of this word specifies the major version number, in hexadecimal notation. The high-order byte specifies the minor version (revision) number, in hexadecimal notation. The  high-order bit is zero, the next 7 bits represent the build number, and the low-order byte is 5.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion(pdwVersion) {
        pdwVersionMarshal := pdwVersion is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pdwVersionMarshal, pdwVersion, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pcStreams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getstreamcount
     */
    GetStreamCount(pcStreams) {
        pcStreamsMarshal := pcStreams is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pcStreamsMarshal, pcStreams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<IWMStreamConfig>} ppConfig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getstream
     */
    GetStream(dwStreamIndex, ppConfig) {
        result := ComCall(9, this, "uint", dwStreamIndex, "ptr*", ppConfig, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<IWMStreamConfig>} ppConfig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getstreambynumber
     */
    GetStreamByNumber(wStreamNum, ppConfig) {
        result := ComCall(10, this, "ushort", wStreamNum, "ptr*", ppConfig, "HRESULT")
        return result
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
     * @param {Pointer<IWMStreamConfig>} ppConfig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-createnewstream
     */
    CreateNewStream(guidStreamType, ppConfig) {
        result := ComCall(15, this, "ptr", guidStreamType, "ptr*", ppConfig, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcME 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getmutualexclusioncount
     */
    GetMutualExclusionCount(pcME) {
        pcMEMarshal := pcME is VarRef ? "uint*" : "ptr"

        result := ComCall(16, this, pcMEMarshal, pcME, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMEIndex 
     * @param {Pointer<IWMMutualExclusion>} ppME 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-getmutualexclusion
     */
    GetMutualExclusion(dwMEIndex, ppME) {
        result := ComCall(17, this, "uint", dwMEIndex, "ptr*", ppME, "HRESULT")
        return result
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
     * @param {Pointer<IWMMutualExclusion>} ppME 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmprofile-createnewmutualexclusion
     */
    CreateNewMutualExclusion(ppME) {
        result := ComCall(20, this, "ptr*", ppME, "HRESULT")
        return result
    }
}
