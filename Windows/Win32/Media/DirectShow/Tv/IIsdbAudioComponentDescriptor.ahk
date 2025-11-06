#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) audio component descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdbaudiocomponentdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbAudioComponentDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsdbAudioComponentDescriptor
     * @type {Guid}
     */
    static IID => Guid("{679d2002-2425-4be4-a4c7-d6632a574f4d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetStreamContent", "GetComponentType", "GetComponentTag", "GetStreamType", "GetSimulcastGroupTag", "GetESMultiLingualFlag", "GetMainComponentFlag", "GetQualityIndicator", "GetSamplingRate", "GetLanguageCode", "GetLanguageCode2", "GetTextW"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getstreamcontent
     */
    GetStreamContent() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getcomponenttype
     */
    GetComponentType() {
        result := ComCall(6, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getcomponenttag
     */
    GetComponentTag() {
        result := ComCall(7, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getstreamtype
     */
    GetStreamType() {
        result := ComCall(8, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getsimulcastgrouptag
     */
    GetSimulcastGroupTag() {
        result := ComCall(9, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getesmultilingualflag
     */
    GetESMultiLingualFlag() {
        result := ComCall(10, this, "int*", &pfVal := 0, "HRESULT")
        return pfVal
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getmaincomponentflag
     */
    GetMainComponentFlag() {
        result := ComCall(11, this, "int*", &pfVal := 0, "HRESULT")
        return pfVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getqualityindicator
     */
    GetQualityIndicator() {
        result := ComCall(12, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getsamplingrate
     */
    GetSamplingRate() {
        result := ComCall(13, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getlanguagecode
     */
    GetLanguageCode() {
        result := ComCall(14, this, "char*", &pszCode := 0, "HRESULT")
        return pszCode
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getlanguagecode2
     */
    GetLanguageCode2() {
        result := ComCall(15, this, "char*", &pszCode := 0, "HRESULT")
        return pszCode
    }

    /**
     * 
     * @param {Integer} convMode 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-gettextw
     */
    GetTextW(convMode) {
        pbstrText := BSTR()
        result := ComCall(16, this, "int", convMode, "ptr", pbstrText, "HRESULT")
        return pbstrText
    }
}
