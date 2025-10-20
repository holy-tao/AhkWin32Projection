#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Manages metadata for an object.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfmetadata
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMetadata extends IUnknown{
    /**
     * The interface identifier for IMFMetadata
     * @type {Guid}
     */
    static IID => Guid("{f88cfb8c-ef16-4991-b450-cb8c69e51704}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} pwszRFC1766 
     * @returns {HRESULT} 
     */
    SetLanguage(pwszRFC1766) {
        pwszRFC1766 := pwszRFC1766 is String ? StrPtr(pwszRFC1766) : pwszRFC1766

        result := ComCall(3, this, "ptr", pwszRFC1766, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwszRFC1766 
     * @returns {HRESULT} 
     */
    GetLanguage(ppwszRFC1766) {
        result := ComCall(4, this, "ptr", ppwszRFC1766, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} ppvLanguages 
     * @returns {HRESULT} 
     */
    GetAllLanguages(ppvLanguages) {
        result := ComCall(5, this, "ptr", ppvLanguages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Pointer<PROPVARIANT>} ppvValue 
     * @returns {HRESULT} 
     */
    SetProperty(pwszName, ppvValue) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(6, this, "ptr", pwszName, "ptr", ppvValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Pointer<PROPVARIANT>} ppvValue 
     * @returns {HRESULT} 
     */
    GetProperty(pwszName, ppvValue) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(7, this, "ptr", pwszName, "ptr", ppvValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @returns {HRESULT} 
     */
    DeleteProperty(pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(8, this, "ptr", pwszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPVARIANT>} ppvNames 
     * @returns {HRESULT} 
     */
    GetAllPropertyNames(ppvNames) {
        result := ComCall(9, this, "ptr", ppvNames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
