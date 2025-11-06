#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IInterFilterCommunicator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInterFilterCommunicator
     * @type {Guid}
     */
    static IID => Guid("{4daf1e69-81fd-462d-940f-8cd3ddf56fca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestReader", "RequestWriter"]

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    RequestReader() {
        result := ComCall(3, this, "ptr*", &ppIReader := 0, "HRESULT")
        return ppIReader
    }

    /**
     * 
     * @returns {Pointer<Void>} 
     */
    RequestWriter() {
        result := ComCall(4, this, "ptr*", &ppIWriter := 0, "HRESULT")
        return ppIWriter
    }
}
