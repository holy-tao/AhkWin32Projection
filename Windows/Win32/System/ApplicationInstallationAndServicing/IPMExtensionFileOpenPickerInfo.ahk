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
        pcTypesMarshal := pcTypes is VarRef ? "uint*" : "ptr"
        ppTypesMarshal := ppTypes is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pcTypesMarshal, pcTypes, ppTypesMarshal, ppTypes, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_SupportsAllFileTypes() {
        result := ComCall(4, this, "int*", &pSupportsAllTypes := 0, "HRESULT")
        return pSupportsAllTypes
    }
}
