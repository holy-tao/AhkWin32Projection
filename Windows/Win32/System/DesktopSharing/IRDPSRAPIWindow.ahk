#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents a one-to-one mapping to a sharable window.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapiwindow
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIWindow extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPIWindow
     * @type {Guid}
     */
    static IID => Guid("{beafe0f9-c77b-4933-ba9f-a24cddcc27cf}")

    /**
     * The class identifier for RDPSRAPIWindow
     * @type {Guid}
     */
    static CLSID => Guid("{03cf46db-ce45-4d36-86ed-ed28b74398bf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_Application", "get_Shared", "put_Shared", "get_Name", "Show", "get_Flags"]

    /**
     * 
     * @param {Pointer<Integer>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiwindow-get_id
     */
    get_Id(pRetVal) {
        result := ComCall(7, this, "int*", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPIApplication>} pApplication 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiwindow-get_application
     */
    get_Application(pApplication) {
        result := ComCall(8, this, "ptr*", pApplication, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiwindow-get_shared
     */
    get_Shared(pRetVal) {
        result := ComCall(9, this, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} NewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiwindow-put_shared
     */
    put_Shared(NewVal) {
        result := ComCall(10, this, "short", NewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiwindow-get_name
     */
    get_Name(pRetVal) {
        result := ComCall(11, this, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiwindow-show
     */
    Show() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiwindow-get_flags
     */
    get_Flags(pdwFlags) {
        result := ComCall(13, this, "uint*", pdwFlags, "HRESULT")
        return result
    }
}
