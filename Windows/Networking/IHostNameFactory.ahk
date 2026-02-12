#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include .\HostName.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking
 * @version WindowsRuntime 1.4
 */
class IHostNameFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostNameFactory
     * @type {Guid}
     */
    static IID => Guid("{458c23ed-712f-4576-adf1-c20b2c643558}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateHostName"]

    /**
     * 
     * @param {HSTRING} hostName_ 
     * @returns {HostName} 
     */
    CreateHostName(hostName_) {
        if(hostName_ is String) {
            pin := HSTRING.Create(hostName_)
            hostName_ := pin.Value
        }
        hostName_ := hostName_ is Win32Handle ? NumGet(hostName_, "ptr") : hostName_

        result := ComCall(6, this, "ptr", hostName_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HostName(value)
    }
}
