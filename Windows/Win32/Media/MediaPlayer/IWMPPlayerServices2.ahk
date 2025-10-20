#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPPlayerServices.ahk

/**
 * The IWMPPlayerServices2 interface provides a method used by the host of a remoted Windows Media Player control to manipulate the full mode of the Player.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpplayerservices2
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPPlayerServices2 extends IWMPPlayerServices{
    /**
     * The interface identifier for IWMPPlayerServices2
     * @type {Guid}
     */
    static IID => Guid("{1bb1592f-f040-418a-9f71-17c7512b4d70}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * 
     * @param {BSTR} bstrPriority 
     * @returns {HRESULT} 
     */
    setBackgroundProcessingPriority(bstrPriority) {
        bstrPriority := bstrPriority is String ? BSTR.Alloc(bstrPriority).Value : bstrPriority

        result := ComCall(6, this, "ptr", bstrPriority, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
