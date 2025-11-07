#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IMoniker.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables a linked object to provide its container with functions pertaining to linking.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-iolelink
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleLink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOleLink
     * @type {Guid}
     */
    static IID => Guid("{0000011d-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetUpdateOptions", "GetUpdateOptions", "SetSourceMoniker", "GetSourceMoniker", "SetSourceDisplayName", "GetSourceDisplayName", "BindToSource", "BindIfRunning", "GetBoundSource", "UnbindSource", "Update"]

    /**
     * 
     * @param {Integer} dwUpdateOpt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolelink-setupdateoptions
     */
    SetUpdateOptions(dwUpdateOpt) {
        result := ComCall(3, this, "uint", dwUpdateOpt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolelink-getupdateoptions
     */
    GetUpdateOptions() {
        result := ComCall(4, this, "uint*", &pdwUpdateOpt := 0, "HRESULT")
        return pdwUpdateOpt
    }

    /**
     * 
     * @param {IMoniker} pmk 
     * @param {Pointer<Guid>} rclsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolelink-setsourcemoniker
     */
    SetSourceMoniker(pmk, rclsid) {
        result := ComCall(5, this, "ptr", pmk, "ptr", rclsid, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMoniker} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolelink-getsourcemoniker
     */
    GetSourceMoniker() {
        result := ComCall(6, this, "ptr*", &ppmk := 0, "HRESULT")
        return IMoniker(ppmk)
    }

    /**
     * 
     * @param {PWSTR} pszStatusText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolelink-setsourcedisplayname
     */
    SetSourceDisplayName(pszStatusText) {
        pszStatusText := pszStatusText is String ? StrPtr(pszStatusText) : pszStatusText

        result := ComCall(7, this, "ptr", pszStatusText, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolelink-getsourcedisplayname
     */
    GetSourceDisplayName() {
        result := ComCall(8, this, "ptr*", &ppszDisplayName := 0, "HRESULT")
        return ppszDisplayName
    }

    /**
     * 
     * @param {Integer} bindflags 
     * @param {IBindCtx} pbc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolelink-bindtosource
     */
    BindToSource(bindflags, pbc) {
        result := ComCall(9, this, "uint", bindflags, "ptr", pbc, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolelink-bindifrunning
     */
    BindIfRunning() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolelink-getboundsource
     */
    GetBoundSource() {
        result := ComCall(11, this, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolelink-unbindsource
     */
    UnbindSource() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IBindCtx} pbc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/oleidl/nf-oleidl-iolelink-update
     */
    Update(pbc) {
        result := ComCall(13, this, "ptr", pbc, "HRESULT")
        return result
    }
}
