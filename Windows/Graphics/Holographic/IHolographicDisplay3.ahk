#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HolographicViewConfiguration.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicDisplay3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicDisplay3
     * @type {Guid}
     */
    static IID => Guid("{fc4c6ac6-6480-5008-b29e-157d77c843f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryGetViewConfiguration"]

    /**
     * 
     * @param {Integer} kind 
     * @returns {HolographicViewConfiguration} 
     */
    TryGetViewConfiguration(kind) {
        result := ComCall(6, this, "int", kind, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HolographicViewConfiguration(result_)
    }
}
