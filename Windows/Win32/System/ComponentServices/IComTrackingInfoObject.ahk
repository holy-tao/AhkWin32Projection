#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Retrieves the properties of a tracking information object.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-icomtrackinginfoobject
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IComTrackingInfoObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComTrackingInfoObject
     * @type {Guid}
     */
    static IID => Guid("{116e42c5-d8b1-47bf-ab1e-c895ed3e2372}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetValue"]

    /**
     * 
     * @param {PWSTR} szPropertyName 
     * @param {Pointer<VARIANT>} pvarOut 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomtrackinginfoobject-getvalue
     */
    GetValue(szPropertyName, pvarOut) {
        szPropertyName := szPropertyName is String ? StrPtr(szPropertyName) : szPropertyName

        result := ComCall(3, this, "ptr", szPropertyName, "ptr", pvarOut, "HRESULT")
        return result
    }
}
