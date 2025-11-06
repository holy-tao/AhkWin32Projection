#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IMFMediaKeySystemAccess.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaEngineClassFactory3 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaEngineClassFactory3
     * @type {Guid}
     */
    static IID => Guid("{3787614f-65f7-4003-b673-ead8293a0e60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMediaKeySystemAccess"]

    /**
     * 
     * @param {BSTR} keySystem 
     * @param {Pointer<IPropertyStore>} ppSupportedConfigurationsArray 
     * @param {Integer} uSize 
     * @returns {IMFMediaKeySystemAccess} 
     */
    CreateMediaKeySystemAccess(keySystem, ppSupportedConfigurationsArray, uSize) {
        keySystem := keySystem is String ? BSTR.Alloc(keySystem).Value : keySystem

        result := ComCall(3, this, "ptr", keySystem, "ptr*", ppSupportedConfigurationsArray, "uint", uSize, "ptr*", &ppKeyAccess := 0, "HRESULT")
        return IMFMediaKeySystemAccess(ppKeyAccess)
    }
}
