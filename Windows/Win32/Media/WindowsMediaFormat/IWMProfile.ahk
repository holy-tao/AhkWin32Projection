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
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @param {Pointer<Int32>} pdwVersion 
     * @returns {HRESULT} If the function succeeds, the return value includes the major and minor version numbers of the operating system in the low-order word, and information about the operating system platform in the high-order word.
     * 
     * For all platforms, the low-order word contains the version number of the operating system. The low-order byte of this word specifies the major version number, in hexadecimal notation. The high-order byte specifies the minor version (revision) number, in hexadecimal notation. The  high-order bit is zero, the next 7 bits represent the build number, and the low-order byte is 5.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion(pdwVersion) {
        result := ComCall(3, this, "int*", pdwVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Pointer<UInt32>} pcchName 
     * @returns {HRESULT} 
     */
    GetName(pwszName, pcchName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(4, this, "ptr", pwszName, "uint*", pcchName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @returns {HRESULT} 
     */
    SetName(pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(5, this, "ptr", pwszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszDescription 
     * @param {Pointer<UInt32>} pcchDescription 
     * @returns {HRESULT} 
     */
    GetDescription(pwszDescription, pcchDescription) {
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        result := ComCall(6, this, "ptr", pwszDescription, "uint*", pcchDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszDescription 
     * @returns {HRESULT} 
     */
    SetDescription(pwszDescription) {
        pwszDescription := pwszDescription is String ? StrPtr(pwszDescription) : pwszDescription

        result := ComCall(7, this, "ptr", pwszDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcStreams 
     * @returns {HRESULT} 
     */
    GetStreamCount(pcStreams) {
        result := ComCall(8, this, "uint*", pcStreams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamIndex 
     * @param {Pointer<IWMStreamConfig>} ppConfig 
     * @returns {HRESULT} 
     */
    GetStream(dwStreamIndex, ppConfig) {
        result := ComCall(9, this, "uint", dwStreamIndex, "ptr", ppConfig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @param {Pointer<IWMStreamConfig>} ppConfig 
     * @returns {HRESULT} 
     */
    GetStreamByNumber(wStreamNum, ppConfig) {
        result := ComCall(10, this, "ushort", wStreamNum, "ptr", ppConfig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMStreamConfig>} pConfig 
     * @returns {HRESULT} 
     */
    RemoveStream(pConfig) {
        result := ComCall(11, this, "ptr", pConfig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wStreamNum 
     * @returns {HRESULT} 
     */
    RemoveStreamByNumber(wStreamNum) {
        result := ComCall(12, this, "ushort", wStreamNum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMStreamConfig>} pConfig 
     * @returns {HRESULT} 
     */
    AddStream(pConfig) {
        result := ComCall(13, this, "ptr", pConfig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMStreamConfig>} pConfig 
     * @returns {HRESULT} 
     */
    ReconfigStream(pConfig) {
        result := ComCall(14, this, "ptr", pConfig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidStreamType 
     * @param {Pointer<IWMStreamConfig>} ppConfig 
     * @returns {HRESULT} 
     */
    CreateNewStream(guidStreamType, ppConfig) {
        result := ComCall(15, this, "ptr", guidStreamType, "ptr", ppConfig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcME 
     * @returns {HRESULT} 
     */
    GetMutualExclusionCount(pcME) {
        result := ComCall(16, this, "uint*", pcME, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMEIndex 
     * @param {Pointer<IWMMutualExclusion>} ppME 
     * @returns {HRESULT} 
     */
    GetMutualExclusion(dwMEIndex, ppME) {
        result := ComCall(17, this, "uint", dwMEIndex, "ptr", ppME, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMMutualExclusion>} pME 
     * @returns {HRESULT} 
     */
    RemoveMutualExclusion(pME) {
        result := ComCall(18, this, "ptr", pME, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMMutualExclusion>} pME 
     * @returns {HRESULT} 
     */
    AddMutualExclusion(pME) {
        result := ComCall(19, this, "ptr", pME, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMMutualExclusion>} ppME 
     * @returns {HRESULT} 
     */
    CreateNewMutualExclusion(ppME) {
        result := ComCall(20, this, "ptr", ppME, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
