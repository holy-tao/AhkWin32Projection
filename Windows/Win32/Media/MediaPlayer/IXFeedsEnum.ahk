#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IXFeedsEnum extends IUnknown{
    /**
     * The interface identifier for IXFeedsEnum
     * @type {Guid}
     */
    static IID => Guid("{dc43a9d5-5015-4301-8c96-a47434b4d658}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} puiCount 
     * @returns {HRESULT} 
     */
    Count(puiCount) {
        result := ComCall(3, this, "uint*", puiCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uiIndex 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    Item(uiIndex, riid, ppv) {
        result := ComCall(4, this, "uint", uiIndex, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
