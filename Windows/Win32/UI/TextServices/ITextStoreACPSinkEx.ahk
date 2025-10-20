#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITextStoreACPSink.ahk

/**
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITextStoreACPSinkEx extends ITextStoreACPSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextStoreACPSinkEx
     * @type {Guid}
     */
    static IID => Guid("{2bdf9464-41e2-43e3-950c-a6865ba25cd4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnDisconnect"]

    /**
     * 
     * @returns {HRESULT} 
     */
    OnDisconnect() {
        result := ComCall(11, this, "HRESULT")
        return result
    }
}
