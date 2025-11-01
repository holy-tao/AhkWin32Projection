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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_error"]

    /**
     * 
     * @param {Pointer<IWMPErrorItem>} ppIWMPErrorItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpmedia2-get_error
     */
    get_error(ppIWMPErrorItem) {
        result := ComCall(25, this, "ptr*", ppIWMPErrorItem, "HRESULT")
        return result
    }
}
