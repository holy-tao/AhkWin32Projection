#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The ICertificationAuthority interface represents a single certification authority. A collection of certification authorities is represented by the ICertificationAuthorities interface.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-icertificationauthority
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ICertificationAuthority extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertificationAuthority
     * @type {Guid}
     */
    static IID => Guid("{835d1f61-1e95-4bc8-b4d3-976c42b968f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Property"]

    /**
     * 
     * @param {Integer} property 
     * @param {Pointer<VARIANT>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-icertificationauthority-get_property
     */
    get_Property(property, pValue) {
        result := ComCall(7, this, "int", property, "ptr", pValue, "HRESULT")
        return result
    }
}
