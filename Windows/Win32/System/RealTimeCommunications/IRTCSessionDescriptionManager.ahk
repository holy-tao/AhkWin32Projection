#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCSessionDescriptionManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCSessionDescriptionManager
     * @type {Guid}
     */
    static IID => Guid("{ba7f518e-d336-4070-93a6-865395c843f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EvaluateSessionDescription"]

    /**
     * 
     * @param {BSTR} bstrContentType 
     * @param {BSTR} bstrSessionDescription 
     * @param {Pointer<VARIANT_BOOL>} pfApplicationSession 
     * @returns {HRESULT} 
     */
    EvaluateSessionDescription(bstrContentType, bstrSessionDescription, pfApplicationSession) {
        bstrContentType := bstrContentType is String ? BSTR.Alloc(bstrContentType).Value : bstrContentType
        bstrSessionDescription := bstrSessionDescription is String ? BSTR.Alloc(bstrSessionDescription).Value : bstrSessionDescription

        result := ComCall(3, this, "ptr", bstrContentType, "ptr", bstrSessionDescription, "ptr", pfApplicationSession, "HRESULT")
        return result
    }
}
