#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class ITransportSettingsInternal extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransportSettingsInternal
     * @type {Guid}
     */
    static IID => Guid("{5123e076-29e3-4bfd-84fe-0192d411e3e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ApplySetting", "QuerySetting"]

    /**
     * 
     * @param {Pointer<TRANSPORT_SETTING>} Setting 
     * @returns {HRESULT} 
     */
    ApplySetting(Setting) {
        result := ComCall(3, this, "ptr", Setting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TRANSPORT_SETTING>} Setting 
     * @returns {HRESULT} 
     */
    QuerySetting(Setting) {
        result := ComCall(4, this, "ptr", Setting, "HRESULT")
        return result
    }
}
