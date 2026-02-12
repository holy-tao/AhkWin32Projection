#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\UnsupportedAppRequirement.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System.Profile
 * @version WindowsRuntime 1.4
 */
class IAppApplicabilityStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppApplicabilityStatics
     * @type {Guid}
     */
    static IID => Guid("{1664a082-0f38-5c99-83e4-48995970861c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUnsupportedAppRequirements"]

    /**
     * 
     * @param {IIterable<HSTRING>} capabilities 
     * @returns {IVectorView<UnsupportedAppRequirement>} 
     */
    GetUnsupportedAppRequirements(capabilities) {
        result := ComCall(6, this, "ptr", capabilities, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(UnsupportedAppRequirement, result_)
    }
}
