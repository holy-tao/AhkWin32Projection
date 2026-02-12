#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ActivatedDeferral.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class IActivatedOperation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActivatedOperation
     * @type {Guid}
     */
    static IID => Guid("{b6a0b4bc-c6ca-42fd-9818-71904e45fed7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeferral"]

    /**
     * 
     * @returns {ActivatedDeferral} 
     */
    GetDeferral() {
        result := ComCall(6, this, "ptr*", &deferral_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ActivatedDeferral(deferral_)
    }
}
