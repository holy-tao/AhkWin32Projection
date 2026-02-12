#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RemoteSystemApp.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystemConnectionRequest2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystemConnectionRequest2
     * @type {Guid}
     */
    static IID => Guid("{12df6d6f-bffc-483a-8abe-d34a6c19f92b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RemoteSystemApp"]

    /**
     * @type {RemoteSystemApp} 
     */
    RemoteSystemApp {
        get => this.get_RemoteSystemApp()
    }

    /**
     * 
     * @returns {RemoteSystemApp} 
     */
    get_RemoteSystemApp() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteSystemApp(value)
    }
}
