#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\NamedPolicyData.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Policies
 * @version WindowsRuntime 1.4
 */
class INamedPolicyStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INamedPolicyStatics
     * @type {Guid}
     */
    static IID => Guid("{7f793be7-76c4-4058-8cad-67662cd05f0d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPolicyFromPath", "GetPolicyFromPathForUser"]

    /**
     * 
     * @param {HSTRING} area 
     * @param {HSTRING} name 
     * @returns {NamedPolicyData} 
     */
    GetPolicyFromPath(area, name) {
        if(area is String) {
            pin := HSTRING.Create(area)
            area := pin.Value
        }
        area := area is Win32Handle ? NumGet(area, "ptr") : area
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(6, this, "ptr", area, "ptr", name, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NamedPolicyData(result_)
    }

    /**
     * 
     * @param {User} user_ 
     * @param {HSTRING} area 
     * @param {HSTRING} name 
     * @returns {NamedPolicyData} 
     */
    GetPolicyFromPathForUser(user_, area, name) {
        if(area is String) {
            pin := HSTRING.Create(area)
            area := pin.Value
        }
        area := area is Win32Handle ? NumGet(area, "ptr") : area
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(7, this, "ptr", user_, "ptr", area, "ptr", name, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NamedPolicyData(result_)
    }
}
