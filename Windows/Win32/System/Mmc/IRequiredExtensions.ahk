#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IRequiredExtensions interface is introduced in MMC 1.1.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-irequiredextensions
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IRequiredExtensions extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRequiredExtensions
     * @type {Guid}
     */
    static IID => Guid("{72782d7a-a4a0-11d1-af0f-00c04fb6dd2c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnableAllExtensions", "GetFirstExtension", "GetNextExtension"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-irequiredextensions-enableallextensions
     */
    EnableAllExtensions() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-irequiredextensions-getfirstextension
     */
    GetFirstExtension() {
        pExtCLSID := Guid()
        result := ComCall(4, this, "ptr", pExtCLSID, "HRESULT")
        return pExtCLSID
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-irequiredextensions-getnextextension
     */
    GetNextExtension() {
        pExtCLSID := Guid()
        result := ComCall(5, this, "ptr", pExtCLSID, "HRESULT")
        return pExtCLSID
    }
}
