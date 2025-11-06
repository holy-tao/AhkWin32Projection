#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\Extensions.ahk
#Include ..\Com\IDispatch.ahk

/**
 * 
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
     * @param {BOOL} Enable 
     * @returns {HRESULT} 
     */
    EnableAllExtensions(Enable) {
        result := ComCall(12, this, "int", Enable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} Enable 
     * @returns {HRESULT} 
     */
    Enable(Enable) {
        result := ComCall(13, this, "int", Enable, "HRESULT")
        return result
    }
}
