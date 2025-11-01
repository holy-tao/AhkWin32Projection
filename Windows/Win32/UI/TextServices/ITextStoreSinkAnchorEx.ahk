#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITextStoreAnchorSink.ahk

/**
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITextStoreSinkAnchorEx extends ITextStoreAnchorSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextStoreSinkAnchorEx
     * @type {Guid}
     */
    static IID => Guid("{25642426-028d-4474-977b-111bb114fe3e}")

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
