#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrinterExtensionAsyncOperation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrinterExtensionAsyncOperation
     * @type {Guid}
     */
    static IID => Guid("{108d6a23-6a4b-4552-9448-68b427186acd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Cancel"]

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
