#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class SnapIn extends IDispatch{
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
     * 
     * @param {Pointer<BSTR>} Name 
     * @returns {HRESULT} 
     */
    get_Name(Name) {
        result := ComCall(7, this, "ptr", Name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Vendor 
     * @returns {HRESULT} 
     */
    get_Vendor(Vendor) {
        result := ComCall(8, this, "ptr", Vendor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} Version 
     * @returns {HRESULT} 
     */
    get_Version(Version) {
        result := ComCall(9, this, "ptr", Version, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Extensions>} Extensions 
     * @returns {HRESULT} 
     */
    get_Extensions(Extensions) {
        result := ComCall(10, this, "ptr", Extensions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} SnapinCLSID 
     * @returns {HRESULT} 
     */
    get_SnapinCLSID(SnapinCLSID) {
        result := ComCall(11, this, "ptr", SnapinCLSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Properties>} Properties 
     * @returns {HRESULT} 
     */
    get_Properties(Properties) {
        result := ComCall(12, this, "ptr", Properties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} Enable 
     * @returns {HRESULT} 
     */
    EnableAllExtensions(Enable) {
        result := ComCall(13, this, "int", Enable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
