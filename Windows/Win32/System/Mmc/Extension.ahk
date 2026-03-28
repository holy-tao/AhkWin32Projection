#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\Extensions.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents a single certificate extension.
 * @remarks
 * The **Extension** object has these types of members:
 * 
 * -   [Properties](#properties)
 * 
 * 
 * The **Extension** object cannot be created.
 * 
 * The **Extension** object is used by the [**Extensions**](extensions.md) collection object.
 * @see https://learn.microsoft.com/windows/win32/SecCrypto/extension
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class Extension extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for Extension
     * @type {Guid}
     */
    static IID => Guid("{ad4d6ca6-912f-409b-a26e-7fd234aef542}")

    /**
     * The class identifier for Extension
     * @type {Guid}
     */
    static CLSID => Guid("{ad4d6ca6-912f-409b-a26e-7fd234aef542}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Vendor", "get_Version", "get_Extensions", "get_SnapinCLSID", "EnableAllExtensions", "Enable"]

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    Vendor {
        get => this.get_Vendor()
    }

    /**
     * @type {BSTR} 
     */
    Version {
        get => this.get_Version()
    }

    /**
     * @type {Extensions} 
     */
    Extensions {
        get => this.get_Extensions()
    }

    /**
     * @type {BSTR} 
     */
    SnapinCLSID {
        get => this.get_SnapinCLSID()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        Name := BSTR()
        result := ComCall(7, this, "ptr", Name, "HRESULT")
        return Name
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Vendor() {
        Vendor := BSTR()
        result := ComCall(8, this, "ptr", Vendor, "HRESULT")
        return Vendor
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Version() {
        _Version := BSTR()
        result := ComCall(9, this, "ptr", _Version, "HRESULT")
        return _Version
    }

    /**
     * 
     * @returns {Extensions} 
     */
    get_Extensions() {
        result := ComCall(10, this, "ptr*", &_Extensions := 0, "HRESULT")
        return Extensions(_Extensions)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_SnapinCLSID() {
        SnapinCLSID := BSTR()
        result := ComCall(11, this, "ptr", SnapinCLSID, "HRESULT")
        return SnapinCLSID
    }

    /**
     * 
     * @param {BOOL} Enable 
     * @returns {HRESULT} 
     */
    EnableAllExtensions(Enable) {
        result := ComCall(12, this, "int", Enable, "HRESULT")
        return result
    }

    /**
     * Enables monitoring on a particular drive.
     * @remarks
     * The **Enable** method does not wait for monitoring to be enabled completely before it returns, because this could take a while. Instead, it returns immediately after starting the System Restore service and filter driver.
     * 
     * To enable System Restore on a non-system drive, you must first enable System Restore on the system drive.
     * 
     * This method fails in safe mode.
     * @param {BOOL} Enable 
     * @returns {HRESULT} If the method succeeds, the return value is S\_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/sr/enable-systemrestore
     */
    Enable(Enable) {
        result := ComCall(13, this, "int", Enable, "HRESULT")
        return result
    }
}
