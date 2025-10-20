#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IImageDecodeEventSink.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IImageDecodeEventSink2 extends IImageDecodeEventSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImageDecodeEventSink2
     * @type {Guid}
     */
    static IID => Guid("{8ebd8a57-8a96-48c9-84a6-962e2db9c931}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsAlphaPremultRequired"]

    /**
     * 
     * @param {Pointer<BOOL>} pfPremultAlpha 
     * @returns {HRESULT} 
     */
    IsAlphaPremultRequired(pfPremultAlpha) {
        result := ComCall(9, this, "ptr", pfPremultAlpha, "HRESULT")
        return result
    }
}
