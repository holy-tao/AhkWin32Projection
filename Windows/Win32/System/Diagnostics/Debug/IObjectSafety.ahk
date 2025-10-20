#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IObjectSafety extends IUnknown{
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
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<UInt32>} pdwSupportedOptions 
     * @param {Pointer<UInt32>} pdwEnabledOptions 
     * @returns {HRESULT} 
     */
    GetInterfaceSafetyOptions(riid, pdwSupportedOptions, pdwEnabledOptions) {
        result := ComCall(3, this, "ptr", riid, "uint*", pdwSupportedOptions, "uint*", pdwEnabledOptions, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(4, this, "ptr", riid, "uint", dwOptionSetMask, "uint", dwEnabledOptions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
