#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implements methods that get data from an Integrated Services Digital Broadcasting (ISDB) logo transmission descriptor.
 * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nn-dvbsiparser-iisdblogotransmissiondescriptor
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IIsdbLogoTransmissionDescriptor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIsdbLogoTransmissionDescriptor
     * @type {Guid}
     */
    static IID => Guid("{e0103f49-4ae1-4f07-9098-756db1fa88cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTag", "GetLength", "GetLogoTransmissionType", "GetLogoId", "GetLogoVersion", "GetDownloadDataId", "GetLogoCharW"]

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-gettag
     */
    GetTag(pbVal) {
        result := ComCall(3, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-getlength
     */
    GetLength(pbVal) {
        result := ComCall(4, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-getlogotransmissiontype
     */
    GetLogoTransmissionType(pbVal) {
        result := ComCall(5, this, "char*", pbVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-getlogoid
     */
    GetLogoId(pwVal) {
        result := ComCall(6, this, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-getlogoversion
     */
    GetLogoVersion(pwVal) {
        result := ComCall(7, this, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pwVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-getdownloaddataid
     */
    GetDownloadDataId(pwVal) {
        result := ComCall(8, this, "ushort*", pwVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} convMode 
     * @param {Pointer<BSTR>} pbstrChar 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-getlogocharw
     */
    GetLogoCharW(convMode, pbstrChar) {
        result := ComCall(9, this, "int", convMode, "ptr", pbstrChar, "HRESULT")
        return result
    }
}
