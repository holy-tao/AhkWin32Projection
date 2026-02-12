#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnChannelConfiguration2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnChannelConfiguration2
     * @type {Guid}
     */
    static IID => Guid("{f30b574c-7824-471c-a118-63dbc93ae4c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ServerUris"]

    /**
     * @type {IVectorView<Uri>} 
     */
    ServerUris {
        get => this.get_ServerUris()
    }

    /**
     * 
     * @returns {IVectorView<Uri>} 
     */
    get_ServerUris() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(Uri, value)
    }
}
