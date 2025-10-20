#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-gettag
     */
    GetTag(pbVal) {
        result := ComCall(3, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getlength
     */
    GetLength(pbVal) {
        result := ComCall(4, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getstreamcontent
     */
    GetStreamContent(pbVal) {
        result := ComCall(5, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getcomponenttype
     */
    GetComponentType(pbVal) {
        result := ComCall(6, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getcomponenttag
     */
    GetComponentTag(pbVal) {
        result := ComCall(7, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getstreamtype
     */
    GetStreamType(pbVal) {
        result := ComCall(8, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getsimulcastgrouptag
     */
    GetSimulcastGroupTag(pbVal) {
        result := ComCall(9, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getesmultilingualflag
     */
    GetESMultiLingualFlag(pfVal) {
        result := ComCall(10, this, "ptr", pfVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getmaincomponentflag
     */
    GetMainComponentFlag(pfVal) {
        result := ComCall(11, this, "ptr", pfVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getqualityindicator
     */
    GetQualityIndicator(pbVal) {
        result := ComCall(12, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getsamplingrate
     */
    GetSamplingRate(pbVal) {
        result := ComCall(13, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pszCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getlanguagecode
     */
    GetLanguageCode(pszCode) {
        result := ComCall(14, this, "char*", pszCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pszCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-getlanguagecode2
     */
    GetLanguageCode2(pszCode) {
        result := ComCall(15, this, "char*", pszCode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} convMode 
     * @param {Pointer<BSTR>} pbstrText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdbaudiocomponentdescriptor-gettextw
     */
    GetTextW(convMode, pbstrText) {
        result := ComCall(16, this, "int", convMode, "ptr", pbstrText, "HRESULT")
        return result
    }
}
