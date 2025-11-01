#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMceBurnerControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMceBurnerControl
     * @type {Guid}
     */
    static IID => Guid("{5a86b91a-e71e-46c1-88a9-9bb338710552}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBurnerNoDecryption"]

    /**
     * 
     * @returns {HRESULT} 
     */
    GetBurnerNoDecryption() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
