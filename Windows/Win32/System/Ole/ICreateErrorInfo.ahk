#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Returns error information.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/nn-oaidl-icreateerrorinfo
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class ICreateErrorInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICreateErrorInfo
     * @type {Guid}
     */
    static IID => Guid("{22f03340-547d-101b-8e65-08002b2bd119}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetGUID", "SetSource", "SetDescription", "SetHelpFile", "SetHelpContext"]

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreateerrorinfo-setguid
     */
    SetGUID(rguid) {
        result := ComCall(3, this, "ptr", rguid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szSource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreateerrorinfo-setsource
     */
    SetSource(szSource) {
        szSource := szSource is String ? StrPtr(szSource) : szSource

        result := ComCall(4, this, "ptr", szSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreateerrorinfo-setdescription
     */
    SetDescription(szDescription) {
        szDescription := szDescription is String ? StrPtr(szDescription) : szDescription

        result := ComCall(5, this, "ptr", szDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szHelpFile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreateerrorinfo-sethelpfile
     */
    SetHelpFile(szHelpFile) {
        szHelpFile := szHelpFile is String ? StrPtr(szHelpFile) : szHelpFile

        result := ComCall(6, this, "ptr", szHelpFile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwHelpContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oaidl/nf-oaidl-icreateerrorinfo-sethelpcontext
     */
    SetHelpContext(dwHelpContext) {
        result := ComCall(7, this, "uint", dwHelpContext, "HRESULT")
        return result
    }
}
