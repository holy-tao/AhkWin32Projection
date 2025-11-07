#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHandlerInfo.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IHandlerInfo2 extends IHandlerInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHandlerInfo2
     * @type {Guid}
     */
    static IID => Guid("{31cca04c-04d3-4ea9-90de-97b15e87a532}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetApplicationId"]

    /**
     * 
     * @returns {PWSTR} 
     */
    GetApplicationId() {
        result := ComCall(6, this, "ptr*", &value := 0, "HRESULT")
        return value
    }
}
