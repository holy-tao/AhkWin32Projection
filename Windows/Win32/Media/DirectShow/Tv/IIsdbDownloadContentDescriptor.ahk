#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) download content descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdbdownloadcontentdescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbDownloadContentDescriptor extends IUnknown{
    /**
     * The interface identifier for IIsdbDownloadContentDescriptor
     * @type {Guid}
     */
    static IID => Guid("{5298661e-cb88-4f5f-a1de-5f440c185b92}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetTag(pbVal) {
        result := ComCall(3, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetLength(pbVal) {
        result := ComCall(4, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfReboot 
     * @param {Pointer<BOOL>} pfAddOn 
     * @param {Pointer<BOOL>} pfCompatibility 
     * @param {Pointer<BOOL>} pfModuleInfo 
     * @param {Pointer<BOOL>} pfTextInfo 
     * @returns {HRESULT} 
     */
    GetFlags(pfReboot, pfAddOn, pfCompatibility, pfModuleInfo, pfTextInfo) {
        result := ComCall(5, this, "ptr", pfReboot, "ptr", pfAddOn, "ptr", pfCompatibility, "ptr", pfModuleInfo, "ptr", pfTextInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwVal 
     * @returns {HRESULT} 
     */
    GetComponentSize(pdwVal) {
        result := ComCall(6, this, "uint*", pdwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwVal 
     * @returns {HRESULT} 
     */
    GetDownloadId(pdwVal) {
        result := ComCall(7, this, "uint*", pdwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwVal 
     * @returns {HRESULT} 
     */
    GetTimeOutValueDII(pdwVal) {
        result := ComCall(8, this, "uint*", pdwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwVal 
     * @returns {HRESULT} 
     */
    GetLeakRate(pdwVal) {
        result := ComCall(9, this, "uint*", pdwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetComponentTag(pbVal) {
        result := ComCall(10, this, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwLength 
     * @returns {HRESULT} 
     */
    GetCompatiblityDescriptorLength(pwLength) {
        result := ComCall(11, this, "ushort*", pwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} ppbData 
     * @returns {HRESULT} 
     */
    GetCompatiblityDescriptor(ppbData) {
        result := ComCall(12, this, "char*", ppbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt16>} pwVal 
     * @returns {HRESULT} 
     */
    GetCountOfRecords(pwVal) {
        result := ComCall(13, this, "ushort*", pwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wRecordIndex 
     * @param {Pointer<UInt16>} pwVal 
     * @returns {HRESULT} 
     */
    GetRecordModuleId(wRecordIndex, pwVal) {
        result := ComCall(14, this, "ushort", wRecordIndex, "ushort*", pwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wRecordIndex 
     * @param {Pointer<UInt32>} pdwVal 
     * @returns {HRESULT} 
     */
    GetRecordModuleSize(wRecordIndex, pdwVal) {
        result := ComCall(15, this, "ushort", wRecordIndex, "uint*", pdwVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wRecordIndex 
     * @param {Pointer<Byte>} pbVal 
     * @returns {HRESULT} 
     */
    GetRecordModuleInfoLength(wRecordIndex, pbVal) {
        result := ComCall(16, this, "ushort", wRecordIndex, "char*", pbVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} wRecordIndex 
     * @param {Pointer<Byte>} ppbData 
     * @returns {HRESULT} 
     */
    GetRecordModuleInfo(wRecordIndex, ppbData) {
        result := ComCall(17, this, "ushort", wRecordIndex, "char*", ppbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} szCode 
     * @returns {HRESULT} 
     */
    GetTextLanguageCode(szCode) {
        result := ComCall(18, this, "char*", szCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} convMode 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    GetTextW(convMode, pbstrName) {
        result := ComCall(19, this, "int", convMode, "ptr", pbstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
