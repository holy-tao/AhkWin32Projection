#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDMOQualityControl interface supports quality control on a Microsoft DirectX Media Object (DMO).
 * @see https://docs.microsoft.com/windows/win32/api//mediaobj/nn-mediaobj-idmoqualitycontrol
 * @namespace Windows.Win32.Media.DxMediaObjects
 * @version v4.0.30319
 */
class IDMOQualityControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDMOQualityControl
     * @type {Guid}
     */
    static IID => Guid("{65abea96-cf36-453f-af8a-705e98f16260}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetNow", "SetStatus", "GetStatus"]

    /**
     * 
     * @param {Integer} rtNow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-idmoqualitycontrol-setnow
     */
    SetNow(rtNow) {
        result := ComCall(3, this, "int64", rtNow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-idmoqualitycontrol-setstatus
     */
    SetStatus(dwFlags) {
        result := ComCall(4, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mediaobj/nf-mediaobj-idmoqualitycontrol-getstatus
     */
    GetStatus(pdwFlags) {
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwFlagsMarshal, pdwFlags, "HRESULT")
        return result
    }
}
