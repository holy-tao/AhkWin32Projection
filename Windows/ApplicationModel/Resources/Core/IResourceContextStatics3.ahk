#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Resources.Core
 * @version WindowsRuntime 1.4
 */
class IResourceContextStatics3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceContextStatics3
     * @type {Guid}
     */
    static IID => Guid("{20cf492c-af0f-450b-9da6-106dd0c29a39}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetGlobalQualifierValueWithPersistence"]

    /**
     * 
     * @param {HSTRING} key 
     * @param {HSTRING} value 
     * @param {Integer} persistence 
     * @returns {HRESULT} 
     */
    SetGlobalQualifierValueWithPersistence(key, value, persistence) {
        if(key is String) {
            pin := HSTRING.Create(key)
            key := pin.Value
        }
        key := key is Win32Handle ? NumGet(key, "ptr") : key
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(6, this, "ptr", key, "ptr", value, "int", persistence, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
