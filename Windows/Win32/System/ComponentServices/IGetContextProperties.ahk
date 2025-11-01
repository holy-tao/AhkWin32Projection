#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables the caller to obtain the properties associated with the current object's context.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-igetcontextproperties
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IGetContextProperties extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGetContextProperties
     * @type {Guid}
     */
    static IID => Guid("{51372af4-cae7-11cf-be81-00aa00a2fa25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Count", "GetProperty", "EnumNames"]

    /**
     * 
     * @param {Pointer<Integer>} plCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-igetcontextproperties-count
     */
    Count(plCount) {
        plCountMarshal := plCount is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, plCountMarshal, plCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<VARIANT>} pProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-igetcontextproperties-getproperty
     */
    GetProperty(name, pProperty) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(4, this, "ptr", name, "ptr", pProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumNames>} ppenum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-igetcontextproperties-enumnames
     */
    EnumNames(ppenum) {
        result := ComCall(5, this, "ptr*", ppenum, "HRESULT")
        return result
    }
}
