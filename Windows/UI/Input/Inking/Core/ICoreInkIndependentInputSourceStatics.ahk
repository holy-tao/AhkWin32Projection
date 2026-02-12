#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\CoreInkIndependentInputSource.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking.Core
 * @version WindowsRuntime 1.4
 */
class ICoreInkIndependentInputSourceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICoreInkIndependentInputSourceStatics
     * @type {Guid}
     */
    static IID => Guid("{73e6011b-80c0-4dfb-9b66-10ba7f3f9c84}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {InkPresenter} inkPresenter_ 
     * @returns {CoreInkIndependentInputSource} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(inkPresenter_) {
        result := ComCall(6, this, "ptr", inkPresenter_, "ptr*", &inkIndependentInputSource := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CoreInkIndependentInputSource(inkIndependentInputSource)
    }
}
