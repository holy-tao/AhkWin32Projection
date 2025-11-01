#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMExtensionFileSavePickerInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPMExtensionFileSavePickerInfo
     * @type {Guid}
     */
    static IID => Guid("{38005cba-f81a-493e-a0f8-922c8680da43}")

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

        result := ComCall(3, this, pcTypesMarshal, pcTypes, "ptr*", ppTypes, "HRESULT")
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
