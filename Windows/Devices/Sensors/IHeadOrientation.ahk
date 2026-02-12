#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IHeadOrientation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHeadOrientation
     * @type {Guid}
     */
    static IID => Guid("{519f54a9-513e-55e8-9c35-3e8da21dee69}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RollInDegrees", "get_PitchInDegrees", "get_YawInDegrees"]

    /**
     * @type {IReference<Float>} 
     */
    RollInDegrees {
        get => this.get_RollInDegrees()
    }

    /**
     * @type {IReference<Float>} 
     */
    PitchInDegrees {
        get => this.get_PitchInDegrees()
    }

    /**
     * @type {IReference<Float>} 
     */
    YawInDegrees {
        get => this.get_YawInDegrees()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_RollInDegrees() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_PitchInDegrees() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_YawInDegrees() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }
}
