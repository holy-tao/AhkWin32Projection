#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellFolder.ahk

/**
 * Extends the capabilities of IShellFolder. Its methods provide a variety of information about the contents of a Shell folder.
 * @remarks
 * 
  * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> interface, from which it inherits.
  * 
  * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
  * Implement <b>IShellFolder2</b> if your namespace extension provides services to clients beyond those in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>.
  * 
  * <h3><a id="When_to_Use"></a><a id="when_to_use"></a><a id="WHEN_TO_USE"></a>When to Use</h3>
  * Call <b>IShellFolder2</b> when you need detailed information on items contained by a Shell folder. This interface supersedes <a href="https://docs.microsoft.com/windows/desktop/api/shlobj_core/nn-shlobj_core-ishelldetails">IShellDetails</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ishellfolder2
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellFolder2 extends IShellFolder{
    /**
     * The interface identifier for IShellFolder2
     * @type {Guid}
     */
    static IID => Guid("{93f2f68c-1d1b-11d3-a30e-00c04f79abd1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * 
     * @param {Pointer<Guid>} pguid 
     * @returns {HRESULT} 
     */
    GetDefaultSearchGUID(pguid) {
        result := ComCall(13, this, "ptr", pguid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumExtraSearch>} ppenum 
     * @returns {HRESULT} 
     */
    EnumSearches(ppenum) {
        result := ComCall(14, this, "ptr", ppenum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRes 
     * @param {Pointer<UInt32>} pSort 
     * @param {Pointer<UInt32>} pDisplay 
     * @returns {HRESULT} 
     */
    GetDefaultColumn(dwRes, pSort, pDisplay) {
        result := ComCall(15, this, "uint", dwRes, "uint*", pSort, "uint*", pDisplay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iColumn 
     * @param {Pointer<Int32>} pcsFlags 
     * @returns {HRESULT} 
     */
    GetDefaultColumnState(iColumn, pcsFlags) {
        result := ComCall(16, this, "uint", iColumn, "int*", pcsFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Pointer<PROPERTYKEY>} pscid 
     * @param {Pointer<VARIANT>} pv 
     * @returns {HRESULT} 
     */
    GetDetailsEx(pidl, pscid, pv) {
        result := ComCall(17, this, "ptr", pidl, "ptr", pscid, "ptr", pv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITEMIDLIST>} pidl 
     * @param {Integer} iColumn 
     * @param {Pointer<SHELLDETAILS>} psd 
     * @returns {HRESULT} 
     */
    GetDetailsOf(pidl, iColumn, psd) {
        result := ComCall(18, this, "ptr", pidl, "uint", iColumn, "ptr", psd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} iColumn 
     * @param {Pointer<PROPERTYKEY>} pscid 
     * @returns {HRESULT} 
     */
    MapColumnToSCID(iColumn, pscid) {
        result := ComCall(19, this, "uint", iColumn, "ptr", pscid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
