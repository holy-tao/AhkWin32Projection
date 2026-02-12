#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Core.AnimationMetrics
 * @version WindowsRuntime 1.4
 */
class IOpacityAnimation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpacityAnimation
     * @type {Guid}
     */
    static IID => Guid("{803aabe5-ee7e-455f-84e9-2506afb8d2b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InitialOpacity", "get_FinalOpacity"]

    /**
     * @type {IReference<Float>} 
     */
    InitialOpacity {
        get => this.get_InitialOpacity()
    }

    /**
     * @type {Float} 
     */
    FinalOpacity {
        get => this.get_FinalOpacity()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_InitialOpacity() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetSingle(), value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FinalOpacity() {
        result := ComCall(7, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
