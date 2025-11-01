#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMExtensionInfoEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPMExtensionInfoEnumerator
     * @type {Guid}
     */
    static IID => Guid("{403b9e82-1171-4573-8e6f-6f33f39b83dd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Next"]

    /**
     * 
     * @param {Pointer<IPMExtensionInfo>} ppExtensionInfo 
     * @returns {HRESULT} 
     */
    get_Next(ppExtensionInfo) {
        result := ComCall(3, this, "ptr*", ppExtensionInfo, "HRESULT")
        return result
    }
}
