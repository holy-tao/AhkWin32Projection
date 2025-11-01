#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMReaderAdvanced4.ahk

/**
 * The IWMReaderAdvanced5 interface enables you to associate a player-hook callback interface with the reader object.An IWMReaderAdvanced5 interface exists for every reader object.
 * @remarks
 * 
  * A player-hook callback can be assigned in the reader object to enable per-sample processing when using DirectX Video Acceleration.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreaderadvanced5
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderAdvanced5 extends IWMReaderAdvanced4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMReaderAdvanced5
     * @type {Guid}
     */
    static IID => Guid("{24c44db0-55d1-49ae-a5cc-f13815e36363}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 49

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPlayerHook"]

    /**
     * 
     * @param {Integer} dwOutputNum 
     * @param {IWMPlayerHook} pHook 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced5-setplayerhook
     */
    SetPlayerHook(dwOutputNum, pHook) {
        result := ComCall(49, this, "uint", dwOutputNum, "ptr", pHook, "HRESULT")
        return result
    }
}
