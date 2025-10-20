#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMetaDataValidate extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMetaDataValidate
     * @type {Guid}
     */
    static IID => Guid("{4709c9c6-81ff-11d3-9fc7-00c04f79a0a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ValidatorInit", "ValidateMetaData"]

    /**
     * 
     * @param {Integer} dwModuleType 
     * @param {IUnknown} pUnk 
     * @returns {HRESULT} 
     */
    ValidatorInit(dwModuleType, pUnk) {
        result := ComCall(3, this, "uint", dwModuleType, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ValidateMetaData() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
