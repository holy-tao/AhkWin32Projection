#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IObjectSafety extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectSafety
     * @type {Guid}
     */
    static IID => Guid("{cb5bdc81-93c1-11cf-8f20-00805f2cd064}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInterfaceSafetyOptions", "SetInterfaceSafetyOptions"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Integer>} pdwSupportedOptions 
     * @param {Pointer<Integer>} pdwEnabledOptions 
     * @returns {HRESULT} 
     */
    GetInterfaceSafetyOptions(riid, pdwSupportedOptions, pdwEnabledOptions) {
        pdwSupportedOptionsMarshal := pdwSupportedOptions is VarRef ? "uint*" : "ptr"
        pdwEnabledOptionsMarshal := pdwEnabledOptions is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", riid, pdwSupportedOptionsMarshal, pdwSupportedOptions, pdwEnabledOptionsMarshal, pdwEnabledOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Integer} dwOptionSetMask 
     * @param {Integer} dwEnabledOptions 
     * @returns {HRESULT} 
     */
    SetInterfaceSafetyOptions(riid, dwOptionSetMask, dwEnabledOptions) {
        result := ComCall(4, this, "ptr", riid, "uint", dwOptionSetMask, "uint", dwEnabledOptions, "HRESULT")
        return result
    }
}
