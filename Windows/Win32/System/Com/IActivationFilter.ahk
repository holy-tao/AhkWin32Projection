#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IActivationFilter extends IUnknown{
    /**
     * The interface identifier for IActivationFilter
     * @type {Guid}
     */
    static IID => Guid("{00000017-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwActivationType 
     * @param {Pointer<Guid>} rclsid 
     * @param {Pointer<Guid>} pReplacementClsId 
     * @returns {HRESULT} 
     */
    HandleActivation(dwActivationType, rclsid, pReplacementClsId) {
        result := ComCall(3, this, "uint", dwActivationType, "ptr", rclsid, "ptr", pReplacementClsId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
