#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HolographicSpace.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicSpaceStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicSpaceStatics
     * @type {Guid}
     */
    static IID => Guid("{364e6064-c8f2-3ba1-8391-66b8489e67fd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateForCoreWindow"]

    /**
     * 
     * @param {CoreWindow} window_ 
     * @returns {HolographicSpace} 
     */
    CreateForCoreWindow(window_) {
        result := ComCall(6, this, "ptr", window_, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HolographicSpace(value)
    }
}
