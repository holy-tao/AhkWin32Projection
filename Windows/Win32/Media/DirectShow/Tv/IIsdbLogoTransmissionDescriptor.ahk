#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
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
     * Gets the tag that identifies an Integrated Services Digital Broadcasting (ISDB) logo transmission descriptor.
     * @returns {Integer} Receives the tag value. For ISDB logo transmission descriptors, this value is 0xCF.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-gettag
     */
    GetTag() {
        result := ComCall(3, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the body length of an Integrated Services Digital Broadcasting (ISDB) logo transmission descriptor, in bytes.
     * @returns {Integer} Receives the descriptor length.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-getlength
     */
    GetLength() {
        result := ComCall(4, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the value of the logo_transmission_type field from an Integrated Services Digital Broadcasting (ISDB) logo transmission descriptor. This field contains a code that indicates the logo transmission type.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-getlogotransmissiontype
     */
    GetLogoTransmissionType() {
        result := ComCall(5, this, "char*", &pbVal := 0, "HRESULT")
        return pbVal
    }

    /**
     * Gets the logo identifier from an Integrated Services Digital Broadcasting (ISDB) logo transmission descriptor.
     * @returns {Integer} Receives the logo identifier.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-getlogoid
     */
    GetLogoId() {
        result := ComCall(6, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the value of the logo_version field from an Integrated Services Digital Broadcasting (ISDB) logo transmission descriptor. This field contains the version number of the logo specified in the descriptor logo_id field.
     * @returns {Integer} Receives the logo version number. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-getlogoid">IIsdbLogoTransmissionDescriptor::GetLogoId</a> method to get the value of the logo_id field.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-getlogoversion
     */
    GetLogoVersion() {
        result := ComCall(7, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the value of the download_data_id field from an Integrated Services Digital Broadcasting (ISDB) logo transmission descriptor.
     * @returns {Integer} Receives the download data identifier.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-getdownloaddataid
     */
    GetDownloadDataId() {
        result := ComCall(8, this, "ushort*", &pwVal := 0, "HRESULT")
        return pwVal
    }

    /**
     * Gets the character string for a simple logo from an Integrated Services Digital Broadcasting (ISDB) logo transmission descriptor.
     * @param {Integer} convMode 
     * @returns {BSTR} Pointer to a buffer that receives the logo text. The caller is responsible for freeing this memory.
     * @see https://docs.microsoft.com/windows/win32/api//dvbsiparser/nf-dvbsiparser-iisdblogotransmissiondescriptor-getlogocharw
     */
    GetLogoCharW(convMode) {
        pbstrChar := BSTR()
        result := ComCall(9, this, "int", convMode, "ptr", pbstrChar, "HRESULT")
        return pbstrChar
    }
}
