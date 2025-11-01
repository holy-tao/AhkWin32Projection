#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPSyncDevice.ahk

/**
 * The IWMPSyncDevice2 interface provides a method that supplements the IWMPSyncDevice interface.To use this interface, you must create a remoted instance of the Windows Media Player 10 or later control.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpsyncdevice2
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPSyncDevice2 extends IWMPSyncDevice{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPSyncDevice2
     * @type {Guid}
     */
    static IID => Guid("{88afb4b2-140a-44d2-91e6-4543da467cd1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["setItemInfo"]

    /**
     * 
     * @param {BSTR} bstrItemName 
     * @param {BSTR} bstrVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncdevice2-setiteminfo
     */
    setItemInfo(bstrItemName, bstrVal) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(19, this, "ptr", bstrItemName, "ptr", bstrVal, "HRESULT")
        return result
    }
}
