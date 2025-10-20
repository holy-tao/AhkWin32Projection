#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class INetworkTransportSettings extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkTransportSettings
     * @type {Guid}
     */
    static IID => Guid("{5e7abb2c-f2c1-4a61-bd35-deb7a08ab0f1}")

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
     * @param {Pointer<TRANSPORT_SETTING_ID>} SettingId 
     * @param {Integer} LengthIn 
     * @param {Pointer<Integer>} ValueIn 
     * @param {Pointer<Integer>} LengthOut 
     * @param {Pointer<Pointer<Integer>>} ValueOut 
     * @returns {HRESULT} 
     */
    ApplySetting(SettingId, LengthIn, ValueIn, LengthOut, ValueOut) {
        result := ComCall(3, this, "ptr", SettingId, "uint", LengthIn, "char*", ValueIn, "uint*", LengthOut, "ptr*", ValueOut, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TRANSPORT_SETTING_ID>} SettingId 
     * @param {Integer} LengthIn 
     * @param {Pointer<Integer>} ValueIn 
     * @param {Pointer<Integer>} LengthOut 
     * @param {Pointer<Pointer<Integer>>} ValueOut 
     * @returns {HRESULT} 
     */
    QuerySetting(SettingId, LengthIn, ValueIn, LengthOut, ValueOut) {
        result := ComCall(4, this, "ptr", SettingId, "uint", LengthIn, "char*", ValueIn, "uint*", LengthOut, "ptr*", ValueOut, "HRESULT")
        return result
    }
}
