#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RadialControllerScreenContact.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IRadialControllerRotationChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRadialControllerRotationChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{206aa435-e651-11e5-bf62-2c27d7404e85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RotationDeltaInDegrees", "get_Contact"]

    /**
     * @type {Float} 
     */
    RotationDeltaInDegrees {
        get => this.get_RotationDeltaInDegrees()
    }

    /**
     * @type {RadialControllerScreenContact} 
     */
    Contact {
        get => this.get_Contact()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationDeltaInDegrees() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RadialControllerScreenContact} 
     */
    get_Contact() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RadialControllerScreenContact(value)
    }
}
