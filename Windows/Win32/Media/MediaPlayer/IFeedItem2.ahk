#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFeedItem.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IFeedItem2 extends IFeedItem{
    /**
     * The interface identifier for IFeedItem2
     * @type {Guid}
     */
    static IID => Guid("{79ac9ef4-f9c1-4d2b-a50b-a7ffba4dcf37}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 24

    /**
     * 
     * @param {Pointer<Int32>} effectiveId 
     * @returns {HRESULT} 
     */
    get_EffectiveId(effectiveId) {
        result := ComCall(24, this, "int*", effectiveId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
