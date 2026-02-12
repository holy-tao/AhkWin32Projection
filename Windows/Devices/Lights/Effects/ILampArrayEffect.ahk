#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * The base interface for lamp array effects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.ilamparrayeffect
 * @namespace Windows.Devices.Lights.Effects
 * @version WindowsRuntime 1.4
 */
class ILampArrayEffect extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILampArrayEffect
     * @type {Guid}
     */
    static IID => Guid("{11d45590-57fb-4546-b1ce-863107f740df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ZIndex", "put_ZIndex"]

    /**
     * Gets and sets the front-to-back z-index of a lamp array effect within a collection.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.ilamparrayeffect.zindex
     * @type {Integer} 
     */
    ZIndex {
        get => this.get_ZIndex()
        set => this.put_ZIndex(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ZIndex() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ZIndex(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
