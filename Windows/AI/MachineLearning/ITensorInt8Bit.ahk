#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ITensorInt8Bit extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITensorInt8Bit
     * @type {Guid}
     */
    static IID => Guid("{cddd97c5-ffd8-4fef-aefb-30e1a485b2ee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAsVectorView"]

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    GetAsVectorView() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetByte(), result_)
    }
}
