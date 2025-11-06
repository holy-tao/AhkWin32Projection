#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellUIHelper8.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellUIHelper9 extends IShellUIHelper8{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellUIHelper9
     * @type {Guid}
     */
    static IID => Guid("{6cdf73b0-7f2f-451f-bc0f-63e0f3284e54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 104

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetOSSku"]

    /**
     * 
     * @returns {Integer} 
     */
    GetOSSku() {
        result := ComCall(104, this, "uint*", &pdwResult := 0, "HRESULT")
        return pdwResult
    }
}
