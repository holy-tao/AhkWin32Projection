#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IXFeedItem.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IXFeedItem2 extends IXFeedItem{
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
     * 
     * @param {Pointer<UInt32>} puiEffectiveId 
     * @returns {HRESULT} 
     */
    EffectiveId(puiEffectiveId) {
        result := ComCall(20, this, "uint*", puiEffectiveId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
