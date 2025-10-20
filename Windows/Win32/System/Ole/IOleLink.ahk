#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables a linked object to provide its container with functions pertaining to linking.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/nn-oleidl-iolelink
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IOleLink extends IUnknown{
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
     * 
     * @param {Integer} dwUpdateOpt 
     * @returns {HRESULT} 
     */
    SetUpdateOptions(dwUpdateOpt) {
        result := ComCall(3, this, "uint", dwUpdateOpt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwUpdateOpt 
     * @returns {HRESULT} 
     */
    GetUpdateOptions(pdwUpdateOpt) {
        result := ComCall(4, this, "uint*", pdwUpdateOpt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMoniker>} pmk 
     * @param {Pointer<Guid>} rclsid 
     * @returns {HRESULT} 
     */
    SetSourceMoniker(pmk, rclsid) {
        result := ComCall(5, this, "ptr", pmk, "ptr", rclsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMoniker>} ppmk 
     * @returns {HRESULT} 
     */
    GetSourceMoniker(ppmk) {
        result := ComCall(6, this, "ptr", ppmk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszStatusText 
     * @returns {HRESULT} 
     */
    SetSourceDisplayName(pszStatusText) {
        pszStatusText := pszStatusText is String ? StrPtr(pszStatusText) : pszStatusText

        result := ComCall(7, this, "ptr", pszStatusText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszDisplayName 
     * @returns {HRESULT} 
     */
    GetSourceDisplayName(ppszDisplayName) {
        result := ComCall(8, this, "ptr", ppszDisplayName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} bindflags 
     * @param {Pointer<IBindCtx>} pbc 
     * @returns {HRESULT} 
     */
    BindToSource(bindflags, pbc) {
        result := ComCall(9, this, "uint", bindflags, "ptr", pbc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BindIfRunning() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    GetBoundSource(ppunk) {
        result := ComCall(11, this, "ptr", ppunk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnbindSource() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IBindCtx>} pbc 
     * @returns {HRESULT} 
     */
    Update(pbc) {
        result := ComCall(13, this, "ptr", pbc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
