#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class IDisplayInformation3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDisplayInformation3
     * @type {Guid}
     */
    static IID => Guid("{db15011d-0f09-4466-8ff3-11de9a3c929a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DiagonalSizeInInches"]

    /**
     * @type {IReference<Float>} 
     */
    DiagonalSizeInInches {
        get => this.get_DiagonalSizeInInches()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_DiagonalSizeInInches() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }
}
