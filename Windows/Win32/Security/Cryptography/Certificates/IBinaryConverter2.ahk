#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IBinaryConverter.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IBinaryConverter2 extends IBinaryConverter{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBinaryConverter2
     * @type {Guid}
     */
    static IID => Guid("{8d7928b4-4e17-428d-9a17-728df00d1b2b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StringArrayToVariantArray", "VariantArrayToStringArray"]

    /**
     * 
     * @param {Pointer<VARIANT>} pvarStringArray 
     * @param {Pointer<VARIANT>} pvarVariantArray 
     * @returns {HRESULT} 
     */
    StringArrayToVariantArray(pvarStringArray, pvarVariantArray) {
        result := ComCall(10, this, "ptr", pvarStringArray, "ptr", pvarVariantArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvarVariantArray 
     * @param {Pointer<VARIANT>} pvarStringArray 
     * @returns {HRESULT} 
     */
    VariantArrayToStringArray(pvarVariantArray, pvarStringArray) {
        result := ComCall(11, this, "ptr", pvarVariantArray, "ptr", pvarStringArray, "HRESULT")
        return result
    }
}
