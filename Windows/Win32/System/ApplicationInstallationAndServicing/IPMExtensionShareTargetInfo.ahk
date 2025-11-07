#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMExtensionShareTargetInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPMExtensionShareTargetInfo
     * @type {Guid}
     */
    static IID => Guid("{5471f48b-c65c-4656-8c70-242e31195fea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllFileTypes", "get_AllDataFormats", "get_SupportsAllFileTypes"]

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
     * @param {Pointer<Integer>} pcDataFormats 
     * @param {Pointer<Pointer<BSTR>>} ppDataFormats 
     * @returns {HRESULT} 
     */
    get_AllDataFormats(pcDataFormats, ppDataFormats) {
        pcDataFormatsMarshal := pcDataFormats is VarRef ? "uint*" : "ptr"
        ppDataFormatsMarshal := ppDataFormats is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, pcDataFormatsMarshal, pcDataFormats, ppDataFormatsMarshal, ppDataFormats, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_SupportsAllFileTypes() {
        result := ComCall(5, this, "int*", &pSupportsAllTypes := 0, "HRESULT")
        return pSupportsAllTypes
    }
}
