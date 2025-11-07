#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include .\IDebugHostType3.ahk
#Include .\IDebugHostType2.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class IDebugHostType3 extends IDebugHostType2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDebugHostType3
     * @type {Guid}
     */
    static IID => Guid("{8b0409ac-c1bb-433d-887a-ed12c3af0e7d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 34

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetContainingType"]

    /**
     * 
     * @returns {IDebugHostType3} 
     */
    GetContainingType() {
        result := ComCall(34, this, "ptr*", &containingParentType := 0, "HRESULT")
        return IDebugHostType3(containingParentType)
    }
}
