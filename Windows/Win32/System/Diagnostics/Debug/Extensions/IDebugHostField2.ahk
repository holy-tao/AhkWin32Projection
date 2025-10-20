#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostField.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostField2 extends IDebugHostField{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostField2
     * @type {Guid}
     */
    static IID => Guid("{99468a0b-ea92-4bd4-9efe-a266160578ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetContainingType"]

    /**
     * 
     * @param {Pointer<IDebugHostType3>} containingParentType 
     * @returns {HRESULT} 
     */
    GetContainingType(containingParentType) {
        result := ComCall(14, this, "ptr*", containingParentType, "HRESULT")
        return result
    }
}
