#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IValidate interface enables authoring tools to validate a Windows Installer package against a set of Internal Consistency Evaluators.
 * @see https://docs.microsoft.com/windows/win32/api//evalcom2/nn-evalcom2-ivalidate
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IValidate extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IValidate
     * @type {Guid}
     */
    static IID => Guid("{e482e5c6-e31e-4143-a2e6-dbc3d8e4b8d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OpenDatabase", "OpenCUB", "CloseDatabase", "CloseCUB", "SetDisplay", "SetStatus", "Validate"]

    /**
     * 
     * @param {PWSTR} szDatabase 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evalcom2/nf-evalcom2-ivalidate-opendatabase
     */
    OpenDatabase(szDatabase) {
        szDatabase := szDatabase is String ? StrPtr(szDatabase) : szDatabase

        result := ComCall(3, this, "ptr", szDatabase, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szCUBFile 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evalcom2/nf-evalcom2-ivalidate-opencub
     */
    OpenCUB(szCUBFile) {
        szCUBFile := szCUBFile is String ? StrPtr(szCUBFile) : szCUBFile

        result := ComCall(4, this, "ptr", szCUBFile, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evalcom2/nf-evalcom2-ivalidate-closedatabase
     */
    CloseDatabase() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evalcom2/nf-evalcom2-ivalidate-closecub
     */
    CloseCUB() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<LPDISPLAYVAL>} pDisplayFunction 
     * @param {Pointer<Void>} pContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evalcom2/nf-evalcom2-ivalidate-setdisplay
     */
    SetDisplay(pDisplayFunction, pContext) {
        result := ComCall(7, this, "ptr", pDisplayFunction, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<LPEVALCOMCALLBACK>} pStatusFunction 
     * @param {Pointer<Void>} pContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evalcom2/nf-evalcom2-ivalidate-setstatus
     */
    SetStatus(pStatusFunction, pContext) {
        result := ComCall(8, this, "ptr", pStatusFunction, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} wzICEs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evalcom2/nf-evalcom2-ivalidate-validate
     */
    Validate(wzICEs) {
        wzICEs := wzICEs is String ? StrPtr(wzICEs) : wzICEs

        result := ComCall(9, this, "ptr", wzICEs, "HRESULT")
        return result
    }
}
