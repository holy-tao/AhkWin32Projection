#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class IDisplayPath2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayPath2
     * @type {Guid}
     */
    static IID => Guid("{f32459c5-e994-570b-9ec8-ef42c35a8547}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PhysicalPresentationRate", "put_PhysicalPresentationRate"]

    /**
     * @type {IReference<DisplayPresentationRate>} 
     */
    PhysicalPresentationRate {
        get => this.get_PhysicalPresentationRate()
        set => this.put_PhysicalPresentationRate(value)
    }

    /**
     * 
     * @returns {IReference<DisplayPresentationRate>} 
     */
    get_PhysicalPresentationRate() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDisplayPresentationRate(), value)
    }

    /**
     * 
     * @param {IReference<DisplayPresentationRate>} value 
     * @returns {HRESULT} 
     */
    put_PhysicalPresentationRate(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
