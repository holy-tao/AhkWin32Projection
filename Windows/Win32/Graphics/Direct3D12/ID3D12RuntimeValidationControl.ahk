#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class ID3D12RuntimeValidationControl extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12RuntimeValidationControl
     * @type {Guid}
     */
    static IID => Guid("{c706c811-3663-4bf1-91b9-1e8a7c114ab9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DisableFailuresFromStricterValidationInAppLocalRuntime", "FailuresFromStricterValidationInAppLocalRuntimeDisabled"]

    /**
     * 
     * @param {BOOL} bDisable 
     * @returns {String} Nothing - always returns an empty string
     */
    DisableFailuresFromStricterValidationInAppLocalRuntime(bDisable) {
        ComCall(3, this, "int", bDisable)
    }

    /**
     * 
     * @returns {BOOL} 
     */
    FailuresFromStricterValidationInAppLocalRuntimeDisabled() {
        result := ComCall(4, this, "int")
        return result
    }
}
