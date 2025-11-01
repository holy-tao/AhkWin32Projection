#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Groups the sharable windows within a process. Each application object contains a list of window objects. If an application object is shared, all its windows are shared.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapiapplication
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIApplication extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPIApplication
     * @type {Guid}
     */
    static IID => Guid("{41e7a09d-eb7a-436e-935d-780ca2628324}")

    /**
     * The class identifier for RDPSRAPIApplication
     * @type {Guid}
     */
    static CLSID => Guid("{c116a484-4b25-4b9f-8a54-b934b06e57fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Windows", "get_Id", "get_Shared", "put_Shared", "get_Name", "get_Flags"]

    /**
     * 
     * @param {Pointer<IRDPSRAPIWindowList>} pWindowList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplication-get_windows
     */
    get_Windows(pWindowList) {
        result := ComCall(7, this, "ptr*", pWindowList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplication-get_id
     */
    get_Id(pRetVal) {
        pRetValMarshal := pRetVal is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, pRetValMarshal, pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplication-get_shared
     */
    get_Shared(pRetVal) {
        result := ComCall(9, this, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} NewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplication-put_shared
     */
    put_Shared(NewVal) {
        result := ComCall(10, this, "short", NewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplication-get_name
     */
    get_Name(pRetVal) {
        result := ComCall(11, this, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplication-get_flags
     */
    get_Flags(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }
}
