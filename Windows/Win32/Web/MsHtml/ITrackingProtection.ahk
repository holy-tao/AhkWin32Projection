#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ITrackingProtection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITrackingProtection
     * @type {Guid}
     */
    static IID => Guid("{30510803-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EvaluateUrl", "GetEnabled"]

    /**
     * 
     * @param {BSTR} bstrUrl 
     * @param {Pointer<BOOL>} pfAllowed 
     * @returns {HRESULT} 
     */
    EvaluateUrl(bstrUrl, pfAllowed) {
        bstrUrl := bstrUrl is String ? BSTR.Alloc(bstrUrl).Value : bstrUrl

        result := ComCall(3, this, "ptr", bstrUrl, "ptr", pfAllowed, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfEnabled 
     * @returns {HRESULT} 
     */
    GetEnabled(pfEnabled) {
        result := ComCall(4, this, "ptr", pfEnabled, "HRESULT")
        return result
    }
}
