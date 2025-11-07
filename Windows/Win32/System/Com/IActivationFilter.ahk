#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IActivationFilter extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HandleActivation"]

    /**
     * 
     * @param {Integer} dwActivationType 
     * @param {Pointer<Guid>} rclsid 
     * @returns {Guid} 
     */
    HandleActivation(dwActivationType, rclsid) {
        pReplacementClsId := Guid()
        result := ComCall(3, this, "uint", dwActivationType, "ptr", rclsid, "ptr", pReplacementClsId, "HRESULT")
        return pReplacementClsId
    }
}
