#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMExtensionFileOpenPickerInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPMExtensionFileOpenPickerInfo
     * @type {Guid}
     */
    static IID => Guid("{6dc91d25-9606-420c-9a78-e034a3418345}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllFileTypes", "get_SupportsAllFileTypes"]

    /**
     * 
     * @param {Pointer<Integer>} pcTypes 
     * @param {Pointer<Pointer<BSTR>>} ppTypes 
     * @returns {HRESULT} 
     */
    get_AllFileTypes(pcTypes, ppTypes) {
        result := ComCall(3, this, "uint*", pcTypes, "ptr*", ppTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pSupportsAllTypes 
     * @returns {HRESULT} 
     */
    get_SupportsAllFileTypes(pSupportsAllTypes) {
        result := ComCall(4, this, "ptr", pSupportsAllTypes, "HRESULT")
        return result
    }
}
