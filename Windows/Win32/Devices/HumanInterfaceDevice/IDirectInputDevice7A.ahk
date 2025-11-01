#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirectInputDevice2A.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 * @charset ANSI
 */
class IDirectInputDevice7A extends IDirectInputDevice2A{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectInputDevice7A
     * @type {Guid}
     */
    static IID => Guid("{57d7c6bc-2356-11d3-8e9d-00c04f6844ae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 27

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumEffectsInFile", "WriteEffectToFile"]

    /**
     * 
     * @param {PSTR} param0 
     * @param {Pointer<LPDIENUMEFFECTSINFILECALLBACK>} param1 
     * @param {Pointer<Void>} param2 
     * @param {Integer} param3 
     * @returns {HRESULT} 
     */
    EnumEffectsInFile(param0, param1, param2, param3) {
        result := ComCall(27, this, "ptr", param0, "ptr", param1, "ptr", param2, "uint", param3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} param0 
     * @param {Integer} param1 
     * @param {Pointer<DIFILEEFFECT>} param2 
     * @param {Integer} param3 
     * @returns {HRESULT} 
     */
    WriteEffectToFile(param0, param1, param2, param3) {
        result := ComCall(28, this, "ptr", param0, "uint", param1, "ptr", param2, "uint", param3, "HRESULT")
        return result
    }
}
