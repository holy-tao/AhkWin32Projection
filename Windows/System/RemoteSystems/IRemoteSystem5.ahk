#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\RemoteSystemApp.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystem5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystem5
     * @type {Guid}
     */
    static IID => Guid("{eb2ad723-e5e2-4ae2-a7a7-a1097a098e90}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Apps"]

    /**
     * @type {IVectorView<RemoteSystemApp>} 
     */
    Apps {
        get => this.get_Apps()
    }

    /**
     * 
     * @returns {IVectorView<RemoteSystemApp>} 
     */
    get_Apps() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(RemoteSystemApp, value)
    }
}
