#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.RemoteSystems
 * @version WindowsRuntime 1.4
 */
class IRemoteSystemAuthorizationKindFilter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRemoteSystemAuthorizationKindFilter
     * @type {Guid}
     */
    static IID => Guid("{6b0dde8e-04d0-40f4-a27f-c2acbbd6b734}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RemoteSystemAuthorizationKind"]

    /**
     * @type {Integer} 
     */
    RemoteSystemAuthorizationKind {
        get => this.get_RemoteSystemAuthorizationKind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RemoteSystemAuthorizationKind() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
