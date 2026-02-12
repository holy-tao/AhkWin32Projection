#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\RadialControllerIndependentInputSource.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Core
 * @version WindowsRuntime 1.4
 */
class IRadialControllerIndependentInputSourceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRadialControllerIndependentInputSourceStatics
     * @type {Guid}
     */
    static IID => Guid("{3d577ef5-4cee-11e6-b535-001bdc06ab3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateForView"]

    /**
     * 
     * @param {CoreApplicationView} view_ 
     * @returns {RadialControllerIndependentInputSource} 
     */
    CreateForView(view_) {
        result := ComCall(6, this, "ptr", view_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RadialControllerIndependentInputSource(result_)
    }
}
