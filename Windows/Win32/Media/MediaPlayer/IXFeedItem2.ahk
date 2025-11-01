#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXFeedItem.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IXFeedItem2 extends IXFeedItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXFeedItem2
     * @type {Guid}
     */
    static IID => Guid("{6cda2dc7-9013-4522-9970-2a9dd9ead5a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EffectiveId"]

    /**
     * 
     * @param {Pointer<Integer>} puiEffectiveId 
     * @returns {HRESULT} 
     */
    EffectiveId(puiEffectiveId) {
        result := ComCall(20, this, "uint*", puiEffectiveId, "HRESULT")
        return result
    }
}
