#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class IImageFeatureDescriptor2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IImageFeatureDescriptor2
     * @type {Guid}
     */
    static IID => Guid("{2b27cca7-d533-5862-bb98-1611b155b0e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PixelRange"]

    /**
     * @type {Integer} 
     */
    PixelRange {
        get => this.get_PixelRange()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PixelRange() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
