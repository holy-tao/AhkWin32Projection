#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class IProtectionCapabilities extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IProtectionCapabilities
     * @type {Guid}
     */
    static IID => Guid("{c7ac5d7e-7480-4d29-a464-7bcd913dd8e4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsTypeSupported"]

    /**
     * 
     * @param {HSTRING} type 
     * @param {HSTRING} keySystem 
     * @returns {Integer} 
     */
    IsTypeSupported(type, keySystem) {
        if(type is String) {
            pin := HSTRING.Create(type)
            type := pin.Value
        }
        type := type is Win32Handle ? NumGet(type, "ptr") : type
        if(keySystem is String) {
            pin := HSTRING.Create(keySystem)
            keySystem := pin.Value
        }
        keySystem := keySystem is Win32Handle ? NumGet(keySystem, "ptr") : keySystem

        result := ComCall(6, this, "ptr", type, "ptr", keySystem, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
