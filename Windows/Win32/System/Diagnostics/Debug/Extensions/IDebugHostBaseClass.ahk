#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostSymbol.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostBaseClass extends IDebugHostSymbol{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostBaseClass
     * @type {Guid}
     */
    static IID => Guid("{b94d57d2-390b-40f7-b5b4-b6db897d974b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 10

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOffset"]

    /**
     * 
     * @returns {Integer} 
     */
    GetOffset() {
        result := ComCall(10, this, "uint*", &offset := 0, "HRESULT")
        return offset
    }
}
