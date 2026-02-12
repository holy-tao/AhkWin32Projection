#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Preview.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicApplicationPreviewStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicApplicationPreviewStatics
     * @type {Guid}
     */
    static IID => Guid("{fe038691-2a3a-45a9-a208-7bed691919f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsCurrentViewPresentedOnHolographicDisplay", "IsHolographicActivation"]

    /**
     * 
     * @returns {Boolean} 
     */
    IsCurrentViewPresentedOnHolographicDisplay() {
        result := ComCall(6, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {IActivatedEventArgs} activatedEventArgs 
     * @returns {Boolean} 
     */
    IsHolographicActivation(activatedEventArgs) {
        result := ComCall(7, this, "ptr", activatedEventArgs, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
