#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\HostName.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnChannelConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnChannelConfiguration
     * @type {Guid}
     */
    static IID => Guid("{0e2ddca2-2012-4fe4-b179-8c652c6d107e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ServerServiceName", "get_ServerHostNameList", "get_CustomField"]

    /**
     * @type {HSTRING} 
     */
    ServerServiceName {
        get => this.get_ServerServiceName()
    }

    /**
     * @type {IVectorView<HostName>} 
     */
    ServerHostNameList {
        get => this.get_ServerHostNameList()
    }

    /**
     * @type {HSTRING} 
     */
    CustomField {
        get => this.get_CustomField()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ServerServiceName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<HostName>} 
     */
    get_ServerHostNameList() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(HostName, value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CustomField() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
