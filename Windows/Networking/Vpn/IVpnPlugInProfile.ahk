#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnPlugInProfile extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnPlugInProfile
     * @type {Guid}
     */
    static IID => Guid("{0edf0da4-4f00-4589-8d7b-4bf988f6542c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ServerUris", "get_CustomConfiguration", "put_CustomConfiguration", "get_VpnPluginPackageFamilyName", "put_VpnPluginPackageFamilyName"]

    /**
     * @type {IVector<Uri>} 
     */
    ServerUris {
        get => this.get_ServerUris()
    }

    /**
     * @type {HSTRING} 
     */
    CustomConfiguration {
        get => this.get_CustomConfiguration()
        set => this.put_CustomConfiguration(value)
    }

    /**
     * @type {HSTRING} 
     */
    VpnPluginPackageFamilyName {
        get => this.get_VpnPluginPackageFamilyName()
        set => this.put_VpnPluginPackageFamilyName(value)
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_ServerUris() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Uri, value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CustomConfiguration() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CustomConfiguration(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_VpnPluginPackageFamilyName() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_VpnPluginPackageFamilyName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
