#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IKnownUserPropertiesStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownUserPropertiesStatics2
     * @type {Guid}
     */
    static IID => Guid("{5b450782-f620-577e-b1b3-dd56644d79b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AgeEnforcementRegion"]

    /**
     * @type {HSTRING} 
     */
    AgeEnforcementRegion {
        get => this.get_AgeEnforcementRegion()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AgeEnforcementRegion() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
