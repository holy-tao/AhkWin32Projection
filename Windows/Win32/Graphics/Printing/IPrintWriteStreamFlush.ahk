#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintWriteStreamFlush extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintWriteStreamFlush
     * @type {Guid}
     */
    static IID => Guid("{07d11ff8-1753-4873-b749-6cdaf068e4c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FlushData"]

    /**
     * 
     * @returns {HRESULT} 
     */
    FlushData() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
