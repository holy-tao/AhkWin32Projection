#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.MachineLearning
 * @version WindowsRuntime 1.4
 */
class ILearningModelSessionOptions3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILearningModelSessionOptions3
     * @type {Guid}
     */
    static IID => Guid("{58e15cee-d8c2-56fc-92e8-76d751081086}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OverrideNamedDimension"]

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} dimension 
     * @returns {HRESULT} 
     */
    OverrideNamedDimension(name, dimension) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(6, this, "ptr", name, "uint", dimension, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
