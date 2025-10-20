#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFPluginControl.ahk

/**
 * Controls how media sources and transforms are enumerated in Microsoft Media Foundation.
 * @remarks
 * 
  * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfgetplugincontrol">MFGetPluginControl</a>  and query the returned pointer for <b>IMFPluginControl2</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfplugincontrol2
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFPluginControl2 extends IMFPluginControl{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFPluginControl2
     * @type {Guid}
     */
    static IID => Guid("{c6982083-3ddc-45cb-af5e-0f7a8ce4de77}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPolicy"]

    /**
     * 
     * @param {Integer} policy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfplugincontrol2-setpolicy
     */
    SetPolicy(policy) {
        result := ComCall(9, this, "int", policy, "HRESULT")
        return result
    }
}
