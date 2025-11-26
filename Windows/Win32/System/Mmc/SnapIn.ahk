#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\Extensions.ahk
#Include .\Properties.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class SnapIn extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for SnapIn
     * @type {Guid}
     */
    static IID => Guid("{3be910f6-3459-49c6-a1bb-41e6be9df3ea}")

    /**
     * The class identifier for SnapIn
     * @type {Guid}
     */
    static CLSID => Guid("{3be910f6-3459-49c6-a1bb-41e6be9df3ea}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Vendor", "get_Version", "get_Extensions", "get_SnapinCLSID", "get_Properties", "EnableAllExtensions"]

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
     * @type {Properties} 
     */
    Properties {
        get => this.get_Properties()
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
        Version := BSTR()
        result := ComCall(9, this, "ptr", Version, "HRESULT")
        return Version
    }

    /**
     * 
     * @returns {Extensions} 
     */
    get_Extensions() {
        result := ComCall(10, this, "ptr*", &Extensions := 0, "HRESULT")
        return Extensions(Extensions)
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
     * @returns {Properties} 
     */
    get_Properties() {
        result := ComCall(12, this, "ptr*", &Properties := 0, "HRESULT")
        return Properties(Properties)
    }

    /**
     * 
     * @param {BOOL} Enable 
     * @returns {HRESULT} 
     */
    EnableAllExtensions(Enable) {
        result := ComCall(13, this, "int", Enable, "HRESULT")
        return result
    }
}
