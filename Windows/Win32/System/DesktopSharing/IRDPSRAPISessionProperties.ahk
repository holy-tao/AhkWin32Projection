#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Use this interface to get or set session properties.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapisessionproperties
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPISessionProperties extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPISessionProperties
     * @type {Guid}
     */
    static IID => Guid("{339b24f2-9bc0-4f16-9aac-f165433d13d4}")

    /**
     * The class identifier for RDPSRAPISessionProperties
     * @type {Guid}
     */
    static CLSID => Guid("{dd7594ff-ea2a-4c06-8fdf-132de48b6510}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Property", "put_Property"]

    /**
     * 
     * @param {BSTR} PropertyName 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisessionproperties-get_property
     */
    get_Property(PropertyName, pVal) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(7, this, "ptr", PropertyName, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} PropertyName 
     * @param {VARIANT} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapisessionproperties-put_property
     */
    put_Property(PropertyName, newVal) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(8, this, "ptr", PropertyName, "ptr", newVal, "HRESULT")
        return result
    }
}
