#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Manages metadata for an object.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfmetadata
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMetadata extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetLanguage", "GetLanguage", "GetAllLanguages", "SetProperty", "GetProperty", "DeleteProperty", "GetAllPropertyNames"]

    /**
     * 
     * @param {PWSTR} pwszRFC1766 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmetadata-setlanguage
     */
    SetLanguage(pwszRFC1766) {
        pwszRFC1766 := pwszRFC1766 is String ? StrPtr(pwszRFC1766) : pwszRFC1766

        result := ComCall(3, this, "ptr", pwszRFC1766, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmetadata-getlanguage
     */
    GetLanguage() {
        result := ComCall(4, this, "ptr*", &ppwszRFC1766 := 0, "HRESULT")
        return ppwszRFC1766
    }

    /**
     * 
     * @returns {PROPVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmetadata-getalllanguages
     */
    GetAllLanguages() {
        ppvLanguages := PROPVARIANT()
        result := ComCall(5, this, "ptr", ppvLanguages, "HRESULT")
        return ppvLanguages
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @param {Pointer<PROPVARIANT>} ppvValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmetadata-setproperty
     */
    SetProperty(pwszName, ppvValue) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(6, this, "ptr", pwszName, "ptr", ppvValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @returns {PROPVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmetadata-getproperty
     */
    GetProperty(pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        ppvValue := PROPVARIANT()
        result := ComCall(7, this, "ptr", pwszName, "ptr", ppvValue, "HRESULT")
        return ppvValue
    }

    /**
     * 
     * @param {PWSTR} pwszName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmetadata-deleteproperty
     */
    DeleteProperty(pwszName) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(8, this, "ptr", pwszName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PROPVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfmetadata-getallpropertynames
     */
    GetAllPropertyNames() {
        ppvNames := PROPVARIANT()
        result := ComCall(9, this, "ptr", ppvNames, "HRESULT")
        return ppvNames
    }
}
