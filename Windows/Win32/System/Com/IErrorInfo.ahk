#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IUnknown.ahk

/**
 * Provides detailed contextual error information.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-ierrorinfo
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IErrorInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IErrorInfo
     * @type {Guid}
     */
    static IID => Guid("{1cf2b120-547d-101b-8e65-08002b2bd119}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGUID", "GetSource", "GetDescription", "GetHelpFile", "GetHelpContext"]

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ierrorinfo-getguid
     */
    GetGUID() {
        pGUID := Guid()
        result := ComCall(3, this, "ptr", pGUID, "HRESULT")
        return pGUID
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ierrorinfo-getsource
     */
    GetSource() {
        pBstrSource := BSTR()
        result := ComCall(4, this, "ptr", pBstrSource, "HRESULT")
        return pBstrSource
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ierrorinfo-getdescription
     */
    GetDescription() {
        pBstrDescription := BSTR()
        result := ComCall(5, this, "ptr", pBstrDescription, "HRESULT")
        return pBstrDescription
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ierrorinfo-gethelpfile
     */
    GetHelpFile() {
        pBstrHelpFile := BSTR()
        result := ComCall(6, this, "ptr", pBstrHelpFile, "HRESULT")
        return pBstrHelpFile
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ierrorinfo-gethelpcontext
     */
    GetHelpContext() {
        result := ComCall(7, this, "uint*", &pdwHelpContext := 0, "HRESULT")
        return pdwHelpContext
    }
}
