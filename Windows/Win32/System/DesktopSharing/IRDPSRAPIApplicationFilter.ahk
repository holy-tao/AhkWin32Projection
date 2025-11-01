#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Manages the shared desktop area at the window and process level. Applications can use the enumerators to display lists of objects in the session that can be shared.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapiapplicationfilter
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPIApplicationFilter extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPIApplicationFilter
     * @type {Guid}
     */
    static IID => Guid("{d20f10ca-6637-4f06-b1d5-277ea7e5160d}")

    /**
     * The class identifier for RDPSRAPIApplicationFilter
     * @type {Guid}
     */
    static CLSID => Guid("{e35ace89-c7e8-427e-a4f9-b9da072826bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Applications", "get_Windows", "get_Enabled", "put_Enabled"]

    /**
     * 
     * @param {Pointer<IRDPSRAPIApplicationList>} pApplications 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplicationfilter-get_applications
     */
    get_Applications(pApplications) {
        result := ComCall(7, this, "ptr*", pApplications, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IRDPSRAPIWindowList>} pWindows 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplicationfilter-get_windows
     */
    get_Windows(pWindows) {
        result := ComCall(8, this, "ptr*", pWindows, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pRetVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplicationfilter-get_enabled
     */
    get_Enabled(pRetVal) {
        result := ComCall(9, this, "ptr", pRetVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} NewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapiapplicationfilter-put_enabled
     */
    put_Enabled(NewVal) {
        result := ComCall(10, this, "short", NewVal, "HRESULT")
        return result
    }
}
