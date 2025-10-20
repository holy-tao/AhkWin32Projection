#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITDirectoryObjectConference interface provides methods that allow an application to set and get conference details. The ITDirectoryObjectConference interface is created by calling QueryInterface on ITDirectoryObject.
 * @see https://docs.microsoft.com/windows/win32/api//rend/nn-rend-itdirectoryobjectconference
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITDirectoryObjectConference extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITDirectoryObjectConference
     * @type {Guid}
     */
    static IID => Guid("{f1029e5d-cb5b-11d0-8d59-00c04fd91ac0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Protocol", "get_Originator", "put_Originator", "get_AdvertisingScope", "put_AdvertisingScope", "get_Url", "put_Url", "get_Description", "put_Description", "get_IsEncrypted", "put_IsEncrypted", "get_StartTime", "put_StartTime", "get_StopTime", "put_StopTime"]

    /**
     * 
     * @param {Pointer<BSTR>} ppProtocol 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-get_protocol
     */
    get_Protocol(ppProtocol) {
        result := ComCall(7, this, "ptr", ppProtocol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppOriginator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-get_originator
     */
    get_Originator(ppOriginator) {
        result := ComCall(8, this, "ptr", ppOriginator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pOriginator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-put_originator
     */
    put_Originator(pOriginator) {
        pOriginator := pOriginator is String ? BSTR.Alloc(pOriginator).Value : pOriginator

        result := ComCall(9, this, "ptr", pOriginator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pAdvertisingScope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-get_advertisingscope
     */
    get_AdvertisingScope(pAdvertisingScope) {
        result := ComCall(10, this, "int*", pAdvertisingScope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} AdvertisingScope 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-put_advertisingscope
     */
    put_AdvertisingScope(AdvertisingScope) {
        result := ComCall(11, this, "int", AdvertisingScope, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppUrl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-get_url
     */
    get_Url(ppUrl) {
        result := ComCall(12, this, "ptr", ppUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pUrl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-put_url
     */
    put_Url(pUrl) {
        pUrl := pUrl is String ? BSTR.Alloc(pUrl).Value : pUrl

        result := ComCall(13, this, "ptr", pUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-get_description
     */
    get_Description(ppDescription) {
        result := ComCall(14, this, "ptr", ppDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-put_description
     */
    put_Description(pDescription) {
        pDescription := pDescription is String ? BSTR.Alloc(pDescription).Value : pDescription

        result := ComCall(15, this, "ptr", pDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfEncrypted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-get_isencrypted
     */
    get_IsEncrypted(pfEncrypted) {
        result := ComCall(16, this, "ptr", pfEncrypted, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fEncrypted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-put_isencrypted
     */
    put_IsEncrypted(fEncrypted) {
        result := ComCall(17, this, "short", fEncrypted, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pDate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-get_starttime
     */
    get_StartTime(pDate) {
        result := ComCall(18, this, "double*", pDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Date 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-put_starttime
     */
    put_StartTime(Date) {
        result := ComCall(19, this, "double", Date, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pDate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-get_stoptime
     */
    get_StopTime(pDate) {
        result := ComCall(20, this, "double*", pDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Date 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rend/nf-rend-itdirectoryobjectconference-put_stoptime
     */
    put_StopTime(Date) {
        result := ComCall(21, this, "double", Date, "HRESULT")
        return result
    }
}
