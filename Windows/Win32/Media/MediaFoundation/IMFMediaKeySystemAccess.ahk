#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaKeys2.ahk
#Include ..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaKeySystemAccess extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaKeySystemAccess
     * @type {Guid}
     */
    static IID => Guid("{aec63fda-7a97-4944-b35c-6c6df8085cc3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMediaKeys", "get_SupportedConfiguration", "get_KeySystem"]

    /**
     * 
     * @param {IPropertyStore} pCdmCustomConfig 
     * @returns {IMFMediaKeys2} 
     */
    CreateMediaKeys(pCdmCustomConfig) {
        result := ComCall(3, this, "ptr", pCdmCustomConfig, "ptr*", &ppKeys := 0, "HRESULT")
        return IMFMediaKeys2(ppKeys)
    }

    /**
     * 
     * @returns {IPropertyStore} 
     */
    get_SupportedConfiguration() {
        result := ComCall(4, this, "ptr*", &ppSupportedConfiguration := 0, "HRESULT")
        return IPropertyStore(ppSupportedConfiguration)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_KeySystem() {
        pKeySystem := BSTR()
        result := ComCall(5, this, "ptr", pKeySystem, "HRESULT")
        return pKeySystem
    }
}
