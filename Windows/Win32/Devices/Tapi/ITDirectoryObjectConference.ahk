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
     * 
     * @param {Pointer<BSTR>} ppProtocol 
     * @returns {HRESULT} 
     */
    get_Protocol(ppProtocol) {
        result := ComCall(7, this, "ptr", ppProtocol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppOriginator 
     * @returns {HRESULT} 
     */
    get_Originator(ppOriginator) {
        result := ComCall(8, this, "ptr", ppOriginator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pOriginator 
     * @returns {HRESULT} 
     */
    put_Originator(pOriginator) {
        pOriginator := pOriginator is String ? BSTR.Alloc(pOriginator).Value : pOriginator

        result := ComCall(9, this, "ptr", pOriginator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pAdvertisingScope 
     * @returns {HRESULT} 
     */
    get_AdvertisingScope(pAdvertisingScope) {
        result := ComCall(10, this, "int*", pAdvertisingScope, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AdvertisingScope 
     * @returns {HRESULT} 
     */
    put_AdvertisingScope(AdvertisingScope) {
        result := ComCall(11, this, "int", AdvertisingScope, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppUrl 
     * @returns {HRESULT} 
     */
    get_Url(ppUrl) {
        result := ComCall(12, this, "ptr", ppUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pUrl 
     * @returns {HRESULT} 
     */
    put_Url(pUrl) {
        pUrl := pUrl is String ? BSTR.Alloc(pUrl).Value : pUrl

        result := ComCall(13, this, "ptr", pUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppDescription 
     * @returns {HRESULT} 
     */
    get_Description(ppDescription) {
        result := ComCall(14, this, "ptr", ppDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pDescription 
     * @returns {HRESULT} 
     */
    put_Description(pDescription) {
        pDescription := pDescription is String ? BSTR.Alloc(pDescription).Value : pDescription

        result := ComCall(15, this, "ptr", pDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfEncrypted 
     * @returns {HRESULT} 
     */
    get_IsEncrypted(pfEncrypted) {
        result := ComCall(16, this, "ptr", pfEncrypted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fEncrypted 
     * @returns {HRESULT} 
     */
    put_IsEncrypted(fEncrypted) {
        result := ComCall(17, this, "short", fEncrypted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pDate 
     * @returns {HRESULT} 
     */
    get_StartTime(pDate) {
        result := ComCall(18, this, "double*", pDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Date 
     * @returns {HRESULT} 
     */
    put_StartTime(Date) {
        result := ComCall(19, this, "double", Date, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pDate 
     * @returns {HRESULT} 
     */
    get_StopTime(pDate) {
        result := ComCall(20, this, "double*", pDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Date 
     * @returns {HRESULT} 
     */
    put_StopTime(Date) {
        result := ComCall(21, this, "double", Date, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
