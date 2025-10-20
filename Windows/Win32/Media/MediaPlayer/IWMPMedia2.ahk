#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPMedia.ahk

/**
 * The IWMPMedia2 interface provides a method that supplements the IWMPMedia interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpmedia2
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPMedia2 extends IWMPMedia{
    /**
     * The interface identifier for IWMPMedia2
     * @type {Guid}
     */
    static IID => Guid("{ab7c88bb-143e-4ea4-acc3-e4350b2106c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * 
     * @param {Pointer<IWMPErrorItem>} ppIWMPErrorItem 
     * @returns {HRESULT} 
     */
    get_error(ppIWMPErrorItem) {
        result := ComCall(25, this, "ptr", ppIWMPErrorItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
