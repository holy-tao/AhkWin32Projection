#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Guid>} pGUID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ierrorinfo-getguid
     */
    GetGUID(pGUID) {
        result := ComCall(3, this, "ptr", pGUID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBstrSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ierrorinfo-getsource
     */
    GetSource(pBstrSource) {
        result := ComCall(4, this, "ptr", pBstrSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ierrorinfo-getdescription
     */
    GetDescription(pBstrDescription) {
        result := ComCall(5, this, "ptr", pBstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pBstrHelpFile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ierrorinfo-gethelpfile
     */
    GetHelpFile(pBstrHelpFile) {
        result := ComCall(6, this, "ptr", pBstrHelpFile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwHelpContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-ierrorinfo-gethelpcontext
     */
    GetHelpContext(pdwHelpContext) {
        result := ComCall(7, this, "uint*", pdwHelpContext, "HRESULT")
        return result
    }
}
