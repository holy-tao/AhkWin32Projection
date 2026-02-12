#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RemoteSystem.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Networking\HostName.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystemSessionParticipant extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystemSessionParticipant
     * @type {Guid}
     */
    static IID => Guid("{7e90058c-acf9-4729-8a17-44e7baed5dcc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RemoteSystem", "GetHostNames"]

    /**
     * @type {RemoteSystem} 
     */
    RemoteSystem {
        get => this.get_RemoteSystem()
    }

    /**
     * 
     * @returns {RemoteSystem} 
     */
    get_RemoteSystem() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteSystem(value)
    }

    /**
     * 
     * @returns {IVectorView<HostName>} 
     */
    GetHostNames() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(HostName, result_)
    }
}
