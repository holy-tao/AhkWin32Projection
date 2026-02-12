#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnDomainNameInfo2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnDomainNameInfo2
     * @type {Guid}
     */
    static IID => Guid("{ab871151-6c53-4828-9883-d886de104407}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_WebProxyUris"]

    /**
     * @type {IVector<Uri>} 
     */
    WebProxyUris {
        get => this.get_WebProxyUris()
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_WebProxyUris() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Uri, value)
    }
}
